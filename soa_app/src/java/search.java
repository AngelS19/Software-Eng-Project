/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class search extends HttpServlet {
Connection conn;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            String jdbcClassName = (String)session.getAttribute("jdbcClassName");
            String dbUserName = (String)session.getAttribute("dbUserName");
            String dbPassword = (String)session.getAttribute("dbPassword");
            String jdbcDriverURL = (String)session.getAttribute("jdbcDriverURL");
            String dbHostName = (String)session.getAttribute("dbHostName");
            String dbPort = (String)session.getAttribute("dbPort");
            String databaseName = (String)session.getAttribute("databaseName");
            
            model model1 = new model(); 
            conn = model1.Connection(jdbcClassName, dbUserName, dbPassword,jdbcDriverURL,dbHostName, dbPort, databaseName);
            

            String button = request.getParameter("button-search");
            if(conn != null){
                if(button.equals("Date Search")){
                    String date1 = request.getParameter("Date1");
                    String date2 = request.getParameter("Date2");
                    session.setAttribute("Date1",date1);
                    session.setAttribute("Date2",date2);
                    request.getRequestDispatcher("forgot_pass.jsp").forward(request,response); 
                }
                else if(button.equals("Reference Search")){
                    request.getRequestDispatcher("newjsp.jsp").forward(request,response); 
                }
                else if(button.equals("Client Search")){

                }
                else if(button.equals("Edit")){
                    String value = request.getParameter("maind-id");
                    session.setAttribute("Value",value);

                    request.getRequestDispatcher("forgot_pass.jsp").forward(request,response); 
                }
                else{
                    request.getRequestDispatcher("index.jsp").forward(request,response);     
                }
            }
            else{
                request.getRequestDispatcher("index.jsp").forward(request,response);
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
