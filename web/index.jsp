<%-- 
    Document   : index
    Created on : Apr 15, 2018, 2:48:05 PM
    Author     : austi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Spruce</title>
        <link href="css/style.css" rel="stylesheet">
        <link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" >
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
        <script>
            $(document).ready(function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
                $.get("TopServlet", function(responseJson) {
                    // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...// Create HTML <table> element and append it to HTML DOM element with ID "somediv".
                    $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
                        $("<form>").attr("action", "DisplayMovieServlet").attr("method", "GET").appendTo($("#Upcoming"))                   // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
                        .append($("<input>").attr("name", "movie").attr("value", product.movieID).hide()).append($("<h5>").append($("<input>").attr("type", "submit").attr("value", product.title).attr("style", "padding:0px 0px; background-color: Transparent; border:none;")));
                        // Locate HTML DOM element with ID "somediv" and set its text content with the response text.
                });});
            });
            $(document).ready(function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
                $.get("UpcomingServlet", function(responseJson) {
                    // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...// Create HTML <table> element and append it to HTML DOM element with ID "somediv".
                    $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
                        $("<form>").attr("action", "DisplayMovieServlet").attr("method", "GET").appendTo($("#latest"))                   // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
                        .append($("<input>").attr("name", "movie").attr("value", product.movieID).hide()).append($("<h5>").append($("<input>").attr("type", "submit").attr("value", product.title).attr("style", "padding:0px 0px; background-color: Transparent; border:none;")));
                        // Locate HTML DOM element with ID "somediv" and set its text content with the response text.
                });});
            });
            $(document).ready(function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
                $.get("PopularServlet", function(responseJson) {
                    // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...// Create HTML <table> element and append it to HTML DOM element with ID "somediv".
                    $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
                        $("<form>").attr("action", "DisplayMovieServlet").attr("method", "GET").appendTo($("#popular"))                   // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
                        .append($("<input>").attr("name", "movie").attr("value", product.movieID).hide()).append($("<h5>").append($("<input>").attr("type", "submit").attr("value", product.title).attr("style", "padding:0px 0px; background-color: Transparent; border:none;")));
                        // Locate HTML DOM element with ID "somediv" and set its text content with the response text.
                });});
            });
            $(document).ready(function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
                $.get("PopularTVServlet", function(responseJson) {
                    // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...// Create HTML <table> element and append it to HTML DOM element with ID "somediv".
                    $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
                        $("<form>").attr("action", "DisplayTVServlet").attr("method", "GET").appendTo($("#A3"))                   // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
                        .append($("<input>").attr("name", "televisionID").attr("value", product.televisionID).hide()).append($("<h5>").append($("<input>").attr("type", "submit").attr("value", product.name).attr("style", "padding:0px 0px; background-color: Transparent; border:none;")));
                        // Locate HTML DOM element with ID "somediv" and set its text content with the response text.
                });});
            });
            $(document).ready(function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
                $.get("UpcomingTVServlet", function(responseJson) {
                    // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...// Create HTML <table> element and append it to HTML DOM element with ID "somediv".
                    $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
                        $("<form>").attr("action", "DisplayTVServlet").attr("method", "GET").appendTo($("#A2"))                   // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
                        .append($("<input>").attr("name", "televisionID").attr("value", product.televisionID).hide()).append($("<h5>").append($("<input>").attr("type", "submit").attr("value", product.name).attr("style", "padding:0px 0px; background-color: Transparent; border:none;")));
                        // Locate HTML DOM element with ID "somediv" and set its text content with the response text.
                });});
            });
            $(document).ready(function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
                $.get("LatestTVServlet", function(responseJson) {
                    // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...// Create HTML <table> element and append it to HTML DOM element with ID "somediv".
                    $.each(responseJson, function(index, product) {    // Iterate over the JSON array.
                        $("<form>").attr("action", "DisplayTVServlet").attr("method", "GET").appendTo($("#A1"))                   // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
                        .append($("<input>").attr("name", "televisionID").attr("value", product.televisionID).hide()).append($("<h5>").append($("<input>").attr("type", "submit").attr("value", product.name).attr("style", "padding:0px 0px; background-color: Transparent; border:none;")));
                        // Locate HTML DOM element with ID "somediv" and set its text content with the response text.
                });});
            });
        </script>
        <script>
            $(document).ready(function () {                
                if (${sessionScope.userid} != null) {
                    document.getElementById("user").setAttribute("style", "display: inline;");
                    document.getElementById("loginbtn").setAttribute("style", "display: none");
                    document.getElementById("registerbtn").setAttribute("style", "display: none");
                }
            });
            </script>
        </head>
        <body>
            <fmt:bundle basename="Properties.medialink">
            <!-- Navigation Bar -->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
                <div class="container-fluid padding">
                    <!-- Web LOGO -->
                    <div class="col-sm-3 col-lg-2">
                        <a class="navbar-brand" href="index.jsp"><img style="width:50%; height:50%" src="images/logo.png"></a>
                    </div>
                    <div class="col-sm-9 col-lg-4">
                        <form action="SearchServlet" method="GET" class="navbar-form navbar-left form-inline mx-2 w-50">
                            <div class="input-group position-static" id="search-bar">
                                <input class="rounded-left" name="search" type="search" placeholder="search..">
                                <span class="input-group-append">
                                    <button class="btn btn-outline-secondary" type="search" id="search-button">
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
                                    <a class="nav-link" href="index.jsp">Home</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarMovieDropdownMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Movies
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarMovieDropdownMenu">
                                        <form action="SpecificMoviesServlet" method="GET" class="dropdown-item"><input name="searchChoice" value="1" style="display:none;"/><input type="submit" value="Coming Soon" style="padding:0px 0px; background-color: Transparent; border:none;"/></form> 
                                        <form action="SpecificMoviesServlet" method="GET" class="dropdown-item"><input name="searchChoice" value="2" style="display:none;"/><input type="submit" value="Highest Rated" style="padding:0px 0px; background-color: Transparent; border:none;"/></form> 
                                        <form action="SpecificMoviesServlet" method="GET" class="dropdown-item"><input name="searchChoice" value="3" style="display:none;"/><input type="submit" value="Top Box Office" style="padding:0px 0px; background-color: Transparent; border:none;"/></form> 
                                        <form action="SpecificMoviesServlet" method="GET" class="dropdown-item"><input name="searchChoice" value="4" style="display:none;"/><input type="submit" value="Opening This Week" style="padding:0px 0px; background-color: Transparent; border:none;"/></form> 
                                        <a class="all-link dropdown-item" href="trailers.jsp">Trailers</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarTVDropdownMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        TVs
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarTVDropdownMenu">
                                        <form action="SpecificMoviesServlet" method="GET" class="dropdown-item"><input name="searchChoice" value="5" style="display:none;"/><input type="submit" value="Top Rated TV" style="padding:0px 0px; background-color: Transparent; border:none;"/></form> 
                                        <form action="SpecificMoviesServlet" method="GET" class="dropdown-item"><input name="searchChoice" value="6" style="display:none;"/><input type="submit" value="Certified Fresh" style="padding:0px 0px; background-color: Transparent; border:none;"/></form> 
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarReviewDropdownMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Reviews
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarReviewDropdownMenu">
                                        <a class="dropdown-item" href="criticpage.jsp">Critics</a>
                                        <a class="dropdown-item" href="latestreview.jsp">Latest Reviews</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarAboutDropdownMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        About
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarAboutDropdownMenu">
                                        <a class="dropdown-item" href="criticsapplicationpage.jsp">Critics Application</a>
                                        <a class="dropdown-item" href="contactus.jsp">Contact Us</a>
                                        <a class="dropdown-item" href="about.jsp">About</a>
                                        <a class="dropdown-item" href="help.jsp">Help</a>
                                        <a class="dropdown-item" href="term.jsp">Terms of Service</a>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <button id="registerbtn" type='button' class="btn btn-outline-success" data-toggle="modal" data-target="#Signup">Sign up</button>
                                </li>
                                <li id="loginParent" class="nav-item">
                                    <button id="loginbtn" type='button' class="btn btn-outline-success" data-toggle="modal" data-target="#Login">Log in</button>
                                </li>
                                <li id="user" class="nav-item dropdown" style="display: none;">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarProfileDropdownMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <c:out value="${sessionScope.username}"></c:out>
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarProfileDropdownMenu">
                                        <form action="DisplayUserServlet" method="GET" class="dropdown-item"><input type="submit" value="My Profile" style="padding:0px 0px; background-color: Transparent; border:none;"/></form>
                                        <form action="LogOutServlet" method="POST" class="dropdown-item"><input id="logoutbtn" type="submit" value="Log Out" name="username" style="padding:0px 0px; background-color: Transparent; border:none;"/></form> 
                                    </div>
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
                                    <input name="username" id="lUsername" type="username" class="form-control" placeholder="Username" pattern=".{5,20}" required title="Require 5 to 20 characters" maxlength="20" required="required"/>
                                    <input name="password" id="lPassword" type="text" class="form-control" placeholder="Password" pattern=".{5,20}" required title="Require 5 to 20 characters" maxlength="20" required="required"/>
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
                                    <input id="rUsername" name="username" type="username" class="form-control" placeholder="Username" pattern=".{5,20}" required title="Require 5 to 20 characters" maxlength="20" required="required"/>
                                    <input id="rPassword" name="password" type="text" class="form-control" placeholder="Password" pattern=".{5,20}" required title="Require 5 to 20 characters" maxlength="20" required="required"/>
                                    <input id="rconfirmPassword" name="confirmPassword" type="text" class="form-control" placeholder="Confirm Password" pattern=".{5,20}" required title="Require 5 to 20 characters" maxlength="20" required="required"/>
                                </div>
                                <input class="btn btn-outline-success" type="submit" value="Sign Up" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Slider -->
            <div id="slides" class="carousel slide justify-content-center col-12 mx-auto" data-ride="carousel" style="background-color:black;">
                <ul class="carousel-indicators">
                    <li data-target="#slides" data-slide-to="0" class="active"></li>
                    <li data-target="#slides" data-slide-to="1"></li>
                    <li data-target="#slides" data-slide-to="2"></li>
                </ul>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="images/sl1.jpg" style="width:80%; margin-left: 10%; height:520px;"/>
                    </div>
                    <div class="carousel-item">
                        <img src="images/sl2.jpg" style="width:80%; margin-left: 10%; height:520px;"/>
                    </div>
                    <div class="carousel-item">
                        <img src="images/sl3.jpg" style="width:80%; margin-left: 10%; height:520px;"/>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#slides" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#slides" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <!-- Three things section movies -->
            <div class="container-fluid padding">
                <div class="row text-center padding">
                    <div class="col-xs-12 col-sm-6 col-md-3 mx-auto">
                        <i class="fas fa-film latest"></i>
                        <h4>Latest Movies</h4>
                        <nav id  =  "latest" class="nav flex-column">
                        </nav>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 mx-auto">
                        <i class="fas fa-film upcome"></i>
                        <h4>Upcoming Movies</h4>
                        <nav id = "Upcoming" class="nav flex-column">
                            </nav>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3 mx-auto">
                        <i class="fas fa-film popular"></i>
                        <h4>Popular Movies</h4>
                        <nav id = "popular" class="nav flex-column">
                        </nav>
                    </div>
                </div>
                <hr class="my-4">
            </div>
            <!-- Three things section tvs -->
            <div class="container-fluid padding">
                <div class="row text-center padding">
                    <div class="col-xs-12 col-sm-6 col-md-3 mx-auto">
                        <i class="fas fa-tv latest"></i>
                        <h4>Latest TVs</h4>
                        <nav id = "A1" class="nav flex-column">
                        </nav>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-4">
                        <i class="fas fa-tv upcome"></i>
                        <h4>Upcoming TVs</h4>
                        <nav id = "A2" class="nav flex-column">
                        </nav>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-4">
                        <i class="fas fa-tv popular"></i>
                        <h4>Popular TVs</h4>
                        <nav id = "A3" class="nav flex-column">
                        </nav>
                    </div>
                </div>
                <hr class="my-4">
            </div>
            <!-- Good Rating Section -->
            <div class="container-fluid padding">
                <div class="row padding">
                    <div class="col-sm-12 col-md-4 col-lg-2">
                        <a class="section-link-header" href="highestratedmovie.jsp"><h1>Certified Fresh</h1></a>
                    </div>
                    <div class="col-sm-6 col-md-4 col-lg-2">
                            <h2 align="center"><form class="mt-3" action="DisplayMovieServlet" method="GET"><input name="movie" value="447332" style="color:white; display:none;" /><h5><input type="submit" value="A Quiet Place" style="padding:0px 0px; background-color: Transparent; border:none;"></h5></form></h2>
                            <p class="imgAbt" align="center">
                                <img width="95%" src="images/Movie/447332/nAU74GmpUk7t5iklEp3bufwDq4n.jpg"/>
                            </p>
                    </div>
                    <div class="col-sm-6 col-md-4 col-lg-2">
                            <h2 align="center"><form class="mt-3" action="DisplayMovieServlet" method="GET"><input name="movie" value="299536" style="color:white; display:none;" /><h5><input type="submit" value="Avengers: Infinity War" style="padding:0px 0px; background-color: Transparent; border:none;"></h5></form></h2>
                            <p class="imgAbt" align="center">
                                <img width="95%" src="images/Movie/299536/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg" />
                            </p>
                    </div>
                    <div class="col-sm-6 col-md-4 col-lg-2">
                            <h2 align="center"><form class="mt-3" action="DisplayMovieServlet" method="GET"><input name="movie" value="284054" style="color:white; display:none;" /><h5><input type="submit" value="Black Panther" style="padding:0px 0px; background-color: Transparent; border:none;"></h5></form></h2>
                            <p class="imgAbt" align="center">
                                <img width="95%" src="images/Movie/284054/uxzzxijgPIY7slzFvMotPv8wjKA.jpg" />
                            </p>
                    </div>
                    <div class="col-sm-6 col-md-4 col-lg-2">
                            <h2 align="center"><form class="mt-3" action="DisplayMovieServlet" method="GET"><input name="movie" value="336843" style="color:white; display:none;" /><h5><input type="submit" value="Maze Runner: The Death Cure " style="padding:0px 0px; background-color: Transparent; border:none;"></h5></form></h2>
                            <p class="imgAbt" align="center">
                                <img width="95%" src="images/Movie/336843/7GgZ6DGezkh3szFdvskH5XD4V0t.jpg" />
                            </p>
                    </div>
                </div>
                <hr class="my-4">
            </div>
            <!-- Trailers Section -->
            <div class="container-fluid padding">
                <div class="row welcome text-center">
                    <div class="col-12">
                        <a class="section-link-header" href="trailers.jsp"><h1>TRAILERS</h1></a>
                    </div>
                    <hr class="light">
                </div>
            </div>
            <div class="container-fluid padding">
                <div class="row">
                    <div class="col-md-12 col-lg-8">
                        <p class="imgAbt" align="center">
                        <div class="embed-responsive embed-responsive-21by9">
                             <video width="100%" frameborder="0" controls id="myVideo">
                                <source id="mp4Source" src="assets/videos/1.mp4" type="video/mp4">
                            </video>
                        </div>
                        </p>
                    </div>
                    <div class="col-md-12 col-lg-4">
                        <div class="row">
                            <p class="imgAbt ml-auto" align="center">
                             <video width="100%" frameborder="0" controls id="myVideo">
                                <source id="mp4Source" src="assets/videos/2.mp4" type="video/mp4">
                            </video>
                            </p>
                        </div>
                        <div class="row">
                            <p class="imgAbt ml-auto" align="center">
                             <video width="100%" frameborder="0" controls id="myVideo">
                                <source id="mp4Source" src="assets/videos/3.mp4" type="video/mp4">
                            </video>
                            </p>
                        </div>
                    </div>
                </div>
                <hr class="my-4">
            </div>
            <!-- News -->
            <div class="container-fluid padding">
                <div class="row welcome text-center">
                    <div class="col-12">
                        <h1>NEWS</h1>
                    </div>
                    <hr class="light">
                </div>
            </div>
            <div class="container-fluid padding">
                <div class="row padding">
                    <div class="col-md-6 col-lg-3">
                        <a href="#">
                            <div class="card">
                                <div class="card-body" style="color:black;">
                                    <h4 class="card-title"><a href = "news.jsp">WEEKEND BOX OFFICE RESULTS: A QUIET PLACE RECLAIMS TOP SPOT, AS RAMPAGE DROPS</a></h4>
                                    <p class="card-text">I FEEL PRETTY AND SUPER TROOPERS 2 BEAT EXPECTATIONS FOR THE WEEKEND OF APRIL 20-22.</p>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <a href="#">
                            <div class="card">
                                <div class="card-body" style="color:black;">
                                    <h4 class="card-title"><a href = "news2.jsp">WESTWORLD RETURNS WITH DOLORES’ GUNS BLAZING IN SEASON 2 PREMIERE</a></h4>
                                    <p>BOTH THE RANCHER’S DAUGHTER AND FORMER BROTHEL MADAM MAEVE ARE EACH ON A RAMPAGE IN THEIR OWN CHARMING WAYS</p>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <a href="#">
                            <div class="card">
                                <div class="card-body" style="color:black;">
                                    <h4 class="card-title"><a href = "news3.jsp">HEAR US OUT: THANOS MIGHT NOT ACTUALLY BE SUCH A BAD GUY</a></h4>
                                    <p class="card-text">IS THE MAD TITAN REALLY JUST A MISUNDERSTOOD, LOVESICK LONER IN NEED OF A HOME, SOME LOVE, AND A REALLY BIG HUG?</p>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <a href="#">
                            <div class="card">
                                <div class="card-body" style="color:black;">
                                    <h4 class="card-title"><a href = "news4.jsp">STEVEN SPIELBERG MAY DIRECT DC'S BLACKHAWK, AND MORE MOVIE NEWS<a></h4>
                                    <p class="card-text">THE HARLEY QUINN SPINOFF GETS A DIRECTOR, F. GARY FRAY TACKLES M.A.S.K., TARON EGERTON WILL PLAY ELTON JOHN, AND A NEW TERMINATOR IS CAST.</p>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                <hr class="my-4">
            </div>
            <!-- ads -->
            <div class="container-fluid padding">
                <div class="row padding text-center">
                    <div class="col-6 mx-auto">
                        <img src="images/ads.jpg" style="width:80%" alt="Responsive image" class="center" />
                    </div>
                    <div class="col-6 mx-auto">
                        <img src="images/ads_2.jpg" style="width:80%" alt="Responsive image" class="center" />
                    </div>
                </div>
                <hr class="my-4">
            </div>
            <!-- Footer -->
            <footer>
                <div class="container-fluid padding">
                    <div class="row text-center padding">
                        <h4 class="col-12">Connect With Us: </h4>
                        <div class="col-12 social padding"> 
                            <a href="<fmt:message key="facebooklink"></fmt:message>"><i class="fab fa-facebook"></i></a>
                            <a href="<fmt:message key="twitterlink"></fmt:message>"><i class="fab fa-twitter"></i></a>
                            <a href="mailto:<fmt:message key="emaillink"></fmt:message>"><i class="fas fa-envelope"></i></a>
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
                $(document).ready(function () {
                    <c:if test="${requestScope.pwCheck == true}">
                            alert("Registered!");
                    </c:if>
                });
        </script>
        </fmt:bundle>
    </body>
</html>
