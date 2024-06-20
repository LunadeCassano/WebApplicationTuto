/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datvm.cart;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

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
}
