
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
    
        public ResultSet SelectHomeValue(Connection conn){
        try{
            String query = "SELECT overview.soa_num, overview.soa_date, overview.cust_name, payment_info.or_num, payment_info.payable, payment_info.payment_stat, payment_info.payment_date, overview.username FROM soa_table.main_info join soa_table.overview on main_info.soa_num = overview.soa_num join soa_table.payment_info on payment_info.soa_num = overview.soa_num";
            PreparedStatement ps = conn.prepareStatement(query,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
//            ps.setString(1, usern);
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
        
            public ResultSet SelectAll(Connection conn){
        try{
            String query = "SELECT * from main_info";
            PreparedStatement ps = conn.prepareStatement(query,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
    
    
}
