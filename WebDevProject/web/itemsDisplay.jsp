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
    <body class="background">        
        <jsp:include page="/include/header.jsp"/>
        <h3 class="listStart">Here are the ${param.itemType}s we have in stock:</h3>
        
        <table class="primary">
            <tr>
                <th>Item Number</th>
                <th>Image</th>
                <th>Brand</th>
                <th>Parameter</th>
                <th>Price</th>
            </tr>
            <c:forEach var="item" items="${inventory}"> 
                
                <tr>
                    <td cellspacing="5" align="center">
                        ${item.item_number}
                    </td>
                    <td>
                        <img src="${pageContext.request.contextPath}${item.image}" alt="Should be a pic here" class="imgframe">
                    </td>
                    <td cellspacing="5">
                        <%--<%= itemList.get(i).getName() %>--%>
                        ${item.brand}
                    </td>
                    <td cellspacing="5">                                
                        <%--<%= itemList.get(i).getParam() + modifier %>--%>
                        ${item.paramToString}
                    </td>
                    <td cellspacing="5">
                        \$${item.price}
                    </td>
                </tr>

            </c:forEach>
        </table>
        <br>
        <form action="ClearServlet" method="post">
            <input type="Submit" value="New search" class="btn"/>
        </form>

        <jsp:include page="/include/footer.jsp"/>
    </body>
    
</html>