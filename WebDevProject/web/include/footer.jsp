<%-- 
    Document   : footer
    Created on : Oct 30, 2014, 3:08:11 PM
    Author     : Keith
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="java.util.*" %>
<link rel="stylesheet" href="style/standard.css"/>



<jsp:useBean id="date" class="java.util.Date" scope="page" />
<h6 class="copyright">&COPY; <fmt:formatDate value="${date}" pattern="yyyy" /> DGKE Worldwide Enterprises</h6>
