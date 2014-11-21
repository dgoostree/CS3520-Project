<%-- 
    Document   : login
    Created on : Nov 11, 2014, 3:30:54 PM
    Author     : Darren
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        
        <script>
            function validateLogin(form) {
                error = false;
                
                /**
                 * error check username
                 */
                errorField = document.getElementById("loginNameError");
                
                if(form.userName.value===""){
                    error = true;
                    errorField.innerHTML = "* username must contain 1 or more characters";
                }
                else {
                    errorField.innerHTML = "";
                }
                
                
                /**
                 * error check password
                 */
                errorField = document.getElementById("loginPasswordError");
                if(form.password.value===""){
                    error = true;
                    errorField.innerHTML = "* password must contain 1 or more characters";
                }
                else {
                    errorField.innerHTML="";
                }
                
                if(error === false){
                    form.submit();
                }
            }
        </script>
        
        <link rel="stylesheet" href="style/standard.css"/>
    </head>
    <body>
        <jsp:include page="/include/header.jsp"/>
        
        <h3>Account log in:</h3>
        <form action="LoginServlet" method="post">
            <table>
                <tr>
                    <td>Username</td>
                    <td><input type="text" name="userName"></td>
                    <td class="error" id="loginNameError"></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password"></td>
                    <td class="error" id="loginPasswordError"></td>
                </tr>
                <tr>
                    <td colspan="2" >
                        <span class="error">
                            <c:if test="${requestScope.errMsg != null}">
                                ${requestScope.errMsg}
                            </c:if>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td align="right">
                        <input type="button" value="Login" onclick="validateLogin(this.form)">
                    </td>
                </tr>
            </table>
        </form>
        
        
        <jsp:include page="/include/footer.jsp"/>
        
    </body>
</html>
