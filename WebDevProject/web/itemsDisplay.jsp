<%-- 
    Document   : itemsDisplay
    Created on : Oct 30, 2014, 4:41:14 PM
    Author     : Keith
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inventory List</title>
    </head>
    <body align="center">        
        <jsp:include page="/include/header.jsp"/>
        <jsp:include page="/include/product_menu.jsp"/>  
        <jsp:include page="/include/cart_display.jsp"/>  
        <div class="pageContent"
             <%-- <h3 class="listStart">Here are the ${param.itemType}s we have in stock:</h3> --%>
             <br><br>

            <table align="center">
                <tr>
                    <th>Item Number</th>
                    <th>Image</th>
                    <th>Brand</th>
                    <th>Parameter</th>
                    <th>Price</th>
                </tr>
                <c:forEach var="item" items="${inventory}"> 

                    <tr>
                        <td cellspacing="5">
                            ${item.item_number}
                        </td>
                        <td>
                            <img src="${pageContext.request.contextPath}${item.image}" alt="Should be a pic here">
                        </td>
                        <td cellspacing="5">
                            <%--<%= itemList.get(i).getName() %>--%>
                            ${item.brand}
                        </td>
                        <td cellspacing="5">                                
                            <%--<%= itemList.get(i).getParam() + modifier %>--%>
                            ${item.paramToString}
                        </td>
                        <td cellspacing="5">
                            ${item.price}
                        </td>
                        <%-- disable add to cart if not logged in --%>
                        <td cellspacing="5">
                            <c:if test="${sessionScope.loggedIn==true}">
                                <form action="AddToCart" method="post">
                                    <input type="hidden" name="addUsername" value="${sessionScope.userName}"/>
                                    <input type="hidden" name="addItemNumber" value="${item.item_number}"/>
                                    <input type="hidden" name="itemClass" value ="${requestScope.itemType}"/>
                                    <input type="hidden" name="itemParameter" value="${requestScope.param}"/>
                                    <input type="submit" value="Add to cart"/>
                                </form>
                            </c:if>
                     <%--       <c:if test="${sessionScope.loggedIn==false || sessionScope.loggedIn==null}">
                                <input type="submit" value="Add to cart" disabled/>
                            </c:if>    --%>

                        </td>
                    </tr>

                </c:forEach>
                <tr>
                    <td></td>
                    <td class="error" colspan="2">
                <C:if test="${sessionScope.alreadyInCart != null}">
                    ${sessionScope.alreadyInCart}
                </C:if>
                    </td>

                </tr>
            </table>
            <br>
        </div>
        <jsp:include page="/include/footer.jsp"/>
    </body>

</html>