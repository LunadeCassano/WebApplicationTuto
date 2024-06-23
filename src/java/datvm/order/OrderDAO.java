/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datvm.order;

import datvm.util.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
public class OrderDAO implements Serializable{
    public boolean checkExistedOrderId(String orderId) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean result = false;
        try{
            //1. getConnection
            con = DBHelper.getConnection();
            //2. create sql String
            String sql = "SELECT id "
                    + "FROM tbl_Order "
                    + "WHERE id = ?";
            //3. create stm
            stm = con.prepareStatement(sql);
            stm.setString(1, orderId);
            //4. executeQuery
            stm.executeQuery();
            //5. process rs
            if(rs.next()){
                result = true;
            }
        }finally{
            if(rs != null){
                rs.close();
            }
            if(stm != null){
                stm.close();
            }
            
            if(con != null){
                con.close();
            }
        }
        return result;
    }
    
    public String createOrder(String custName, String address, String email, String[] item) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        String rs = null;
        try{
            int count = 1;
            String orderId = String.format("Od%03d", count);
            while(!checkExistedOrderId(orderId)){
                count++;
                orderId = String.format("Od%03d", count);
            }
            //1. connect DB
            con = DBHelper.getConnection();
            //2. create sql String
            String sql = "INSERT INTO tbl_Order(id, date, customer, address, email) "
                    + "VALUES (?, ?, ?, ?, ?)";
            //3. Create Statement Obj
            stm = con.prepareStatement(sql);
            stm.setString(1, orderId);
            stm.setString(2, new Date().toLocaleString());
            stm.setString(3, custName);
            stm.setString(4, address);
            stm.setString(5, email);
            //4. Execute query
            int affectedRow = stm.executeUpdate();
            //5. process result (mapped)
            if(affectedRow > 0){
                rs = orderId;
            }
        }finally{
            
            if(stm != null){
                stm.close();
            }
            
            if(con != null){
                con.close();
            }
        }
        return rs;
    }
}
