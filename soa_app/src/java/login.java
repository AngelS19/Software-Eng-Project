
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class login extends HttpServlet {
    Connection conn;
    String jdbcClassName;
    String dbUserName;
    String dbPassword;
    String jdbcDriverURL;
    String dbHostName;
    String dbPort;
    String databaseName;
    
public void init(ServletConfig config) throws ServletException {
            super.init(config);
            
            jdbcClassName = config.getInitParameter("jdbcClassName");
            dbUserName = config.getInitParameter("dbUserName");
            dbPassword = config.getInitParameter("dbPassword");
            jdbcDriverURL = config.getInitParameter("jdbcDriverURL");
            dbHostName = config.getInitParameter("dbHostName");
            dbPort = config.getInitParameter("dbPort");
            databaseName = config.getInitParameter("databaseName");   
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            session.setAttribute("jdbcClassName", jdbcClassName);
            session.setAttribute("dbUserName", dbUserName);
            session.setAttribute("dbPassword", dbPassword);
            session.setAttribute("jdbcDriverURL", jdbcDriverURL);
            session.setAttribute("dbHostName", dbHostName);
            session.setAttribute("dbPort", dbPort);
            session.setAttribute("databaseName", databaseName);
            
            model model1 = new model(); 
            conn = model1.Connection(jdbcClassName, dbUserName, dbPassword,jdbcDriverURL,dbHostName, dbPort, databaseName);

            String loginuser = request.getParameter("loginuser");
            String loginpass = request.getParameter("loginpass");
            ResultSet verify = model1.Verify(conn,loginuser);
            String encryptedpass = model1.getPass(conn, loginuser);
            
            if(conn == null){
                response.sendRedirect("forgot_pass.jsp");   
            }
            else if(verify == null){
                response.sendRedirect("forgot_pass.jsp");   
            }
            else if(!loginpass.equals(encryptedpass)){
                response.sendRedirect("forgot_pass.jsp");   
            }
            else{
                response.sendRedirect("homepage.jsp");
            }

    }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
