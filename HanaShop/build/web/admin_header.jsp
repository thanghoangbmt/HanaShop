<header class="header-area">

    <!-- Top Header Area -->
    <div class="top-header-area">
        <div class="container h-100">
            <div class="row h-100 align-items-center justify-content-between">
                <!-- Breaking News -->
                <div class="col-12 col-sm-6">
                    <div class="breaking-news">
                        <div id="breakingNewsTicker" class="ticker">
                            <ul>
                                <c:if test="${sessionScope.USER != null}">
                                    <li><a href="# ">Hello ${sessionScope.USER.name}!</a></li>
                                </c:if>

                                <li><a href="# ">Welcome to Delicous.</a></li>
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
                    <a class="nav-brand" href="AdminIndex"><img src="img/core-img/logo.png" alt=""></a>

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
                                    <a href="AdminIndex">Home</a>
                                </li>
                                
                                <li>
                                    <a href="AdminPreAddNewFoodAndDrink" class="btn">Add new Food/Drink</a>
                                </li>
                                
                                <li>
                                    <a href="AdminViewInvoiceHistory" class="btn">View Invoice History</a>
                                </li>
                                
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