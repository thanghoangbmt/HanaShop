<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!-- Title -->
        <title>Delicious - Food & Drink | Home</title>

        <!-- Favicon -->
        <link rel="icon" href="img/core-img/favicon.ico">

        <!-- Core Stylesheet -->
        <link rel="stylesheet" href="style.css">

        <style>
            .FoodImage {
                width: 240px !important; 
                height: 209.16px !important;
            }
        </style>

    </head>

    <body>
        <!-- Preloader -->
        <div id="preloader">
            <i class="circle-preloader"></i>
            <img src="img/core-img/salad.png" alt="">
        </div>

        <!-- ##### Header Area Start ##### -->
        <%@include file="header.jsp"%>
        <!-- ##### Header Area End ##### -->

        <!-- ##### Hero Area Start ##### -->
        <section class="hero-area">
            <div class="hero-slides owl-carousel">
                <!-- Single Hero Slide -->
                <div class="single-hero-slide bg-img" style="background-image: url(img/bg-img/bg1.jpg);">
                    <div class="container h-100">
                        <div class="row h-100 align-items-center">
                            <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                                <div class="hero-slides-content" data-animation="fadeInUp" data-delay="100ms">
                                    <h2 data-animation="fadeInUp" data-delay="300ms">Delicios Homemade Burger</h2>
                                    <p data-animation="fadeInUp" data-delay="700ms">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tristique nisl vitae luctus sollicitudin. Fusce consectetur sem eget dui tristique, ac posuere arcu varius.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Single Hero Slide -->
                <div class="single-hero-slide bg-img" style="background-image: url(img/bg-img/bg6.jpg);">
                    <div class="container h-100">
                        <div class="row h-100 align-items-center">
                            <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                                <div class="hero-slides-content" data-animation="fadeInUp" data-delay="100ms">
                                    <h2 data-animation="fadeInUp" data-delay="300ms">Delicios Homemade Burger</h2>
                                    <p data-animation="fadeInUp" data-delay="700ms">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tristique nisl vitae luctus sollicitudin. Fusce consectetur sem eget dui tristique, ac posuere arcu varius.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Single Hero Slide -->
                <div class="single-hero-slide bg-img" style="background-image: url(img/bg-img/bg7.jpg);">
                    <div class="container h-100">
                        <div class="row h-100 align-items-center">
                            <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                                <div class="hero-slides-content" data-animation="fadeInUp" data-delay="100ms">
                                    <h2 data-animation="fadeInUp" data-delay="300ms">Delicios Homemade Burger</h2>
                                    <p data-animation="fadeInUp" data-delay="700ms">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tristique nisl vitae luctus sollicitudin. Fusce consectetur sem eget dui tristique, ac posuere arcu varius.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ##### Hero Area End ##### -->

        <div style="padding-top: 2rem">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="advanced-search-form">
                            <!-- Search Title -->
                            <div class="search-title">
                                <p>Food & Drink Search</p>
                            </div>
                            <!-- Search Form -->
                            <form action="SearchFoodAndDrink" method="POST" name="searchForm">

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

        <!-- ##### Best Receipe Area Start ##### -->
        <section class="best-receipe-area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-heading">
                            <h3>List Food & Drink</h3>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <c:if test="${requestScope.LIST_FOOD_AND_DRINK != null}">
                        <c:if test="${not empty requestScope.LIST_FOOD_AND_DRINK}">
                            <c:forEach var="list" varStatus="counter" items="${requestScope.LIST_FOOD_AND_DRINK}">
                                <!-- Single Best Receipe Area -->
                                <div class="col-12 col-sm-6 col-lg-3">
                                    <div class="single-best-receipe-area mb-30">
                                        <img class="FoodImage" src="${list.image}" width="240" height="209.16">
                                        <div class="receipe-content">
                                            <h5>${list.name}</h5>
                                            <h5><font color="#4d78b8">$${list.price}</font></h5>
                                            <span><font color="#4d78b8">Since ${list.date}</font></span>
                                            <div class="ratings">
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                <i class="fa fa-star-o" aria-hidden="true"></i>
                                            </div>
                                            <form action="ViewFoodDetails" method="POST">
                                                <button class="btn btn-2">View Details</button>
                                                <input type="hidden" name="foodID" value="${list.ID}"/>
                                            </form>
                                        </div>
                                    </div>

                                </div>
                            </c:forEach>
                        </c:if>

                        <c:if test="${empty requestScope.LIST_FOOD_AND_DRINK}">
                            <div class="mt-15">
                                <h3 class="text-center text-info">Nothing to display!</h3>
                            </div>
                        </c:if>
                    </c:if>
                </div>

                <div class="row">
                    <div class="col">
                        <div class="block-27">
                                <c:if test="${requestScope.NB_PAGE.size() > 1}">
                                        <c:url var="pageFrist" value="Pagination">
                                            <c:param name="page" value="1"/>
                                        </c:url>
                                        <a href="${pageFrist}">&lt;</a>
                                    <c:forEach var="page" varStatus="counter" items="${requestScope.NB_PAGE}">

                                        <c:url var="pageNumber" value="Pagination">
                                            <c:param name="page" value="${page}"/>
                                        </c:url>

                                            <a href="${pageNumber}">${counter.count}</a>

                                    </c:forEach>
                                        <c:url var="pageLast" value="Pagination">
                                            <c:param name="page" value="${requestScope.NB_PAGE.size()}"/>
                                        </c:url>
                                        <a href="${pageLast}">&gt;</a>
                                </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ##### Best Receipe Area End ##### -->




        <!-- ##### Footer Area Start ##### -->
        <%@include file="footer.jsp" %>
        <!-- ##### Footer Area Start ##### -->

        <!-- ##### All Javascript Files ##### -->
        <!-- jQuery-2.2.4 js -->
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