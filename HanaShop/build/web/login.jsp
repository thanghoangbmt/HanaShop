<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>
        <!--Made with love by Mutiullah Samim -->

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="style.css">
        <script src="js/jquery/jquery-2.2.4.min.js"></script>
        <style>
            body {
                margin: 0;
                padding: 0;
                background-color: #17a2b8;
                height: 100vh;
            }
            #login .container #login-row #login-column #login-box {
                margin-top: 120px;
                max-width: 600px;
                height: 320px;
                border: 1px solid #9C9C9C;
                background-color: #EAEAEA;
            }
            #login .container #login-row #login-column #login-box #login-form {
                padding: 20px;
            }
            #login .container #login-row #login-column #login-box #login-form #register-link {
                margin-top: -85px;
            }
        </style>
    </head>
    <body>
        <div id="login">
            <div class="container">
                <div id="login-row" class="row justify-content-center align-items-center">
                    <div id="login-column" class="col-md-6">
                        <div id="login-box" class="col-md-12">
                            <form id="login-form" action="login" method="post">
                                <h3 class="text-center text-info">Sign In</h3>
                                <div class="form-group">
                                    <label for="email" class="text-info">Username:</label><br>
                                    <input type="email" name="email" id="email" class="form-control" required="true">
                                </div>
                                <div class="form-group">
                                    <label for="password" class="text-info">Password:</label><br>
                                    <input type="password" name="password" id="password" class="form-control" required="true">
                                </div>
                                <div class="form-group">
                                    <button type="submit" name="action" class="btn btn-info btn-md" value="Login">Login</button>
                                    <c:url var="loginLink" value="https://accounts.google.com/o/oauth2/auth">
                                        <c:param name="scope" value="email profile"></c:param>
                                        <c:param name="redirect_uri" value="http://localhost:8080/J3.L.P0005_HanaShop/GoogleLogin"></c:param> 
                                        <c:param name="response_type" value="code"></c:param>
                                        <c:param name="client_id" value="166960664084-gn79cicdiv2e18bh7q83905nqon4o3a5.apps.googleusercontent.com"></c:param>
                                        <c:param name="approval_prompt" value="force"></c:param>
                                    </c:url>
                                    <a href="${loginLink}"><font color="green">Or Login With Google Here</font></a> 
                                </div>
                                <a href="Index"><font color="black">Back to Home</font></a> 
                            </form>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>