<%-- 
    Document   : account
    Created on : Jun 27, 2024, 1:33:54 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Register</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Create Account jsp</h1>
        
        <form action="DispatchServlet" method="POST">
            <c:set var="errors" value="${requestScope.ERROR}"/>
            UserName* <input type="text" name="txtUsername" value=${param.txtUsername} />(6 - 30 chars)<br/>
            <c:if test="${not empty errors.usernameLengthErr}">
                <font color ="red">
                    ${errors.usernameLengthErr}
                </font><br/>
            </c:if>
            Password * <input type="password" name="txtPassword" value="" />(6 - 20 chars)<br/>
            <c:if test="${not empty errors.passwordLengthErr}">
                <font color ="red">
                    ${errors.passwordLengthErr}
                </font><br/>
            </c:if>
            Confirm* <input type="password" name="txtConfirm" value="" /><br/>
            <c:if test="${not empty errors.confirmNotMatched}">
                <font color ="red">
                    ${errors.confirmNotMatched}
                </font><br/>
            </c:if>
            Full name* <input type="text" name="txtFullname" value=${param.txtFullname} />(2 - 40 chars)<br/>
            <c:if test="${not empty errors.fullNameLengthErr}">
                <font color ="red">
                    ${errors.fullNameLengthErr}
                </font><br/>
            </c:if>
            <input type="submit" value="Register" name="btAction" />
            <input type="reset" value="Reset" />
            <input type="submit" value="Already have account" name="btAction" />
        </form>
    </body>
</html>
