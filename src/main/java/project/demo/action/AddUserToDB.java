package project.demo.action;

import java.sql.Statement;

import com.opensymphony.xwork2.ActionSupport;

import project.demo.model.Account;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class AddUserToDB extends ActionSupport {

    private Account accountBean;
    private String error = "";


    public String execute() throws SQLException {
        accountBean = getAccountBean();
        
        if(saveToDB()) {
            return SUCCESS;
        } else {
            return ERROR;
        }
    
    }

    private String encryptPassword(String password) throws NoSuchAlgorithmException {
        /* MessageDigest instance for hashing using SHA256 */  
        MessageDigest md = MessageDigest.getInstance("SHA-256");  
        /* digest() method called to calculate message digest of ’text’ and return array of byte */  
        byte[] hash = md.digest(password.getBytes(StandardCharsets.UTF_8));  
        /* The bytes array has bytes in decimal form. Convert it into hexadecimal format. */  
        StringBuilder s = new StringBuilder();  
        for(int i=0; i<  hash.length; i++)  
        {  
                s.append(Integer.toString((hash[i] & 0xff) + 0x100, 16).substring(1));  
        }  
        /* Complete hashed text in hexadecimal format */  
        return s.toString(); 
    }
    
    public boolean saveToDB() throws SQLException {
        Connection connection = null;
        Statement statement = null;

        try {
            String URL = "jdbc:mysql://localhost:3306/sampledb?useTimezone=true&serverTimezone=UTC";
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(URL, "root", "password");

            if(connection != null) {
                statement = connection.createStatement();
                String sql = "INSERT INTO ACCOUNTS(username, password, first_name, last_name, email) " +
                    "VALUES('"+accountBean.getUsername()+"','"+encryptPassword(accountBean.getPassword())+"','"+
                    accountBean.getFirstName()+"','"+accountBean.getLastName()+"','" +
                    accountBean.getEmail()+"')";
                statement.executeUpdate(sql);
                return true;
            } else {
                error = "DB connection failed";
                return false;
            }
         } catch (Exception e) {
             error = e.toString();
             return false;  
         } finally {
            if (statement != null) try { statement.close(); } catch (SQLException ignore) {}
            if (connection != null) try { connection.close(); } catch (SQLException ignore) {}
         }
    }

    public String getError() {
        return error;
    }
    
    public Account getAccountBean() {
        return accountBean;
    }
    
    public void setAccountBean(Account account) {
        accountBean = account;
    }
}
