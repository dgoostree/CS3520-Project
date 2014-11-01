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
        
        <jsp:include page="/include/header.jsp"/>
        
        <h3>Account order history: </h3>
        
        <% 
            try {  
        %>
        
            <% 
                    int count = Integer.valueOf(request.getParameter("orderCount")); 
            %>

            <table>            
                <% for(int i = 0; i < count; i++){ %>
                    <tr>
                        Order history element <%= i+1 %>
                        <br>
                    </tr>
                <% } %>
            </table>

        <% 
        } catch(Exception e){ %>
            Invalid parameter entered 
            <br>
            <br>
        <%
            }
        %>
        
        <form action="index.jsp" method="post">
            <input type="Submit" value="Back"/>
        </form>
        
        <jsp:include page="/include/footer.jsp"/>
    </body>
</html>
