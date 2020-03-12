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
        <title>Shopping Cart</title>
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
                    <font color="red">${requestScope.CART_EMPTY_ERROR}</font>
                </p>
                <c:if test="${not empty requestScope.CHECKOUT_SUCCESSFULLY_MESSAGE}">
                    <p>
                        <font color="green">Success: ${requestScope.CHECKOUT_SUCCESSFULLY_MESSAGE}</font>
                    </p>
                </c:if>

                <c:if test="${not empty requestScope.CHECKOUT_FAILED_MESSAGE}">
                    <p>
                        <font color="red">Error: ${requestScope.CHECKOUT_FAILED_MESSAGE}</font>
                    </p>
                </c:if>

                <c:if test="${sessionScope.CART.cart == null || sessionScope.CART.cart.values().size() == 0}">
                    <p>
                        <font color="red">Empty Cart!</font>
                    </p>
                </c:if>
            </div>

            <c:if test="${sessionScope.CART.cart != null}">
                <c:if test="${sessionScope.CART.cart.values().size() > 0}">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 bg-white rounded shadow-sm mb-5">
                                <!-- Shopping cart table -->


                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="p-2 px-3 text-uppercase">Name</div>
                                                </th>

                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Price</div>
                                                </th>

                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Quantity</div>
                                                </th>

                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Remove</div>
                                                </th>
                                            </tr>
                                        </thead>


                                        <tbody>
                                            <c:forEach var="cartList" varStatus="totalPrice" items="${sessionScope.CART.cart}">
                                                <tr>
                                                    <th scope="row" class="border-0">
                                                        <div class="p-2">
                                                            <img src="${cartList.getValue().image}" alt="" width="70" class="img-fluid rounded shadow-sm">
                                                            <div class="ml-3 d-inline-block align-middle">
                                                                <h5 class="mb-0">
                                                                    <p class="text-dark d-inline-block align-middle">${cartList.getValue().name}</p>
                                                                </h5>
                                                                <span class="text-muted font-weight-normal font-italic d-block">${cartList.getValue().category}</span>
                                                            </div>
                                                        </div>
                                                    </th>
                                                    <td class="border-0 align-middle">
                                                        <strong>$${cartList.getValue().price}</strong>
                                                    </td>
                                                    <td class="border-0 align-middle">
                                                        <form action="UpdateQuantityInCart" method="POST">
                                                            <input type="number" name="quantity" value="${cartList.getValue().quantity}" min="1" size="50" maxlength="4" onchange="this.form.submit()"/>
                                                            <input type="hidden" name="foodID" value="${cartList.getKey()}"/>
                                                        </form>
                                                    </td>
                                                    <td class="border-0 align-middle">
                                                        <form action="RemoveFoodInCart" method="POST">
                                                            <button type="submit" class="text-dark btn"><i class="fa fa-trash removeButton">Remove</i></button>
                                                            <input type="hidden" name="foodID" value="${cartList.getKey()}"/>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                                <!-- End -->
                            </div>
                        </div>

                        <div class="row py-5 p-4 bg-white rounded shadow-sm">
                            <div class="col-lg-6">

                            </div>

                            <div class="col-lg-6">
                                <c:if test="${requestScope.LIST_FOOD_NOT_AVAILABLE != null}">
                                    <c:if test="${requestScope.LIST_FOOD_NOT_AVAILABLE.size() > 0}">
                                        <c:forEach var="List_Food_Not_Avai" items="${requestScope.LIST_FOOD_NOT_AVAILABLE}">
                                            <font color="red">${List_Food_Not_Avai.name} is not available now and we had remove it!</font>
                                        </c:forEach>
                                    </c:if>
                                </c:if>

                                <c:if test="${requestScope.LIST_FOOD_OUT_OF_STOCK != null}">
                                    <c:if test="${requestScope.LIST_FOOD_OUT_OF_STOCK.size() > 0}">
                                        <c:forEach var="List_Food_Out_Of_Stock" items="${requestScope.LIST_FOOD_OUT_OF_STOCK}">
                                            <font color="red">${List_Food_Out_Of_Stock.name} is out of stock!</font>
                                        </c:forEach>
                                    </c:if>
                                </c:if>
                                <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Order summary </div>
                                <div class="p-4">
                                    <p class="font-italic mb-4">Shipping and additional costs are calculated based on values you have entered.</p>
                                    <ul class="list-unstyled mb-4">
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Order Subtotal </strong><strong>$${sessionScope.CART.getTotalPrice()}</strong></li>
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Discount</strong><strong>$0.00</strong></li>
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Total</strong>
                                            <h5 class="font-weight-bold">$${sessionScope.CART.getTotalPrice()}</h5>
                                        </li>
                                    </ul>
                                </div>

                                <c:if test="${sessionScope.CART.cart.size() > 0}">

                                    <form action="CheckOut" method="POST">
                                        <button class="btn btn-dark rounded-pill py-2 btn-block">Procceed to checkout</button>
                                        <input type="hidden" id="listFoodNotAvailable" value="${sessionScope.LIST_FOOD_ID_NOT_AVAILABLE}"/>
                                    </form>

                                </c:if>
                            </div>
                        </div>
                    </div>

                </c:if>
            </c:if>

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

    <script>
                                                                function myFunction(e) {
                                                                    if (!confirm('Do you really want to remove food from cart?')) {
                                                                        e.preventDefault();
                                                                    }
                                                                }

                                                                const removeButton = document.querySelectorAll('.removeButton');
                                                                for (let button of removeButton) {
                                                                    button.addEventListener('click', e => {
                                                                        myFunction(e);
                                                                    });
                                                                }
    </script>
</body>
</html>
