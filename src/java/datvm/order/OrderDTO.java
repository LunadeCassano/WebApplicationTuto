/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datvm.order;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author Admin
 */
public class OrderDTO implements Serializable{
    private String id;
//    private String date;
    private String customer;
    private String address;
    private String email;
    private float total;

    public OrderDTO() {
    }

//    public OrderDTO(String id, String date, String customer, String address, String email, float total) {
    public OrderDTO(String id, String customer, String address, String email, float total) {
        this.id = id;
//        this.date = date;
        this.customer = customer;
        this.address = address;
        this.email = email;
        this.total = total;
    }

    public String getId() {
        return id;
    }

//    public String getDate() {
//        return date;
//    }

    public String getCustomer() {
        return customer;
    }

    public String getAddress() {
        return address;
    }

    public String getEmail() {
        return email;
    }

    public float getTotal() {
        return total;
    }

    public void setId(String id) {
        this.id = id;
    }

//    public void setDate(String date) {
//        this.date = date;
//    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setTotal(float total) {
        this.total = total;
    }
    
    
}
