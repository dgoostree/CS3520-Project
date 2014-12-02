<%-- 
    Document   : orderConfirmation
    Created on : Nov 29, 2014, 8:35:17 PM
    Author     : Darren
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style/standard.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Confirmation</title>
    </head>
    <body class="background">
        <jsp:include page="/include/header.jsp"/>
        <jsp:include page="/include/product_menu.jsp"/>  
        <jsp:include page="/include/cart_display.jsp"/>
        
        <div class="pageContent">
            <br><br>
            <h1>Thank you for your order!</h1><br><br>
            <p>Your order should arrive within ${deliveryTimeStart} and ${deliveryTimeEnd} business days. Your order number is <b>${orderNumber}</b> 
                contact our non-existent customer service department should you have any concerns before then.</p>
            <br><br><br>
            <a class="itemLinkr" href="index.jsp">Home</a>
        </div>

        <jsp:include page="/include/footer.jsp"/>
    </body>
</html>
