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
        <title>Invoice History</title>
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
                <p>
                    <font color="red">${requestScope.EMPTY_INVOICE_MESSAGE}</font>
                </p>
                <div class="south-search-area">
                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <div class="advanced-search-form">
                                    <!-- Search Title -->
                                    <div class="search-title">
                                        <p>History Search</p>
                                    </div>
                                    <!-- Search Form -->
                                    <form action="SearchInvoiceHistory" method="POST" name="searchForm">
                                        <div class="row align-items-center">
                                            <div class="col-12 col-md-4 col-lg-3" style="margin-top: 1rem">
                                                <div class="form-group">
                                                    <input class="form-control" type="search" name="foodName" placeholder="Food/Drink's name"/>
                                                </div>
                                            </div>

                                            <div class="col-12 col-md-2 col-lg-2" style="margin-top: 1rem">
                                                <div class="form-group">
                                                    <input class="form-control" type="date" id="dayFrom" name="dayFrom" placeholder="From"/>
                                                </div>
                                            </div>

                                            <div class="col-12 col-md-2 col-lg-2" style="margin-top: 1rem"> 
                                                <div class="form-group">
                                                    <input class="form-control" type="date" id="DayTo" name="dayTo" placeholder="To"/>
                                                </div>
                                            </div>

                                            <div class="col-12 col-md-2 col-lg-2">
                                                <!-- Submit -->
                                                <div class="form-group mb-15 mt-15">
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

                <div class="row">
                    <c:if test="${requestScope.LIST_INVOICE != null}">
                        <c:if test="${requestScope.LIST_INVOICE.size() > 0}">
                            <div class="col-lg-12 bg-white rounded shadow-sm mb-5">
                                <!-- Shopping cart table -->
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="p-2 px-3 text-uppercase">NO</div>
                                                </th>

                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Date</div>
                                                </th>

                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Total Price</div>
                                                </th>

                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">View Details</div>
                                                </th>
                                            </tr>
                                        </thead>


                                        <tbody>
                                            <c:forEach var="listInvoice" varStatus="counter" items="${requestScope.LIST_INVOICE}">
                                                <tr>
                                                    <th scope="row" class="border-0 align-middle">
                                                        <strong>${counter.count}</strong>
                                                    </th>

                                                    <td class="border-0 align-middle">
                                                        <strong>${listInvoice.dateOfPurchase}</strong>
                                                    </td>

                                                    <td class="border-0 align-middle">
                                                        <strong>$${listInvoice.totalPrice}</strong>
                                                    </td>

                                                    <td class="border-0 align-middle">
                                                        <form action="ViewInvoiceDetails" method="POST">
                                                            <button type="submit" class="text-dark btn"><i class="fa fa-trash removeButton">View Details</i></button>
                                                            <input type="hidden" name="invoiceID" value="${listInvoice.ID}"/>
                                                        </form>
                                                    </td>

                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                                <!-- End -->
                            </div>
                        </c:if>
                    </c:if>
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
