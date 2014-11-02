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
    String modifier = "";
    if(type.startsWith("m")){
        type = "monitor";
        modifier = " inch";
    }
    else if(type.startsWith("h")){
        type = "hard drive";
        modifier = " GB";
    }
    else
    {
        type = "case";
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
        <h3 class="listStart">Here are the <%= type %>s we have in stock:</h3>
        
        <table>
            
                <%
                    for(; i<itemList.size(); i++){
                    %>
                        <tr>
                            <td width="100px">
                                <%= itemList.get(i).getName() %>
                            </td>
                            <td width="100px">                                
                                <%= itemList.get(i).getParam() + modifier %>
                            </td>
                            <td width="100px">
                                <%= type %>
                            </td>              
                        </tr>

                        <%
                    }
                %>
        </table>
        <br>
        <form action="index.jsp" method="post">
            <input type="Submit" value="New search"/>
        </form>

        <jsp:include page="/include/footer.jsp"/>
    </body>
    
</html>