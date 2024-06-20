/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datvm.registration;

import datvm.util.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
public class RegistrationDAO implements Serializable{
    public boolean checkLogin(String username, String password) throws SQLException, /*ClassNotFoundException*/ NamingException{
        
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean result = false;
        
        try {
        //1.Connect DB          b11 connect
            con = DBHelper.getConnection();
        //2. Create SQL String
            String sql = "select username "
                    + "from Users "
                    + "where username = ? "
                    + "and password = ?";
        //3. Create Statement Obj
            stm = con.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
        //4. Execute querry
            rs = stm.executeQuery();
        //5. Process result     b13 mapped
            if ( rs.next() ){
                result = true; 
            } // end username and password are verifited
            
        } finally {
            if (rs != null){
                rs.close();
            }
            if ( stm != null){
                stm.close();;
            }
            if (con != null){
                con.close();
            }
        }
        
        return result;
    }
    
    private List<RegistrationDTO> accounts;

    public List<RegistrationDTO> getAccounts() {
        return accounts;
    }
    
    public List searchLastName(String searchValue)throws SQLException, /*ClassNotFoundException*/ NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean result = false;
        
        try {
        //1.Connect DB          b11 connect
            con = DBHelper.getConnection();
            
        //2. Create SQL String
            String sql = "select username, password, lastname, isAdmin "
                    + "from Users "
                    + "where lastname LIKE ? ";
            
        //3. Create Statement Obj
            stm = con.prepareStatement(sql);
            stm.setString(1, "%" + searchValue + "%");
            
        //4. Execute querry
            rs = stm.executeQuery();
            
        //5. Process result     b13 mapped
            while ( rs.next() ){
              //map
              //get data from result set
              String username = rs.getString("username");
              String password = rs.getString("password");
              String lastname = rs.getString("lastname");
              boolean role = rs.getBoolean("isAdmin");
              //set data to DTO properties
              RegistrationDTO dto = new RegistrationDTO(username, password, lastname, role);
              if (this.accounts == null){
                  this.accounts = new ArrayList<>();
              }
              this.accounts.add(dto);
            } // 
            
        } finally {
            if (rs != null){
                rs.close();
            }
            if ( stm != null){
                stm.close();;
            }
            if (con != null){
                con.close();
            }
        }
        
        return accounts;
    }
    
    public boolean deleteAcount(String username) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean result = false;
        
        try {
        //1.Connect DB          b11 connect
            con = DBHelper.getConnection();
        //2. Create SQL String
            String sql = "delete "
                    + "from Users "
                    + "where username = ? " ;
        //3. Create Statement Obj
            stm = con.prepareStatement(sql);
            stm.setString(1, username);
        //4. Execute querry
            int affectedRow = stm.executeUpdate();
        //5. Process result     b13 mapped
            if (affectedRow > 0){
                result = true;
            }
        // end username and password are verifited
            
        } finally {
            if (rs != null){
                rs.close();
            }
            if ( stm != null){
                stm.close();;
            }
            if (con != null){
                con.close();
            }
        }
        
        return result;
    }
    
    public boolean updateAccount(String username, String password, boolean role) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;
        
        try {
        //1.Connect DB          b11 connect
            con = DBHelper.getConnection();
        //2. Create SQL String
            String sql = "UPDATE Users "
                    + "SET password = ?, isAdmin = ? "
                    + "WHERE username = ? " ;
        //3. Create Statement Obj
            stm = con.prepareStatement(sql);
            stm.setString(1, password);
            stm.setBoolean(2, role);
            stm.setString(3, username);
        //4. Execute querry
            int affectedRow = stm.executeUpdate();
        //5. Process result     b13 mapped
            if (affectedRow > 0){
                result = true;
            }
        // end username and password are verifited
            
        } finally {
            if ( stm != null){
                stm.close();;
            }
            if (con != null){
                con.close();
            }
        }
        
        return result;
    }
    
    
}
