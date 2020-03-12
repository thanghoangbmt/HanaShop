<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="header-area">

    <!-- Top Header Area -->
    <div class="top-header-area" style="background-color: #f4dbdb">
        <div class="container h-100">
            <div class="row h-100 align-items-center justify-content-between">
                <!-- Breaking News -->
                <div class="col-12 col-sm-6">
                    <div class="breaking-news">
                        <div id="breakingNewsTicker" class="ticker">
                            <ul>
                                <c:if test="${sessionScope.USER != null}">
                                    <li>
                                        <a href="#">Hello ${sessionScope.USER.name}!</a>
                                    </li>
                                </c:if>

                                <li><a href="#">Welcome to Delicous.</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Navbar Area -->
    <div class="delicious-main-menu">
        <div class="classy-nav-container breakpoint-off">
            <div class="container">
                <!-- Menu -->
                <nav class="classy-navbar justify-content-between" id="deliciousNav">

                    <!-- Logo -->
                    <a class="nav-brand" href="Index"><img src="img/core-img/logo.png" alt=""></a>

                    <!-- Navbar Toggler -->
                    <div class="classy-navbar-toggler">
                        <span class="navbarToggler"><span></span><span></span><span></span></span>
                    </div>

                    <!-- Menu -->
                    <div class="classy-menu">

                        <!-- close btn -->
                        <div class="classycloseIcon">
                            <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                        </div>

                        <!-- Nav Start -->
                        <div class="classynav">
                            <ul>
                                <li>
                                    <a href="Index">Home</a>
                                </li>

                                <c:if test="${sessionScope.USER != null }">
                                    <li>
                                        <a href="ViewInvoiceHistory">View Invoice History</a>
                                    </li>
                                </c:if>

                                <c:if test="${sessionScope.CART != null}">
                                    <c:if test="${sessionScope.CART.getCart().size() > 0}">
                                        <li>
                                            <a href="shopping_cart.jsp">View Cart(${sessionScope.CART.cart.size()})</a>
                                        </li>
                                    </c:if>
                                </c:if>

                                <c:if test="${sessionScope.USER == null}">
                                    <li>
                                        <a href="login.jsp">Login</a>
                                    </li>
                                </c:if>

                                <c:if test="${sessionScope.USER != null}">
                                    <li>
                                        <a href="Logout">Logout</a>
                                    </li>
                                </c:if>

                            </ul>

                        </div>
                        <!-- Nav End -->
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>