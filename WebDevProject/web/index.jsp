<%-- 
    Document   : index.jsp
    Created on : Oct 27, 2014, 5:05:04 PM
    Author     : keitheveritt
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="style/standard.css"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <!--Webpage created by Keith Everitt netID: wr5555 email: keveritt@horizon.csueastbay.edu
        and Darren Goostree netID: sz5629 email: darrengoostree@gmail.com -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CS3520 HW Assignment 4</title>
        <jsp:include page="/include/header.jsp"/>

    </head>
    <body>        

        <jsp:include page="/include/product_menu.jsp"/>  
        <jsp:include page="/include/cart_display.jsp"/>

        <div class="pageContent">
            <img src="images/storefront.jpg" alt="whoops"> 

            <p align="center">Welcome to Cheap-O-Components! The cheapest place to find cheap-o stuff cheaply every cheap time! For over thirty days,
                we've offered the best products at the lowest prices.  Here at Cheap-O, we pride our selves in serving and being a part of our
                wonderful community</p><br><br>
            <p>All work and no play makes Jack a dull boy. All work and no play makes Jack a dull boy.
                All work and no play makes Jack a dull boy.<br> All work and no play makes Jack a dull boy.
                All work and no play makes Jack a dull boy. All work and no play makes Jack a dull boy.<br>
                All work and no play makes Jack a dull boy. All work and no play makes Jack a dull boy.
                All work and no play makes Jack a dull boy.<br> All work and no play makes Jack a dull boy.
                All work and no play makes Jack a dull boy. All work and no play makes Jack a dull boy.</p>
            <br style="clear:both;">
        </div>

        <jsp:include page="/include/footer.jsp"/>
    </body>
</html>
