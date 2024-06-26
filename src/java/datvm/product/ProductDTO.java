/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datvm.product;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class ProductDTO implements Serializable{
    protected int sku;
    protected String name;
    protected String description;
    protected int quantity;
    protected float price;
    protected boolean status;

    public ProductDTO() {
    }

    public ProductDTO(int sku, String name, String description, int quantity, float price, boolean status) {
        this.sku = sku;
        this.name = name;
        this.description = description;
        this.quantity = quantity;
        this.price = price;
        this.status = status;
    }

    public int getSku() {
        return sku;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public int getQuantity() {
        return quantity;
    }

    public float getPrice() {
        return price;
    }

    public boolean isStatus() {
        return status;
    }

    public void setSku(int sku) {
        this.sku = sku;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    
    
    
}
