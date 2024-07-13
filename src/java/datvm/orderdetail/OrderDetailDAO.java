/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datvm.orderdetail;

import datvm.util.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
public class OrderDetailDAO implements Serializable{
    public boolean addOrderDetail(OrderDetailDTO dto) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean result = false;
        try{
            //1. get connection
            con = DBHelper.getConnection();
            if(con != null){
                //2. create sql string
                String sql = "insert into OrderDetail ("
                        + "productid, unitprice, quantity, orderid, total"
                        + ") "
                        + "values ("
                        + "?, ?, ?, ?, ?"
                        + ")";
                //3. create stm
                stm = con.prepareStatement(sql);
                stm.setInt(1, dto.getProductId());
                stm.setFloat(2, dto.getUnitPrice());
                stm.setInt(3, dto.getQuantity());
                stm.setString(4, dto.getOrderId());
                stm.setFloat(5, dto.getTotal());
                //4. execute 
                int affectedRows = stm.executeUpdate();
                //5. process
                if(affectedRows != 0){
                    result = true;
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
        return result;
    }
}
