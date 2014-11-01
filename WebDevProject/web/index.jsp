<%-- 
    Document   : index.jsp
    Created on : Oct 27, 2014, 5:05:04 PM
    Author     : keitheveritt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!--Webpage created by Keith Everitt netID: wr5555 email: keveritt@horizon.csueastbay.edu
        and Darren Goostree netID: sz5629 email: darrengoostree@gmail.com -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CS3520 HW Assignment 3</title>
    </head>
    <body>
        <jsp:include page="/include/header.jsp"/>
        <h1>Hello World!</h1>
        <form action="SelectionServlet" method="get">
            <input type="text" name="itemType"/><input type="text" name="param"/>
            <br>
            <input type="submit" value="Send"/>
        </form>
        <jsp:include page="/include/footer.jsp"/>
    </body>
</html>
