<%-- 
    Document   : shipping
    Created on : Nov 29, 2014, 6:58:44 PM
    Author     : Darren
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style/standard.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shipping</title>
    </head>
    <body class="background">
        <jsp:include page="/include/header.jsp"/>
        <jsp:include page="/include/product_menu.jsp"/>  
        <jsp:include page="/include/cart_display.jsp"/>

        <div class="pageContent">
            <form action="CheckoutServlet">
                <table cellspacing="20" align="center">
                    <tr>
                        <td colspan="2"><br><br><b>Select a shipping method:</b></td>
                    </tr>
                    <tr>
                        <td>7 day ground</td>
                        <td>8.99</td>
                        <td><input type="radio" name="shippingMethod" value="8.99,7"/>
                    </tr>
                    <tr>
                        <td>4 day ground</td>
                        <td>12.99</td>
                        <td><input type="radio" name="shippingMethod" value="12.99,4"/>
                    </tr>
                    <tr>
                        <td>2 day air</td>
                        <td>16.99</td>
                        <td><input type="radio" name="shippingMethod" value="16.99,2" checked/>
                    </tr>
                    <tr>
                        <td>Overnight</td>
                        <td>19.99</td>
                        <td><input type="radio" name="shippingMethod" value="19.99,1"/>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>
                            <input type="submit" value="Continue"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>

        <jsp:include page="/include/footer.jsp"/>
    </body>
</html>
