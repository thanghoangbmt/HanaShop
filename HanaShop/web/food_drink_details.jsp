<%-- 
    Document   : food_drink_details
    Created on : Feb 28, 2020, 12:11:06 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Food And Drink Details Page</title>
        <link rel="icon" href="img/core-img/favicon.ico">
        <link rel="stylesheet" href="style.css">

        <style>
            .imageCustom {
                width: 1000px !important;
                height: 562px !important;
            }
            
            .pCustom {
                font-size: 20px;
            }
        </style>
    </head>
    <body>
        <div id="preloader">
            <i class="circle-preloader"></i>
            <img src="img/core-img/salad.png" alt="">
        </div>

        <!-- ##### Header Area Start ##### -->
        <%@include file="header.jsp"%>

        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-8">
                    <div class="blog-sidebar-area">
                        <img src="${requestScope.FOOD_AND_DRINK.image}" class="imageCustom">
                    </div>
                </div>

                <!--Blog-->
                <div class="col-12 col-lg-4">
                    <div class="blog-sidebar-area">
                        <form action="AddToCart" method="POST">
                            <div class="mb-15">
                                <button type="submit" class="btn south-btn" name="action" value="Add_To_Cart">Add to Cart</button>
                                <input type="hidden" name="foodID" value="${requestScope.FOOD_AND_DRINK.ID}"/>
                            </div>

                        </form>

                        <div>
                            <font color="blue">${requestScope.ADDTOCART_MESSAGE}</font>
                            <font color="red">${requestScope.ADDTOCART_ERROR}</font>
                        </div>

                        <div class="mb-15">
                            <label for="name">Name:</label>
                            <p class="pCustom" id="name">${requestScope.FOOD_AND_DRINK.name}</p>
                        </div>

                        <div class="mb-15">
                            <label for="description">Description:</label>
                            <p class="pCustom" id="description">${requestScope.FOOD_AND_DRINK.description}</p>
                        </div>

                        <div class="mb-15">
                            <label for="price">Price:</label>
                            <p class="pCustom" id="price">${requestScope.FOOD_AND_DRINK.price}</p>
                        </div>

                        <div class="mb-15">
                            <label for="category">Category:</label>
                            <p class="pCustom" id="category">${requestScope.FOOD_AND_DRINK.category}</p>
                        </div>

                        <div class="mb-15">
                            <label for="date">Since:</label>
                            <p class="pCustom" id="date">${requestScope.FOOD_AND_DRINK.date}</p>
                        </div>


                        <div class="featured-properties-slides owl-carousel">

                            <!-- Single Slide -->
                            <div class="single-featured-property">
                                <!-- Property Thumbnail -->
                                <div class="property-thumb">
                                    <img src="img/bg-img/feature1.jpg" alt="">

                                    <div class="tag">
                                        <span>For Sale</span>
                                    </div>
                                    <div class="list-price">
                                        <p>$945 679</p>
                                    </div>
                                </div>
                                <!-- Property Content -->
                                <div class="property-content">
                                    <h5>Villa in Los Angeles</h5>
                                    <p class="location"><img src="img/icons/location.png" alt="">Upper Road 3411, no.34 CA</p>
                                    <p>Integer nec bibendum lacus. Suspendisse dictum enim sit amet libero malesuada.</p>
                                    <div class="property-meta-data d-flex align-items-end justify-content-between">
                                        <div class="new-tag">
                                            <img src="img/icons/new.png" alt="">
                                        </div>
                                        <div class="bathroom">
                                            <img src="img/icons/bathtub.png" alt="">
                                            <span>2</span>
                                        </div>
                                        <div class="garage">
                                            <img src="img/icons/garage.png" alt="">
                                            <span>2</span>
                                        </div>
                                        <div class="space">
                                            <img src="img/icons/space.png" alt="">
                                            <span>120 sq ft</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Single Slide -->
                            <div class="single-featured-property">
                                <!-- Property Thumbnail -->
                                <div class="property-thumb">
                                    <img src="img/bg-img/feature2.jpg" alt="">

                                    <div class="tag">
                                        <span>For Sale</span>
                                    </div>
                                    <div class="list-price">
                                        <p>$945 679</p>
                                    </div>
                                </div>
                                <!-- Property Content -->
                                <div class="property-content">
                                    <h5>Town House in Los Angeles</h5>
                                    <p class="location"><img src="img/icons/location.png" alt="">Upper Road 3411, no.34 CA</p>
                                    <p>Integer nec bibendum lacus. Suspendisse dictum enim sit amet libero malesuada.</p>
                                    <div class="property-meta-data d-flex align-items-end justify-content-between">
                                        <div class="new-tag">
                                            <img src="img/icons/new.png" alt="">
                                        </div>
                                        <div class="bathroom">
                                            <img src="img/icons/bathtub.png" alt="">
                                            <span>2</span>
                                        </div>
                                        <div class="garage">
                                            <img src="img/icons/garage.png" alt="">
                                            <span>2</span>
                                        </div>
                                        <div class="space">
                                            <img src="img/icons/space.png" alt="">
                                            <span>120 sq ft</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

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
