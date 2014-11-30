<%-- 
    Document   : header
    Created on : Oct 30, 2014, 3:02:49 PM
    Author     : Keith
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="style/standard.css"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<div id="header" style="overflow: hidden;" class="pageHeader"><br>
    <div class="empty"></div>
    <div class="center">
        <h1 class="pageTitle"><a href="index.jsp"><img class="logo" src="./images/logo.png"></a>Cheap-O Components</h1>
    </div>
    <div class="loginLink">
        <c:if test="${sessionScope.loggedIn==true}">
            <a href="OrderHistory" class="itemLink">${sessionScope.userName}</a> <a href="AccountLogin" class="itemLink">Log out</a>
        </c:if>
        <c:if test="${sessionScope.loggedIn==false || sessionScope.loggedIn==null}">
            <a href="AccountLogin" class="itemLink">Log in</a> <a href="accountCreation.jsp" class="itemLink">Create Account</a>
       </c:if>
        <br></div>
</div>