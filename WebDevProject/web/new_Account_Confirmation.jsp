<%-- 
    Document   : new_Account_Confirmation
    Created on : Nov 16, 2014, 1:31:49 PM
    Author     : Keith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Account Confirmation</title>
        <link rel="stylesheet" href="style/standard.css"/>
        <jsp:include page="/include/header.jsp"/>
    </head>
    <body>
        <h3>Hello ${sessionScope.newUser.firstName}, please confirm your account information below</h3>
        <hr>
        <div>
            <table border="1" style="width: 100%">
                <tr> 
                    <th bgcolor="black"> <font color="white">First Name</font></th>
                    <th bgcolor="black"> <font color="white">Last Name</font></th>
                    <th bgcolor="black"> <font color="white">Email</font></th>
                </tr>
                <tr>
                    <td>${sessionScope.newUser.firstName}</td>
                    <td>${sessionScope.newUser.lastName}</td>
                    <td>${sessionScope.newUser.email}</td>
                </tr>
                <tr> 
                    <th bgcolor="black"> <font color="white">Username</font></th>
                    <th bgcolor="black"> <font color="white">Password</font></th>
                </tr>
                <tr>
                    <td>${sessionScope.newUser.userName}</td>
                    <td>${sessionScope.newUser.password}</td>
                </tr>
            </table>
        </div>
        <div>
            <table border="1" style="width: 100%">
                <tr> 
                    <th bgcolor="black"> <font color="white">Billing Address</font></th>
                    <th bgcolor="black"> <font color="white">Mailing Address</font></th>
                </tr>
                <tr>
                    <td>${sessionScope.newUser.billingAddress}</td>
                    <td>${sessionScope.newUser.mailingAddress}</td>
                </tr>
                <tr>
                    <th bgcolor="black"><font color="white">Phone Number:</font></th>
                </tr>
                <tr>
                    <td>${sessionScope.newUser.phone}</td>
                </tr>
            </table>
        </div>
        <div>
            <table>
                <tr>
                    <td> 
                        <form action="login.jsp" method="post">
                            <input type="submit" name="confirm" value="Confirm">
                        </form>
                    </td>
                    <td> 
                        <form action="accountCreation.jsp" method="post">
                            <input type="submit" name="fix" value="Change Something">
                        </form>
                    </td> 
                </tr>
            </table>
        </div>
    </body>
</html>
