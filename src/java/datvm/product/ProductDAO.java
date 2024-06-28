/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datvm.product;

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
public class ProductDAO implements Serializable{
    private List<ProductDTO> products;

    public List<ProductDTO> getProducts() {
        return products;
    }
    
    public List showProducts() throws SQLException, /*ClassNotFoundException*/ NamingException{
        
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
        //1.Connect DB          b11 connect
            con = DBHelper.getConnection();
        //2. Create SQL String
            String sql = "select sku, name, description, quantity, price, status "
                    + "from tbl_Product ";
        //3. Create Statement Obj
            stm = con.prepareStatement(sql);
        //4. Execute querry
            rs = stm.executeQuery();
        //5. Process result     b13 mapped
            while ( rs.next() ){
                int sku = rs.getInt("sku");
                String name = rs.getString("name");
                String description = rs.getString("description");
                int quantity = rs.getInt("quantity");
                float price = rs.getFloat("price");
                boolean status = rs.getBoolean("status");
                ProductDTO dto = new ProductDTO(sku, name, description, quantity, price, status);
                if(this.products == null){
                    this.products = new ArrayList<>();
                }
                this.products.add(dto);
            }
            
        } finally {
            if (rs != null){
                rs.close();
            }
            if ( stm != null){
                stm.close();
            }
            if (con != null){
                con.close();
            }
        }
        
        return products;
    }
    
    public ProductDTO getProduct(String itemName) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ProductDTO dto = null;
        try {
        //1.Connect DB          b11 connect
            con = DBHelper.getConnection();
        //2. Create SQL String
            String sql = "select sku, name, description, quantity, price, status "
                    + "from tbl_Product "
                    + "where name = ? ";
            
        //3. Create Statement Obj
            stm = con.prepareStatement(sql);
            stm.setString(1, itemName);
        //4. Execute querry
            rs = stm.executeQuery();
            
        //5. Process result     b13 mapped
            if ( rs.next() ){
              //map
              //get data from result set
              int sku = rs.getInt("sku");
              String name = rs.getString("name");
              String description = rs.getString("description");
              int quantity = rs.getInt("quantity");
              float price = rs.getFloat("price");     
              boolean status = rs.getBoolean("status");
              //set data to DTO properties
               dto = new ProductDTO(sku, name, description, quantity, price, status);
              
              
              
            } // 
            
        } finally {
            if (rs != null){
                rs.close();
            }
            if ( stm != null){
                stm.close();
            }
            if (con != null){
                con.close();
            }
        }
        return dto;
        
    }
}
