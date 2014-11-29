<%-- 
    Document   : product_menu
    Created on : Nov 28, 2014, 5:15:34 PM
    Author     : Darren
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="style/standard.css"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <body >
        <div class="productMenu" align="left">
            <h3>Product search:</h3>
        
            <form action="SelectionServlet" method="get" class="clearer">
             <table>
                 <c:forEach var="type" items="${productNames}" varStatus="outerLoop">  
                     <tr>
                        <td class ="productType">
                            ${type}
                        </td>
                        <td>
                            <img  src="${pageContext.request.contextPath}${sessionScope.icons[outerLoop.count-1]}" alt="something">
                        </td>
                     </tr>
                     
                     <c:forEach var="params" items="${sessionScope.parameterNames[outerLoop.count - 1]}" varStatus="innerLoop"><tr>
                                <td class="tab">
                                    
                                    <c:url value="SelectionServlet" var="itemSelection">
                                        <c:param name="itemType" value="${productValues[outerLoop.count - 1]}"/>
                                        <c:param name="param" value="${parameterValues[outerLoop.count - 1][innerLoop.count - 1]}"/>
                                    </c:url>
                                    
                                    <a class="itemLink" href=" <c:out value="${itemSelection}" />">${params}</a>
                                </td>
                             </tr>
                     </c:forEach>
                 </c:forEach>
              </table>
            </form>
            
        </div>
    </body>
</html>
