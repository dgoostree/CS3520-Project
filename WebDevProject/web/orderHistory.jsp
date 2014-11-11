<%-- 
    Document   : orderHistory
    Created on : Oct 31, 2014, 6:21:55 PM
    Author     : Darren
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order History</title>
    </head>
    <body>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        
        <jsp:include page="/include/header.jsp"/>
        
        <h3>Account order history: </h3>
        
   

        <table>         
            <c:forEach  var="i" begin="${1}" end="${requestScope.loopCount}" >
                <tr>
                    Order history element is ${i}
                    <br>
                </tr>
            </c:forEach>
        </table>
        
        <form action="index.jsp" method="post">
            <input type="Submit" value="Back"/>
        </form>
        
        <jsp:include page="/include/footer.jsp"/>
    </body>
</html>
