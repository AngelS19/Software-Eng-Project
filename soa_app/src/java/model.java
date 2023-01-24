
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class model {
        public Connection Connection(String jdbcClassName,String dbUserName, String dbPassword, String jdbcDriverURL, String dbHostName, String dbPort, String databaseName ){
        Connection conn = null;
        try {	
                    Class.forName(jdbcClassName);
                    //System.out.println("jdbcClassName: " + config.getInitParameter("jdbcClassName"));
                    String username = dbUserName;
                    String password = dbPassword;
                    StringBuffer url = new StringBuffer(jdbcDriverURL)
                            .append("://")
                            .append(dbHostName)
                            .append(":")
                            .append(dbPort)
                            .append("/")
                            .append(databaseName);
                    conn = 
                      DriverManager.getConnection(url.toString(),username,password);
            } catch (SQLException sqle){
                    System.out.println("SQLException error occured - " 
                            + sqle.getMessage());
            } catch (ClassNotFoundException nfe){
                    System.out.println("ClassNotFoundException error occured - " 
                    + nfe.getMessage());
            }
        return conn;
    }
        
    public ResultSet Verify(Connection conn,String uname){
        
        try{
            String query = "SELECT * FROM user_accounts WHERE username = ?";
            PreparedStatement ps = conn.prepareStatement(query,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ps.setString(1, uname);
            ResultSet records = ps.executeQuery();
            if(records.next()){
               records.beforeFirst();
               return records;
            }
            }
        catch(SQLException sqle){
            sqle.printStackTrace();
        }
        return null;
    }
    
    public String getPass(Connection conn,String uname){
            String pass = null;
          try{
            String query = "SELECT password FROM user_accounts WHERE username = ?";
            PreparedStatement ps = conn.prepareStatement(query,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ps.setString(1, uname);
            ResultSet records = ps.executeQuery();
            if(records.next()){
                pass = (String)records.getString("password");
                return pass;
            }
            }
        catch(SQLException sqle){
            sqle.printStackTrace();
        }
        return pass;
    }
}
