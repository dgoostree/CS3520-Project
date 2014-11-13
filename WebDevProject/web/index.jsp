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
        
    </head>
    <body>
        <jsp:include page="/include/header.jsp"/>
        
        <h3>Product search:</h3>
        
        <form action="SelectionServlet" method="get" class="clearer">
             <table>
                 <tr>
                    <td align="left" style="font-weight:bold; text-decoration: underline">Monitors:</td>
                 </tr>
                 <tr>
                     <td class="tab"><a  href="SelectionServlet?itemType=mon&param=17">17 Inch</a></td>
                 </tr>
                 <tr>
                     <td class="tab"><a  href="SelectionServlet?itemType=mon&param=21">21 Inch</a></td>
                 </tr>
                 <tr>
                     <td class="tab"><a  href="SelectionServlet?itemType=mon&param=24">24 Inch</a></td>
                 </tr>
                 <tr>
                     <td class="tab"><a  href="SelectionServlet?itemType=mon&param=27">27 Inch</a></td>
                 </tr>
                 <tr>
                    <td align="left" style="font-weight:bold; text-decoration: underline">Hard Drives:</td>
                 </tr>
                 <tr>
                     <td class="tab"><a  href="SelectionServlet?itemType=harddrive&param=500">500GB</a></td>
                 </tr>
                 <tr>
                     <td class="tab"><a  href="SelectionServlet?itemType=harddrive&param=1000">1000GB</a></td>
                 </tr>
                 <tr>
                     <td class="tab"><a  href="SelectionServlet?itemType=harddrive&param=1500">1500GB</a></td>
                 </tr>
                 <tr>
                     <td class="tab"><a  href="SelectionServlet?itemType=harddrive&param=2000">2000GB</a></td>
                 </tr>
                 <tr>
                    <td align="left" style="font-weight:bold; text-decoration: underline">Cases:</td>
                 </tr>
                 <tr>
                     <td class="tab"><a  href="SelectionServlet?itemType=case&param=Black">Black</a></td>
                 </tr>
                 <tr>
                     <td class="tab"><a  href="SelectionServlet?itemType=case&param=White">White</a></td>
                 </tr>
                 <tr>
                     <td class="tab"><a  href="SelectionServlet?itemType=case&param=Red">Red</a></td>
                 </tr>
                 
            </table>
            
            
        </form>
        
        <jsp:include page="/include/footer.jsp"/>
    </body>
</html>
