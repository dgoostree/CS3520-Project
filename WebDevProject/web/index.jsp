<%-- 
    Document   : index.jsp
    Created on : Oct 27, 2014, 5:05:04 PM
    Author     : keitheveritt
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!--Webpage created by Keith Everitt netID: wr5555 email: keveritt@horizon.csueastbay.edu
        and Darren Goostree netID: sz5629 email: darrengoostree@gmail.com -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CS3520 HW Assignment 4</title>
        
        <script>
            function validate(form) { //ensures both comboboxes are populated 
                validInput = true;
                errorField =document.getElementById("itemError");
                
                if( document.getElementById("itemSelect").selectedIndex <= 0 ){
                    validInput = false;
                    errorField.innerHTML = "Select an item to continue";
                }
                else {
                    errorField.innerHTML = "";
                }
                
                errorField = document.getElementById("paramError");
                
                if(document.getElementById("paramSelect").selectedIndex <= 0){
                    validInput = false;
                    errorField.innerHTML = "Select a parameter to continue";
                }
                else {
                    errorField.innerHTML="";
                }
                
                if(validInput === true){
                    form.submit();
                }
                
            }
            
        </script>
        
        <link rel="stylesheet" href="style/standard.css"/>
        <jsp:include page="/include/header.jsp"/>
    </head>
    <body>        
        <div>
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
                     
                     <c:forEach var="params" items="${sessionScope.parameterNames[outerLoop.count - 1]}" varStatus="innerLoop">
                         <c:forEach var="paramValue" items="${params}" >
                             <tr>
                                <td class="tab">
                                    
                                    <c:url value="SelectionServlet" var="itemSelection">
                                        <c:param name="itemType" value="${productValues[outerLoop.count - 1]}"/>
                                        <c:param name="param" value="${parameterValues[outerLoop.count - 1][innerLoop.count - 1]}"/>
                                    </c:url>
                                    
                                    <a class="itemLink" href=" <c:out value="${itemSelection}" />">${paramValue}</a>
                                </td>
                             </tr>
                         </c:forEach>
                     </c:forEach>
                 </c:forEach>
              </table>
            </form>
        </div>
        <jsp:include page="/include/footer.jsp"/>
    </body>
</html>
