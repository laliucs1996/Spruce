<%-- 
    Document   : openthisweek
    Created on : Apr 28, 2018, 7:10:51 PM
    Author     : Austin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Opening This Week</title>
        <link href="css/style.css" rel="stylesheet">
        <link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" >
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
        <script>
            $(document).ready(function() {
                if(${sessionScope.userid} != null) {
                    document.getElementById("logoutbtn").setAttribute("style", "display: inline;");
                    document.getElementById("logoutbtn").innerHTML = '<c:out value="${sessionScope.username}"></c:out>';
                    document.getElementById("loginbtn").setAttribute("style", "display: none");
                    document.getElementById("registerbtn").setAttribute("style", "display: none");
                }
            });
        </script>
    </head>
    <body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
    <div class="container-fluid padding">
        <!-- Web LOGO -->
        <div class="col-sm-3 col-lg-2">
            <a class="navbar-brand" href="#"><img style="width:50%; height:50%" src="images/logo.png"></a>
        </div>
        <div class="col-sm-9 col-lg-4">
        <form action="SearchServlet" method="GET" class="navbar-form navbar-left form-inline mx-2 w-50">
            <div class="input-group position-static" id="search-bar">
                <input class="rounded-left" name="search" type="search" placeholder="search..">
                <span class="input-group-append">
                    <button class="btn btn-outline-secondary" type="submit" id="search-button">
                        <i class="fa fa-search"></i>
                    </button>
                </span>
            </div>
        </form>
        </div>
        <!-- Collapse Menu Button -->
        <div class="col-sm-12 col-lg-6">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!-- Navbar items-->
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarMovieDropdownMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Movies
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarMovieDropdownMenu">
                        <a class="dropdown-item" href="#">Coming soon</a>
                        <a class="dropdown-item" href="#">Highest rated</a>
                        <a class="dropdown-item" href="#">Top box office</a>
                        <a class="dropdown-item" href="#">Opening this week</a>
                        <a class="dropdown-item" href="#">Academy award winner</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarTVDropdownMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        TVs
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarTVDropdownMenu">
                        <a class="dropdown-item" href="#">Top rated</a>
                        <a class="dropdown-item" href="#">Certified fresh</a>
                        <a class="dropdown-item" href="#">New TV show tonight</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarNewsDropdownMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        News
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarNewsDropdownMenu">
                        <a class="dropdown-item" href="#">News</a>
                        <a class="dropdown-item" href="#">Critics</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" >About</a>
                </li>
                <li class="nav-item">
                    <button id="registerbtn" type='button' class="btn btn-outline-success" data-toggle="modal" data-target="#Signup">Sign up</button>
                </li>
                <li id="loginParent" class="nav-item">
                    <form action="LogOutServlet" method="POST"><button id="logoutbtn" type="submit" name="username" class="btn btn-outline-success" style="display: none;">Log Out</button></form>
                    <button id="loginbtn" type='button' class="btn btn-outline-success" data-toggle="modal" data-target="#Login">Log in</button>
                </li>
            </ul>
        </div>
        </div>
    </div>
    </nav>
    <!-- Pop up Login -->
    <!-- log in page -->
        <div class="modal fade" id="Login">
            <div class="modal-dialog">
                <div class="modal-content">
                <!-- header -->
                    <div class="modal-header">
                        <h3 class="modal-title">Log In</h3>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                <!-- body -->
                    <div class="modal-body">
                        <form class="navbar-form" action="LoginServlet" method="POST">
                            <div class="form-group">
                                <input name="username" id="lUsername" type="text" class="form-control" placeholder="Username"/>
                                <input name="password" id="lPassword" type="text" class="form-control" placeholder="Password" />
                            </div>
                            <input class="btn btn-outline-success" type="submit" value="Log In"/>
                        </form>
                    </div>
                <!-- footer -->
                </div>
            </div>
        </div>
    <!-- sign up page -->
        <div class="modal fade" id="Signup">
            <div class="modal-dialog">
                <div class="modal-content">
                <!-- header -->
                    <div class="modal-header">
                        <h3 class="modal-title">Create account</h3>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                <!-- body -->
                    <div class="modal-body">
                        <form role="form" action="RegisterServlet" method="POST">
                            <div class="form-group">
                                <input id="rUsername" name="username" type="text" class="form-control" placeholder="Username"/>
                                <input id="rPassword" name="password" type="text" class="form-control" placeholder="Password" />
                                <input id="rconfirmPassword" name="confirmPassword" type="text" class="form-control" placeholder="Confirm Password" />
                            </div>
                            <input class="btn btn-outline-success" type="submit" value="Sign Up" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    <!-- Title -->
    <div class="container-fluid padding">
        <div class="row padding">
            <div class="col-12 text-center">
                <h3>Opening This Week</h3>
            </div>
        </div>
        <hr class="my-4">
    </div>
    <!-- Movie List body -->
    <div class="container-fluid padding">
        <div class="row padding">
            <div class="col-12">
                <div class="row padding">
                    <div class="col-5 border border-secondary my-2 mx-auto">
                        <div class="row padding">
                            <div class="col-5">
                                <a href="#">
                                    <img width="95%" src="images/video.png"/>
                                </a>
                            </div>
                            <div class="col-7">
                                <p>The rating</p>
                                <a href="#" class="all-link">
                                    <h4>Movie Title</h4>
                                </a>
                                <p>years</p>
                                <p>movie info</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-5 border border-secondary my-2 mx-auto">
                        <div class="row padding">
                            <div class="col-5">
                                <a href="#">
                                    <img width="95%" src="images/video.png"/>
                                </a>
                            </div>
                            <div class="col-7">
                                <p>The rating</p>
                                <a href="#" class="all-link">
                                    <h4>Movie Title</h4>
                                </a>
                                <p>years</p>
                                <p>movie info</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr class="my-4">
    </div>
    
    <!-- Footer -->
    <footer>
        <div class="container-fluid padding">
            <div class="row text-center padding">
                <a href="#" class="col-12 padding" style="color:black;"><h4>Connect With Us: </h4></a>
                <div class="col-12 social padding"> 
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fas fa-envelope"></i></a>
                    <a href="#"><i class="fab fa-google-plus-g"></i></a>
                </div>
                <hr class="light">
                <div class="copyright col-12">
                    <h5>&copy; cse308Spruce@stonybrook</h5>
                </div>
            </div>
        </div>
    </footer>
    <script>
        /*function register() {
            String params = "username=" + document.getElementById("rUsername").innerHTML + "&password=" + document.getElementById("rPassword") + "&confirmPassword=" + document.getElementById("rConfirmPassword");
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "RegisterServlet", true);
            xhr.onreadystatechange = function () {
                if(xhr.readyState === 4 && xhr.status === 200) {
                  alert("SENT");
                }
                else
                    alert("ERROR");
              };
            xhr.send();
        }*/
        $(document).ready(function(){ 
            <c:if test="${requestScope.pwCheck == true}">
                 alert("Registered!");
            </c:if>
         });
    </script>
</body>
</html>

