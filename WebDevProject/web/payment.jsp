<%-- 
    Document   : payment
    Created on : Nov 29, 2014, 7:12:33 PM
    Author     : Darren
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment</title>
    </head>
    <body class="background">
        <jsp:include page="/include/header.jsp"/>
        <jsp:include page="/include/product_menu.jsp"/>  
        <jsp:include page="/include/cart_display.jsp"/>
        <link rel="stylesheet" href="style/standard.css"/>
        <div class="pageContent">
            <form action="CompleteCheckout" method="post">
                <table align="center" cellspacing="20">
                    <tr>
                        <td colspan="4" align="center"><font color="red">${orderEmptyFields}</font></td>
                    </tr>
                    <tr>
                        <td colspan="2"><b>Shipping information:</b></td>
                    </tr>
                    <tr>
                        <td>
                            First name:
                        </td>
                        <td>
                            <input type="text" name="shippingFName" value="${sessionScope.user.firstName}">
                        </td>
                        <td>
                            Last name:
                        </td>
                        <td>
                            <input type="text" name="shippingLName" value="${sessionScope.user.lastName}"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Address:</td>
                        <td colspan="3">
                            <input type="text" name="shippingAddress" value="${sessionScope.user.mailingAddress}" size="48"/>
                        </td>
                    </tr>
                </table>
                <br>

                <table align="center" cellspacing="20">
                    <tr>
                        <td colspan="2"><b>Payment information:</b></td>
                    </tr>
                    <tr>
                        <td>
                            First name:
                        </td>
                        <td>
                            <input type="text" name="billingFName" value="${sessionScope.user.firstName}">
                        </td>
                        <td>
                            Last name:
                        </td>
                        <td>
                            <input type="text" name="billingLName" value="${sessionScope.user.lastName}"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Address:</td>
                        <td colspan="3">
                            <input type="text" name="billingAddress" value="${sessionScope.user.billingAddress}" size="48"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Card number:
                        </td>
                        <td>
                            <input type="text" name="cardNumber"/>
                        </td>
                        <td>
                            Expiration:
                        </td>
                        <td>
                            <input type="text" name="expMonth" value="12" size="2"/> / <input type="text" name="year" value="2015" size="4"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            CCV:
                        </td>
                        <td>
                            <input type="text" name="ccv" size="3"/> 
                        </td>
                    </tr>   
                </table>
                <br><br>



                <table align="center" cellspacing="20">
                    <tr>
                        <td><b>Order Summary:</b></td>
                    </tr>
                    <tr>
                        <td>Subtotal:</td>
                        <td>${sessionScope.orderTotal}</td>
                    </tr>
                    <tr>
                        <td>
                            Shipping:
                        </td>
                        <td>
                            ${shipCost}
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Total:
                        </td>
                        <td>
                            ${finalTotal}
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" align="center">
                            <br><br>
                            <input type="submit" value="Complete Order"/>
                        </td>
                    </tr>
                </table>

            </form>
        </div>

        <jsp:include page="/include/footer.jsp"/>
    </body>
</html>
