<%-- 
    Document   : view_cart
    Created on : Nov 29, 2014, 2:11:46 PM
    Author     : Darren
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="style/standard.css"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Shopping Cart</title>
    </head>
    <body>
        <jsp:include page="/include/header.jsp"/>
        <jsp:include page="/include/product_menu.jsp"/>  
        <jsp:include page="/include/cart_display.jsp"/> 
        <div class="pageContent">
            <br>
            <h3>Shopping cart contents:</h3>
            <table align="center" cellspacing='20'>
                      <tr>
                      <td colspan="3"><b>Product</b></td>
                    <td><b>Quantity</b></td>
                    <td><b>Price</b></td>
                    </tr>
                    <form action="ViewCart" method="post">                
                        <c:forEach items="${sessionScope.cartContents}" var="current">
                            <tr>
                                <td>${current.brand}</td>
                                <td>${current.paramFormatted}</td>
                                <td>${current.type}</td>
                                <td align="center">
                                    <input type="text" name="cartItemQuantity" value="${current.quantity}" size="5"
                                           onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>
                                    <input type="hidden" name="cartItemNumber" value="${current.itemNumber}"/>
                                </td>
                                <td cellspacing="10">${current.price}</td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>Total:</b></td>
                            <td>${sessionScope.orderTotal}</td>

                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <br>
                                <input type="submit" value="Update" name="requestedAction"/>
                            </td>
                            <td>
                                <br>
                                <input type="submit" value="Checkout" name="requestedAction"/>
                            </td>
                        </tr>
                    </form>
            </table>
        </div>

        <jsp:include page="/include/footer.jsp"/>
    </body>
</html>
