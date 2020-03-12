<%-- 
    Document   : add_new_food_and_drink
    Created on : Feb 26, 2020, 12:54:19 AM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="icon" href="img/core-img/favicon.ico">

        <link rel="stylesheet" href="style.css">
        <title>Update New Food And Drink Page</title>
    </head>
    <body>
        <%@include file="admin_header.jsp" %>

        <div style="margin-left: 5rem">
            <h3><font color="green">${requestScope.UPDATE_SUCCESS}</font></h3>
            <h3><font color="red">${requestScope.UPDATE_ERROR}</font></h3>
        </div>

        <div class="container mb-50">
            <form action="AdminUpdateFoodAndDrink" method="POST" enctype="multipart/form-data">
                <div class="form-group" style="width: 25%">
                    <label for="name">Name: </label>
                    <input type="text" class="form-control" name="name" value="${requestScope.FOOD_DRINK.name}" id="name" placeholder="Name" required="true">
                </div>

                <div class="form-group" style="width: 25%">
                    <label for="description">Description</label>
                    <input type="text" class="form-control" name="description" value="${requestScope.FOOD_DRINK.description}" id="description" placeholder="Description" required="true">
                </div>

                <div class="form-group" style="width: 25%">
                    <label for="price">Price</label>
                    <input type="number" class="form-control" name="price" value="${requestScope.FOOD_DRINK.price}" id="price" min="0" placeholder="Enter price" required="true">
                </div>

                <div class="form-group" style="width: 25%">
                    <label for="quantity">Quantity</label>
                    <input type="number" class="form-control" name="quantity" value="${requestScope.FOOD_DRINK.quantity}" id="quantity" placeholder="Enter quantity" required="true">
                </div>

                <div class="form-group" style="width: 25%; padding-bottom: 3.5rem">
                    <label for="category">Category</label>
                    <select name="category" id="category">
                        <c:if test="${requestScope.LIST_CATEGORY != null}">
                            <c:if test="${not empty requestScope.LIST_CATEGORY}">
                                <c:forEach var="listCategory" items="${requestScope.LIST_CATEGORY}">
                                    <c:if test="${listCategory.description eq requestScope.FOOD_DRINK.category}">
                                        <option value="${listCategory.description}" selected="true">${listCategory.description}</option>
                                    </c:if>
                                    <c:if test="${listCategory.description ne requestScope.FOOD_DRINK.category}">
                                        <option value="${listCategory.description}">${listCategory.description}</option>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </c:if>
                    </select>
                </div>

                <div class="form-group" style="width: 25%; padding-bottom: 3.5rem">
                    <label for="status">Status</label>
                    <select name="status" id="status" onchange="onchangeResult()">
                        <c:if test="${requestScope.LIST_STATUS != null}">
                            <c:if test="${not empty requestScope.LIST_STATUS}">
                                <c:forEach var="listStatus" items="${requestScope.LIST_STATUS}">
                                    <c:if test="${listStatus.description eq requestScope.FOOD_DRINK.status}">
                                        <option value="${listStatus.description}" selected="true">${listStatus.description}</option>
                                    </c:if>
                                    <c:if test="${listStatus.description ne requestScope.FOOD_DRINK.status}">
                                        <option value="${listStatus.description}">${listStatus.description}</option>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </c:if>
                    </select>
                </div>

                <div class="form-group mb-3">
                    <label for="currentImage">Current Image</label><br/>
                    <img src="${requestScope.FOOD_DRINK.image}" id="currentImage" class="mb-15" width="50px" height="50px"/>
                    <input type="file" class="form-control-file" placeholder="Photo URL" name="imagesInput">
                </div>  

                <button class="btn btn-success submitButton" name="action">Submit</button>
                <input type="hidden" name="ID" value="${requestScope.FOOD_DRINK.ID}"/>
            </form>
        </div>

        <script src="js/jquery/jquery-2.2.4.min.js"></script>
        <!-- Popper js -->
        <script src="js/bootstrap/popper.min.js"></script>
        <!-- Bootstrap js -->
        <script src="js/bootstrap/bootstrap.min.js"></script>
        <!-- All Plugins js -->
        <script src="js/plugins/plugins.js"></script>
        <!-- Active js -->
        <script src="js/active.js"></script>

        <script>
            var changed = false;
            function onchangeResult() {
                changed = true;
            }
            
            function myFunction(e) {
                if (changed) {
                    var status = document.getElementById("status");
                    if (status.value.localeCompare("Deleted") === 0) {
                        if (!confirm('Do you really want to delete?')) {
                                e.preventDefault();
                            }
                    }
                }
            }
            
            const submitButton = document.querySelectorAll('.submitButton');
            for (let button of submitButton) {
                button.addEventListener('click', e => {
                    myFunction(e);
                });
            }
    
        </script>
    </body>
</html>
