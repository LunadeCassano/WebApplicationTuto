<%-- 
    Document   : viewcart
    Created on : Jun 17, 2024, 2:01:21 PM
    Author     : Admin
--%>

<%@page import="java.util.Map"%>
<%@page import="datvm.cart.CartBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Market</title>
    </head>
    <body>
        <h1>Your cart includes</h1>
        <c:set var="cart" value="${sessionScope.CART}"/>
        <c:if test="${not empty cart}">
            <c:set var="items" value="${cart.items}"/>
            <c:if test="${not empty items}">
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
                            <c:forEach var="item" items="${items}" varStatus="count">
                                <c:set var="key" value="${item.key}"/>
                                <c:set var="quantity" value="${item.value}"/>
                                <tr>
                                    <td>
                                        ${count.count}
                                    </td>
                                    <td>
                                        ${key}
                                        <input type="hidden" name="chkOutItem" value="${key}" />
                                    </td>
                                    <td>
                                        ${quantity}
                                    </td>
                                    <td>
                                        <input type="checkbox" name="chkItem" value=${key} />
                                    </td>
                                </tr>
                            </c:forEach>
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
                <form action="DispatchServlet" method="POST">
                    <h1>Customer Information</h1>
                    Customer Name* <input type="text" name="txtCustName" value="" /></br>
                    Address* <textarea name="txtAddress" rows="2" cols="20"></textarea></br>
                    Email <input type="text" name="txtEmail" value="" /></br>
                    <input type="submit" value="Check out" name="btAction" />
                </form>
            </c:if>
        </c:if>
        <c:if test="${empty cart}">
             <h2>
                <font color = "red">
                    No cart is existed!!!
                </font>
            </h2>
            <a href="showBookProductServlet">Add books to your Cart</a>
        </c:if>
        
        <%--<h1>Your cart includes</h1>
        <% d
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
                                                        <input type="hidden" name="chkOutItem" value="<%= key %>" />
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
                        <form action="DispatchServlet" method="POST">
                            <h1>Customer Information</h1>
                            Customer Name* <input type="text" name="txtCustName" value="" /></br>
                            Address* <textarea name="txtAddress" rows="2" cols="20"></textarea></br>
                            Email <input type="text" name="txtEmail" value="" /></br>
                            <input type="submit" value="Check out" name="btAction" />
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
        <a href="showBookProductServlet">Add books to your Cart</a>--%>
    </body>
</html>
