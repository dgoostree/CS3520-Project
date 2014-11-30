<%-- 
    Document   : cart_display
    Created on : Nov 28, 2014, 5:21:40 PM
    Author     : Darren
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="style/standard.css"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <div class="cartDisplay">
            <table>
                <tr>
                    <td  colspan="2">

                        <h3>Your cart:</h3>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <c:if test="${sessionScope.loggedIn==true}">
                            There are <font color="blue">${sessionScope.cartCount}</font> products in your cart<br>
                        </c:if>
                        <c:if test="${sessionScope.loggedIn==false || sessionScope.loggedIn==null}">
                            Log in to see your cart<br>
                        </c:if>
                        <br>
                    </td>
                </tr>
                <tr>
                    <c:if test="${(sessionScope.loggedIn == false || sessionScope.loggedIn == null) || sessionScope.cartCount == null || 
                          sessionScope.cartCount == '0'}">
                        <td>
                            View cart
                        </td>
                        <td>
                            Checkout
                        </td>
                    </c:if>
                    <c:if test="${sessionScope.loggedIn == true && sessionScope.cartCount != null && sessionScope.cartCount != '0'}">
                        <td>
                            <a href="ViewCart?requestedAction=View" class="itemLink">View cart</a>
                        </td>
                        <td>
                            <a href="ViewCart?requestedAction=Checkout" class="itemLink">Checkout</a>
                        </td>
                    </c:if>
                </tr>
            </table>
        </div>
    </body>
</html>
