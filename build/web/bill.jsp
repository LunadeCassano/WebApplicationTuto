<%-- 
    Document   : bill
    Created on : Jun 30, 2024, 9:02:35 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill</title>
    </head>
    <body>
        <h1>Your Bill!</h1>
        <font color = "green">
            Payment successfully!
        </font>
        <table border="1">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Name</th>
                    <th>Unit Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <c:set var="odDto" value="${sessionScope.CHECK_OUT_ITEM}"/>
                <c:set var="totalpayment" value="${sessionScope.TOTAL_PAYMENT}"/>
                <c:forEach var="product" items="${odDto}" varStatus="counter">
                    <tr>
                        <td>${counter.count}</td>
                        <td>${product.productName}</td>
                        <td>${product.unitPrice}</td>
                        <td>${product.quantity}</td>
                        <td>${product.total}</td>

                    </tr>
                </c:forEach>
                    <tr>
                        <td colspan="4">
                            <font color ="red">
                                Total Cost
                            </font>
                        </td>
                        <td>
                            ${totalpayment}
                        </td>
                    </tr>
            </tbody>
        </table><br/>
        
        
        <h1>Your information!</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Field</th>
                    <th>Detail</th>
                </tr>
            </thead>
            <tbody>
                <c:set var="odDto" value="${sessionScope.CHECK_OUT_ITEM}"/>
                <c:set var="cust" value="${sessionScope.CUST}"/>
                <c:set var="odid" value="${odDto[0]}"/>
                <tr>
                    <td>Order ID</td>
                    <td>${odid.orderId}</td>
                </tr>
                <tr>
                    <td>Customer Name</td>
                    <td>${cust.customer}</td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td>${cust.address}</td>
                </tr>
                <tr>
                    <td>Detail</td>
                    <td>${cust.email}</td>
                </tr>
            </tbody>
        </table>
        <a href="showBookProductServlet">Continue Shopping</a>
    </body>
</html>
