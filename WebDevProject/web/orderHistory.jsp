<%-- 
    Document   : orderHistory
    Created on : Oct 31, 2014, 6:21:55 PM
    Author     : Darren
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order History</title>
        <script>
            function deleteAccount(form) {
                var r = confirm("Are you sure you want to delete your account?");
                if (r === true) {
                    form.submit();
                }
            }
        </script>
    </head>
    <body>
        <jsp:include page="/include/header.jsp"/>
        <div id="container">
            
            <jsp:include page="/include/product_menu.jsp"/>
            <jsp:include page="/include/cart_display.jsp"/>
            <div class="pageContent">
                
                <table align="center">
                    <tr align="center">
                        <td>
                            <h3>Account Management:</h3>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/modAcct.jsp"><button type="button">Update</button></a>
                        </td>
                        <td>
                            <form action="DeleteAccount" method="post" >
                                <input type="button" value="Delete" onclick="deleteAccount(this.form)"/>
                            </form>
                        </td>
                    </tr>
                   
                </table>
                
                <table align="center" cellspacing="20">
                    <tr align="center">
                        <td>
                            <h3>Account order history: </h3>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Order number</b></td>
                        <td colspan="3"><b>Product</b></td>
                        <td><b>Quantity</b></td>
                        <td><b>Price</b></td>
                    </tr>
                    <c:forEach items="${requestScope.orderNumbers}" var="item" varStatus="outerLoop">
                        <tr>
                            <td>
                                <b>${item}</b>
                            </td>
                        </tr>
                        
                        <c:forEach items="${requestScope.orderContent[outerLoop.index]}" var="order" varStatus="innerLoop">
                            <tr>
                                <td></td>
                                <td>${order.brand}</td>
                                <td>${order.paramFormatted}</td>
                                <td>${order.type}</td>
                                <td>${order.quantity}</td>
                                <td>${order.price}</td>
                                
                            </tr>
                        </c:forEach>
                        
                    </c:forEach>
                </table>
                
            </div>


            
            <br style="clear:both;">
        </div>
                        <jsp:include page="/include/footer.jsp"/>
    </body>
</html>
