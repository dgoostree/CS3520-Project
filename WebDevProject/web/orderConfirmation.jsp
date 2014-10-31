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
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inventory List</title>
    </head>
    <body>
        <h1>Here's the </h1> <%= type %> <h1> we have in stock!</h1>
        <hr>
        <table>
            <tr>
                <%
                    for(; i<itemList.size(); i++){
                        %>
                        <td>
                            <%= itemList.get(i).getType() %>
                            <br>
                            <%= itemList.get(i).getParam() %>
                            <br>
                            <%= itemList.get(i).getName() %>
                            <br>
                        </td>
                        <%
                    }
                %>
            </tr>
        </table>
    </body>
    
</html>
