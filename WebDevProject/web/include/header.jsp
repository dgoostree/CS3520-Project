<%-- 
    Document   : header
    Created on : Oct 30, 2014, 3:02:49 PM
    Author     : Keith
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<link rel="stylesheet" href="style/standard.css"/>

<div id="header" >
    <div class="empty"></div>
    <div class="center">
        <h1 class="pageTitle"><img class="logo" src="./images/logoBlue.png">Cheap-O Components</h1>
    </div>
    <div class="loginLink">
        <c:if test="${sessionScope.loggedIn==true}">
            <a href="OrderHistory">${sessionScope.userName}</a> <a href="AccountLogin">Log out</a>
        </c:if>
        <c:if test="${sessionScope.loggedIn==false || sessionScope.loggedIn==null}">
            <form action="AccountLogin">
                <br>
                <br>
                <input class="btn" type="submit" value=" L o g i n ">
                <br>
                <br>
                <a href="accountCreation.jsp">Create Account</a>
            </form>
        </c:if>
    </div>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<hr>
