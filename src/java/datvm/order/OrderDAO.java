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
import java.sql.Date;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
public class OrderDAO implements Serializable{
    public int getLastOrderIntegerId() throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int id = 0;
        try{
            //1. get connection
            con = DBHelper.getConnection();
            if (con != null){
                //2. create query String
                String sql = "select top 1 id "
                        + "from Orders "
                        + "order by id desc";
                //3. create stm
                stm = con.prepareStatement(sql);
                //4. executequery
                rs = stm.executeQuery();
                //5. process result
                if(rs.next()){
                    String orderId = rs.getString("id");
                    String threeLastChar = orderId.substring(2);
                    id = Integer.parseInt(threeLastChar);
                }
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
        
        return id;
    }
    
    public String createOrder(OrderDTO dto) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        String rs = "Od001";
        int count = getLastOrderIntegerId();
        String id = String.format("Od%03d", ++count);
        Date date = new Date(System.currentTimeMillis());
        try{
            //1. get Connection
            con = DBHelper.getConnection();
            if(con != null){
                //2. Create query String
                String sql = "insert into Orders(id, date, customer, address, email, total) "
                        + "values (?, ?, ?, ?, ?, ?)";
                //3. Create stm
                stm = con.prepareStatement(sql);
                stm.setString(1, id);
                stm.setDate(2, date);
                stm.setString(3, dto.getCustomer());
                stm.setString(4, dto.getAddress());
                stm.setString(5, dto.getEmail());
                stm.setFloat(6, dto.getTotal());
                //4. execute query
                int result = stm.executeUpdate();
                //5. process rs
                if(result != 0){
                    rs = id;
                }
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
