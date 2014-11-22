<%-- 
    Document   : modifyAccount
    Created on : Nov 21, 2014, 6:10:17 PM
    Author     : Keith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Modification</title>
    <script>
            function confirmCompleted(form) {
                error = false;
                errorField = document.getElementById("loginPasswordError");
                if(form.password.value===""){
                    error = true;
                    errorField.innerHTML = "* Field cannot be blank";
                }
                else {
                    errorField.innerHTML="";
                    request.setAttribute()
                }
                
                errorField = document.getElementById("confirmPasswordError");
                if(form.passwordCheck.value===""){
                    error = true;
                    errorField.innerHTML = "* Field cannot be blank";
                }
                else if(form.passwordCheck.value!==form.password.value){
                    error = true;
                    errorField.innerHTML = "Passwords are not the same";
                }
                else {
                    errorField.innerHTML="";
                }
                
                errorField = document.getElementById("firstNameError");
                if(form.firstName.value===""){
                    error = true;
                    errorField.innerHTML = "* Field cannot be blank";
                }
                else {
                    errorField.innerHTML="";
                }
                
                errorField = document.getElementById("lastNameError");
                if(form.lastName.value===""){
                    error = true;
                    errorField.innerHTML = "* Field cannot be blank";
                }
                else {
                    errorField.innerHTML="";
                }
                errorField = document.getElementById("emailError");
                if(form.email.value===""){
                    error = true;
                    errorField.innerHTML = "* Field cannot be blank";
                }
                else {
                    errorField.innerHTML="";
                }
                errorField = document.getElementById("billingError");
                if(form.billingAddress.value===""){
                    error = true;
                    errorField.innerHTML = "* Field cannot be blank";
                }
                else {
                    errorField.innerHTML="";
                } 
                request.setAttribute("mod", "");
                if(error === false){
                    form.submit();
                }
            }
        </script>
        
        <link rel="stylesheet" href="style/standard.css"/>
    </head>
    <body>
        <jsp:include page="/include/header.jsp"/>
        
        <h3>Create a new account:</h3>
        <form action="ModifyAccount" method="post">
            <table>
                <tr>
                    <td colspan="2">
                        <span class="error">
                            <c:if test="${requestScope.errMsg != null}">
                                ${requestScope.errMsg}
                            </c:if>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>Username</td>
                    <td><input type="text" name="userName" value="${requestScope.currentUser.userName}" disabled="disabled"></td>
                    <td class="error" id="loginNameError"></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" value="${requestScope.currentUser.password}"></td>
                    <td class="error" id="loginPasswordError"></td>
    
                    <td>Confirm Password</td>
                    <td><input type="password" name="passwordCheck" value="${requestScope.currentUser.password}"></td>
                    <td class="error" id="confirmPasswordError"></td>
                </tr>
                <tr>
                    <td>First Name</td>
                    <td><input type="text" name="firstName" value="${requestScope.currentUser.firstName}"></td>
                    <td class="error" id="firstNameError"></td>
                    <td>Last Name</td>
                    <td><input type="text" name="lastName" value="${requestScope.currentUser.lastName}"></td>
                    <td class="error" id="lastNameError"></td>
                </tr>
                <tr>
                    <td>Email Address</td>
                    <td><input type="text" name="email" value="${requestScope.currentUser.email}"></td>
                    <td class="error" id="emailError"></td>
                </tr>
                <tr>
                    <td>Billing Address</td>
                    <td><input type="text" name="billingAddress" value="${requestScope.currentUser.billingAddress}"></td>
                    <td class="error" id="billingError"></td>
                    
                    <td>Mailing Address</td>
                    <td><input type="text" name="mailingAddress" value="${requestScope.currentUser.mailingAdress}"></td>
                    <td class="error" id="mailingError"></td>
                </tr>
                <tr>
                    <td>Phone Number</td>
                    <td><input type="text" name="phone" value="${requestScope.currentUser.phone}"></td>
                    <td class="error" id="phoneError"></td>
                </tr>
                <tr>
                    <td align="left">
                        <input type="button" value="Create" onclick="confirmCompleted(this.form)">
                    </td>
                </tr>
            </table>
        </form>
        <jsp:include page="/include/footer.jsp"/>
    </body>
</html>

