<%-- 
    Document   : viewcart
    Created on : Jun 17, 2024, 2:01:21 PM
    Author     : Admin
--%>

<%@page import="java.util.Map"%>
<%@page import="datvm.cart.CartBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Market</title>
    </head>
    <body>
        <h1>Your cart includes</h1>
        <% 
            //1. Cust goes to cart place
            if (session != null){
                //2. Cust takes cart
                CartBean cart = (CartBean)session.getAttribute("CART");
                if(cart != null){ //co cart thi moi view dc
                    //3. Cust gets items
                    Map<String, Integer> items = cart.getItems();
                    if(items != null){
                        //4. Cust shows all item
                        %>
                        <form action="DispatchServlet">
                            <table border = "1">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Name</th>
                                        <th>Quantity</th>
                                        <th>Action</th>
                                    </tr>
                                    
                                </thead>
                                <tbody>
                                    <%
                                        int count = 0;
                                        for(String key : items.keySet()){
                                            %>
                                                <tr>
                                                    <td>
                                                        <%= ++count %>
                                                    </td>
                                                    <td>
                                                        <%= key %>
                                                    </td>
                                                    <td>
                                                        <%= items.get(key) %>
                                                    </td>
                                                    <td>
                                                        <input type="checkbox" name="chkItem" value=<%= key %> />
                                                    </td>
                                                </tr>
                                            <%
                                        }
                                    %>
                                    <tr>
                                        <td colspan="3">
                                            <a href="showBookProductServlet">Add more books to your Cart</a>
                                        </td>
                                        <td>
                                            <input type="submit" value="Remove" name="btAction" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>    
                        <%
                        return;
                    }
                }  
            }
        %>
        
        <h2>
            <font color = "red">
                No cart is existed!!!
            </font>
        </h2>
    </body>
</html>
