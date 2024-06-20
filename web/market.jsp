<%-- 
    Document   : market
    Created on : Jun 19, 2024, 12:41:07 PM
    Author     : Admin
--%>

<%@page import="datvm.product.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Book Market</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Demo shopping cart</h1>
        <form action="DispatchServlet">
            Choose Book <select name = "ddlBook">
                <% 
                    List<ProductDTO> result = (List<ProductDTO>)request.getAttribute("SHOW_PRODUCT");
                    if (result != null){
                        for (ProductDTO dto : result){
                            %>
                                <option>
                                    <%= dto.getName() %>
                                </option>
                            <%
                        }
                    }
                %>
            </select><br/>
            Quantity <input type="number" name="txtQuantity" min = "1" value="" /><br/>
            <input type="submit" value="Add Book to Your Cart" name="btAction" />
            <input type="submit" value="View Your Cart" name="btAction" /> 
        </form>
    </body>
</html>
