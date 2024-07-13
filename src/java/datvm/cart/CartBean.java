/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datvm.cart;

import datvm.order.OrderDAO;
import datvm.order.OrderDTO;
import datvm.orderdetail.OrderDetailDAO;
import datvm.orderdetail.OrderDetailDTO;
import datvm.product.ProductDAO;
import datvm.product.ProductDTO;
import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
public class CartBean implements Serializable{
    private Map<String, Integer> items; //ngan chua do

    public Map<String, Integer> getItems() {
        return items;
    }
    
    public void addItemToCart(String item, int quantity){ //item la mon do
        if (item == null){
            return;
        }
        if(item.trim().isEmpty()){
            return;
        }
        //1. check existed items
        if(this.items == null){
            this.items = new HashMap<>();
        }
        //2. check existed item
        int itemQuantity = quantity;
        if(this.items.containsKey(item)){
            itemQuantity = this.items.get(item) + quantity;
        }
        //3. drop item to items
        this.items.put(item, itemQuantity);
    }
    
    public void removeItemFromCart(String item){
        if (item == null){
            return;
        }
        if(item.trim().isEmpty()){
            return;
        }
        //1. check existed items
        if(this.items == null){
            return;
        }
        //2. check existed item
        if(this.items.containsKey(item)){
            //3. remove item from items
            this.items.remove(item);
            if(this.items.isEmpty()){
                this.items = null;  //gan null khi khong co phan tu nao trong collection de lan sau chi can 
                                    //kiem tra != null se biet duoc ben trong co phan tu hay khong
            }
        }
    }
    
    public int getQuantityByName(String name){
        if (name == null || name.trim().isEmpty()){
            return 0;
        }
        if (this.items == null){
            return 0;
        }
        int quantity = 0;
        if(this.items.containsKey(name)){
            quantity = this.items.get(name);
        }
        return quantity;
    }
    
    public float totalPayment(CartBean cart) throws SQLException, NamingException{
        float total = 0;
        //get each key
        for (String key : cart.getItems().keySet()) {
            ProductDTO dto = null;
            ProductDAO dao = new ProductDAO();
            //get dto
            dto = dao.getProduct(key);
            //total = price * quantity
            total += dto.getPrice() * cart.getItems().get(key);
        }
        return total ;
    }
    
    public List<OrderDetailDTO> addCheckOutInformation(OrderDTO dto, Map<String, Integer> item) throws SQLException, NamingException{
        List<OrderDetailDTO> list = new ArrayList<>();
        OrderDAO orderDao = new OrderDAO();
        String orderId = orderDao.createOrder(dto);
        if (orderId != null){
            ProductDAO pdao = new ProductDAO();
            ProductDTO pdto = new ProductDTO();
            OrderDetailDAO odDao = new OrderDetailDAO();
            int quantity;
            float price;
            float total;
            for (String itemName : item.keySet()){
                pdto = pdao.getProduct(itemName);
                quantity = getQuantityByName(itemName);
                price = pdto.getPrice();
                total = quantity * price;
                OrderDetailDTO odDto = new OrderDetailDTO(pdto.getSku(), itemName, pdto.getPrice(), quantity, orderId, total);
                if(odDao.addOrderDetail(odDto)){
                    list.add(odDto);
                }
            }
        }
        return list;
    }
}
