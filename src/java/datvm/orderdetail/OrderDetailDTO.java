/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datvm.orderdetail;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class OrderDetailDTO implements Serializable {
    private int productId;
    private String productName;
    private float unitPrice;
    private int quantity;
    private String orderId;
    private float total;

    public OrderDetailDTO(int productId, String productName, float unitPrice, int quantity, String orderId, float total) {
        this.productId = productId;
        this.productName = productName;
        this.unitPrice = unitPrice;
        this.quantity = quantity;
        this.orderId = orderId;
        this.total = total;
    }

    public int getProductId() {
        return productId;
    }
    
    public String getProductName() {
        return productName;
    }

    public float getUnitPrice() {
        return unitPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public String getOrderId() {
        return orderId;
    }

    public float getTotal() {
        return total;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }
    
    public void setUnitPrice(float unitPrice) {
        this.unitPrice = unitPrice;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public void setTotal(float total) {
        this.total = total;
    }
    
    
}
