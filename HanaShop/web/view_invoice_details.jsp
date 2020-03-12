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
        <title>Invoice Details</title>
        <style>
            body {
                background: #eecda3;
                background: -webkit-linear-gradient(to right, #eecda3, #ef629f);
                background: linear-gradient(to right, #eecda3, #ef629f);
                min-height: 100vh;
            }
        </style>


    </head>
    <body>
        <%@include file="header.jsp" %>
        <div style="padding-bottom: 10rem">

            <div class="container">
                <div class="row">
                    <div class="col-lg-12 bg-white rounded shadow-sm mb-5">
                        <!-- Shopping cart table -->

                        <c:if test="${requestScope.LIST_FOOD_DETAILS != null}">
                            <c:if test="${requestScope.LIST_FOOD_DETAILS.size() > 0}">


                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="p-2 px-3 text-uppercase">Name</div>
                                                </th>

                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Quantity</div>
                                                </th>

                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Price</div>
                                                </th>

                                            </tr>
                                        </thead>


                                        <tbody>
                                            <c:forEach var="listFoodDetails" items="${requestScope.LIST_FOOD_DETAILS}">
                                                <tr>
                                                    <th scope="row" class="border-0">
                                                        <div class="p-2">
                                                            <img src="${listFoodDetails.image}" alt="" width="70" class="img-fluid rounded shadow-sm">
                                                            <div class="ml-3 d-inline-block align-middle">
                                                                <h5 class="mb-0">
                                                                    <h5 class="mb-0">
                                                                        <p class="text-dark d-inline-block align-middle">${listFoodDetails.name}</p>
                                                                    </h5>
                                                                </h5>
                                                                <span class="text-muted font-weight-normal font-italic d-block">${listFoodDetails.category}</span>
                                                            </div>
                                                        </div>
                                                    </th>

                                                    <td class="border-0 align-middle">
                                                        <strong>${listFoodDetails.quantity}</strong>
                                                    </td>

                                                    <td class="border-0 align-middle">
                                                        <strong>$${listFoodDetails.price}</strong>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                                <!-- End -->
                            </c:if>
                        </c:if>
                    </div>
                </div>

            </div>

        </div>

        <%@include file="footer.jsp" %>

        <script src="js/jquery/jquery-2.2.4.min.js"></script>
        <!-- Popper js -->
        <script src="js/bootstrap/popper.min.js"></script>
        <!-- Bootstrap js -->
        <script src="js/bootstrap/bootstrap.min.js"></script>
        <!-- All Plugins js -->
        <script src="js/plugins/plugins.js"></script>
        <!-- Active js -->
        <script src="js/active.js"></script>

    </body>
</html>
