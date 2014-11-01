<%-- 
    Document   : orderConfirmation
    Created on : Oct 30, 2014, 4:41:14 PM
    Author     : Keith
--%>

<%@page import="CS3520.main.util.Monitor"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ArrayList<Monitor> itemList = (ArrayList<Monitor>) request.getAttribute("inventory");
    String type = request.getParameter("itemType");
    if(type.startsWith("m")){
        type = "monitors";
    }
    else if(type.startsWith("h")){
        type = "hard drives";
    }
    else
    {
        type = "cases";
    }
    int i = 0;
    String t, p, n;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inventory List</title>
    </head>
    <body>
        <jsp:include page="/include/header.jsp"/>
        <h1>Here's the <%= type %>  we have in stock!</h1>
        <table cellpadding="3px" rules="cols">
            <tr>
                <td align="left">
                     <u><%="Brand:"%></u>
                     <br><br>
                     <u><%="Size/Capacity/Color:" %></u>    
                     <br><br>
                     <u><%= "Item Type:" %></u>
                     <br><br>
                </td>
                <%
                    for(; i<itemList.size(); i++){
                        %>
                        <td align="center">
                            <%= itemList.get(i).getName() %>
                            <br><br>
                            <%= itemList.get(i).getParam() %>
                            <br><br>
                            <%= itemList.get(i).getType() %>
                            <br><br>
                        </td>
                        <%
                    }
                %>
            </tr>
        </table>
            <hr>
            <a href="index.jsp">Home</a>
        <jsp:include page="/include/footer.jsp"/>
    </body>
    
</html>
