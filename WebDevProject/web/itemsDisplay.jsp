<%-- 
    Document   : itemsDisplay
    Created on : Oct 30, 2014, 4:41:14 PM
    Author     : Keith
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inventory List</title>
    </head>
    <body>        
        <jsp:include page="/include/header.jsp"/>
        <h3 class="listStart">Here are the ${param.itemType}s we have in stock:</h3>
        
        <table>
            <c:forEach var="item" items="${inventory}"> 
                
                <tr>
                    <td width="150px">
                        <%--<%= itemList.get(i).getName() %>--%>
                        ${item.brand}
                    </td>
                    <td width="100px">                                
                        <%--<%= itemList.get(i).getParam() + modifier %>--%>
                        ${item.paramToString}
                    </td>
                    <td width="100px">
                        <%--<%= type %>--%>
                        ${item.itemType}
                    </td>              
                </tr>

            </c:forEach>
        </table>
        <br>
        <form action="index.jsp" method="post">
            <input type="Submit" value="New search"/>
        </form>

        <jsp:include page="/include/footer.jsp"/>
    </body>
    
</html>