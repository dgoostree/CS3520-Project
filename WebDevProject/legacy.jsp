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
        <title>CS3520 HW Assignment 3</title>
        
        <script>
            function selectionChanged(selection){  //on selection change
                var label = "";
                                
                switch(selection){   //set the text for the label on the parameter
                    case 1: 
                        label = "${sessionScope.parameterLabel[0]}";
                        break;
                    case 2:
                        label = "${sessionScope.parameterLabel[1]}";
                        break;
                    case 3:
                        label = "${sessionScope.parameterLabel[2]}";
                        break;
                    default:
                        break;
                }
                            
                
                document.getElementById("paramName").innerHTML = label;
                populateParams(selection);
                return;
            }
            
            function populateParams(selection){   //populates the select box with appropriate values
               var selectBox = document.getElementById("paramSelect");
               
               if(selectBox.length > 1){ //if previously populated
                   clearSelect(selectBox);//clear the box
               }
                
                var paramNames;
                var paramValues;
                switch(selection){ //initialize the data to be filled
                    case 1:   //monitors
                        paramNames = ["17 inch", "21 inch", "24 inch", "27 inch"];
                        paramValues = ["17", "21", "24", "27"];
                        break;
                    case 2:
                        paramNames = ["500GB", "1000GB", "1500GB", "2000GB", "3000GB"];
                        paramValues = ["500", "1000", "1500", "2000", "3000"];
                        break;
                    case 3:
                        paramNames = ["White", "Black", "Gray"];
                        paramValues = [ "White", "Black", "Gray"];
                        break;
                    default:
                        break;
                }
                            
                
                for(i=0; i < paramNames.length; i++){ //for each in the array, add it
                    var newOption = document.createElement("option");
                    newOption.text = paramNames[i];
                    newOption.value = paramValues[i];
                    selectBox.options.add(newOption);
                }
            }
            
            function clearSelect(selectBox){ //removes all custom options from the combobox
                var offset = selectBox.length;
                offset--;
                
                for(offset; offset>0; offset--){
                    selectBox.remove(offset);
                }
                
            }
            
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
                    <td align="right">Item:</td>
                    <td>
                
                        <select name="itemType" id="itemSelect" onchange="if(this.selectedIndex > 0) selectionChanged(this.selectedIndex);">
                            <option value="">--</option> 
                           <c:forEach var="prodType" items="${sessionScope.productNames}" varStatus="loop">
                               <option value="${sessionScope.productValues[loop.count - 1]}">${prodType}</option>
                           </c:forEach>
                        </select>
                    </td>
                    <td class="error" id="itemError"></td>
                </tr>
                <tr>
                    <td align="right" width="65px" ><span id="paramName"></span></td>
                    <td>
                        <select name="param" id="paramSelect">
                            <option value="">--</option>
                        </select>
                    </td>
                    <td class="error" id="paramError"></td>
                </tr>
                <tr>
                    <td>
                        
                    </td>
                    <td>
                        <input type="button" value="Search" onclick="validate(this.form);">
                    </td>
                </tr>
            </table>
            
            
        </form>
        
        <jsp:include page="/include/footer.jsp"/>
    </body>
</html>
