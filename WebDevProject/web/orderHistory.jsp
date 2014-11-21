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
            function confirmDelete(form){
                var r = confirm("Are you sure you want to delete your account?");
                if(r === true){
                    form.submit();
                }
                else{
                    
                }
            }
        </script>
    </head>
    <body>        
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
        <table>
            <tr>
                <td>
                    <form action="index.jsp" method="post">
                    <input type="Submit" value="Back"/>
                    </form>
                </td>
                <td>
                    <h5><u>Account Management:</u></h5>
                </td>
                <td>
                    <form action="index.jsp" method="post">
                    <input type="Submit" value="Update"/>
                    </form>
                </td>
                <td>
                    <form action="DeleteAccount" method="post">
                        <input type="button" value="Delete" onclick="confirmDelete(this.form)"/>
                    </form>
                </td>
            </tr>
        </table>
        <jsp:include page="/include/footer.jsp"/>
    </body>
</html>
