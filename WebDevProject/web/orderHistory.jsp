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
            function deleteAccount(form){
                    var r = confirm("Are you sure you want to delete your account?");
                    if(r === true){
                       form.submit();
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
                    <h4><u>Account Management:</u></h4>
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
            <tr>
                <td>
                    <a href="/index.jsp">Back</a>
                    </form>
                </td>
            </tr>
        </table>
        <jsp:include page="/include/footer.jsp"/>
    </body>
</html>
