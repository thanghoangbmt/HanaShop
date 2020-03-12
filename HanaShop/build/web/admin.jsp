<%-- 
    Document   : admin
    Created on : Feb 24, 2020, 10:47:33 PM
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
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!-- Title -->
        <title>Delicious - Food & Drink | Admin Page</title>

        <!-- Favicon -->
        <link rel="icon" href="img/core-img/favicon.ico">

        <!-- Core Stylesheet -->
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div id="preloader">
            <i class="circle-preloader"></i>
            <img src="img/core-img/salad.png" alt="">
        </div>

        <!-- ##### Header Area Start ##### -->
        <%@include file="admin_header.jsp"%>

        <div class="south-search-area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="advanced-search-form">
                            <!-- Search Title -->
                            <div class="search-title">
                                <p>Admin Food & Drink Search</p>
                            </div>
                            <!-- Search Form -->
                            <form action="AdminSearchFoodAndDrink" method="POST" name="searchForm">

                                <div class="row">
                                    <div class="col-12 col-md-4 col-lg-3" style="margin-top: 1rem">
                                        <div class="form-group">
                                            <input class="form-control" type="search" name="search" placeholder="Food/Drink's name"/>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-2 col-lg-2" style="margin-top: 1rem">
                                        <div class="form-group">
                                            <input class="form-control" type="text" id="priceFrom" name="priceFrom" placeholder="Price From"/>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-2 col-lg-2" style="margin-top: 1rem"> 
                                        <div class="form-group">
                                            <input class="form-control" type="text" id="priceTo" name="priceTo" placeholder="To"/>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-4 col-lg-2">
                                        <div class="form-group">
                                            <select name="catagories" id="catagories">
                                                <option value="All">All Catagories</option>
                                                <c:forEach var="listCategory" items="${requestScope.LIST_FOOD_CATEGORY}">
                                                    <option value="${listCategory.description}">${listCategory.description}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-4 col-lg-2">
                                        <div class="form-group">
                                            <select name="status" id="catagories">
                                                <option value="All">All Status</option>
                                                <c:forEach var="listStatus" items="${requestScope.LIST_FOOD_STATUS}">
                                                    <option value="${listStatus.description}">${listStatus.description}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>


                                    <div class="col-12 d-flex justify-content-center align-items-end">
                                        <!-- Submit -->
                                        <div class="form-group mb-15 mt-0">
                                            <button type="submit" class="btn searchButton" name="action">Search</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <c:if test="${requestScope.LIST_FOOD_AND_DRINK != null}">
            <c:if test="${not empty requestScope.LIST_FOOD_AND_DRINK}">
                <div class="mb-100">
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">NO</th>
                                <th scope="col">Name</th>
                                <th scope="col">Description</th>
                                <th scope="col">Price</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Category</th>
                                <th scope="col">Status</th>
                                <th scope="col">Create Date</th>
                                <th scope="col">Image</th>
                                <th scope="col">Update</th>
                                <th scope="col">Show Details</th>

                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="list" varStatus="counter" items="${requestScope.LIST_FOOD_AND_DRINK}">
                                <tr>
                                    <th scope="row">${counter.count}</th>
                                    <td>${list.name}</td>
                                    <td>${list.description}</td>
                                    <td>${list.price}$</td>
                                    <td>${list.quantity}</td>
                                    <td>${list.category}</td>
                                    <td>${list.status}</td>
                                    <td>${list.date}</td>
                                    <td>
                                        <img src="${list.image}" width="50px" height="50px"/>
                                    </td>
                                    <td>
                                        <form action="AdminPreUpdateFoodAndDrink" method="POST">
                                            <div class="form-group mb-0">
                                                <button type="submit" class="btn btn-primary btn-sm" name="action">Update</button>
                                                <input type="hidden" name="foodID" value="${list.ID}"/>
                                            </div>
                                        </form>
                                    </td>

                                    <td>
                                        <form action="ViewFoodDetails" method="POST">
                                            <div class="form-group mb-0">
                                                <button type="submit" class="btn btn-primary btn-sm" name="action">Show Details</button>
                                                <input type="hidden" name="foodID" value="${list.ID}"/>
                                            </div>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <div class="col">
                        <div class="block-27">
                            <c:if test="${requestScope.NB_PAGE.size() > 1}">
                                <c:url var="pageFrist" value="AdminPagination">
                                    <c:param name="page" value="1"/>
                                </c:url>
                                <a href="${pageFrist}">&lt;</a>
                                <c:forEach var="page" varStatus="counter" items="${requestScope.NB_PAGE}">

                                    <c:url var="pageNumber" value="AdminPagination">
                                        <c:param name="page" value="${page}"/>
                                    </c:url>

                                    <a href="${pageNumber}">${counter.count}</a>

                                </c:forEach>
                                <c:url var="pageLast" value="AdminPagination">
                                    <c:param name="page" value="${requestScope.NB_PAGE.size()}"/>
                                </c:url>
                                <a href="${pageLast}">&gt;</a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </c:if>

            <c:if test="${empty requestScope.LIST_FOOD_AND_DRINK}">
                <div class="mt-15">
                    <h3 class="text-center text-info">Nothing to display!</h3>
                </div>
            </c:if>
        </c:if>

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
            function validatePriceInput(e) {
                var sPriceFrom = document.getElementById("priceFrom").value;
                var sPriceTo = document.getElementById("priceTo").value;

                if (isNaN(sPriceFrom)) {
                    alert("Price From must be a number!");
                    e.preventDefault();
                    return;
                }

                if (isNaN(sPriceTo)) {
                    alert("Price To must be a number!");
                    e.preventDefault();
                    return;
                }

                var priceFrom = parseFloat(sPriceFrom);
                var priceTo = parseFloat(sPriceTo);

                if (priceFrom < 0) {
                    alert("Price From must be greater than 0!");
                    e.preventDefault();
                    return;
                }

                if (priceTo < 0) {
                    alert("Price To to be greater than 0!");
                    e.preventDefault();
                    return;
                }

                if (priceFrom >= priceTo) {
                    alert("Price To must be greater than price from!");
                    e.preventDefault();
                    return;
                }
            }

            const searchButton = document.querySelectorAll('.searchButton');
            for (let button of searchButton) {
                button.addEventListener('click', e => {
                    validatePriceInput(e);
                });
            }
        </script>    
    </body>
</html>
