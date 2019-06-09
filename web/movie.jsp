<%-- 
    Document   : movie
    Created on : Apr 23, 2018, 10:34:47 AM
    Author     : Austin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang = "en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Movie</title>
        <link href="css/style.css" rel="stylesheet">
        <link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" >
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
        <script>
            $(document).ready(function () {                
                if (${sessionScope.userid == null}) {
                    $("#reviewsectionbody").hide();
                    $("#reviewsectionbody_n").show();
                    
                }
                else{
                    document.getElementById("user").setAttribute("style", "display: inline;");
                    document.getElementById("loginbtn").setAttribute("style", "display: none");
                    document.getElementById("registerbtn").setAttribute("style", "display: none");
                    $("#reviewsectionbody").show();
                    $("#reviewsectionbody_n").hide();
                }
            });
        </script>
        <script>
            $(document).ready(function () {                
                if (${sessionScope.userType == "admin"}) {
                    $("#deleteBtn").show();
                }
                else{
                    $("#deleteBtn").hide();
                }
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function() {
                $("#reviewbtn").click( function() { 
                    $.post("AddReviewServlet", $("#reviewForm").serialize(), function(responseText) {  
                        alert(responseText);
                    });
                    var ratingVal = $("#rating").val();
                    $.post("AddMovieRatingServlet", { userId: ${sessionScope.userid}, movieId: ${requestScope.movie.movieID}, rating: ratingVal}, function(responseText) {
                        
                    });
                });
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function() {
                $("#removereviewbtn").click( function() { 
                    $.post("RemoveReviewServlet", $("#removeReviewForm").serialize(), function(responseText) { 
                        alert(responseText);
                        $("#comment").val("");
                    });
                    $.post("RemoveMovieRatingServlet", { userId: ${sessionScope.userid}, movieId: ${requestScope.movie.movieID}}, function(reponseText) {
                        $("#rating").val("0");
                    });
                });
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function() {
                $.get("GetReviewServlet", $("#getReviewForm").serialize(), function(responseText) {
                    $("#comment").val(responseText);
                }); 
                $.get("GetMovieRatingServlet", { userId: ${sessionScope.userid}, movieId: ${requestScope.movie.movieID}}, function(responseText) {
                    $("#rating").val(responseText);
                });
                $.get("GetWTSLServlet", { movieId: ${requestScope.movie.movieID}}, function(responseText) {
                   if(responseText == "1") {
                       document.getElementById("wantToSeeBtn").setAttribute("style", "display:none;");
                       document.getElementById("removeWantToSeeBtn").setAttribute("style", "display:inline;");
                   }
                });
                $.get("GetNIMLServlet", { movieId: ${requestScope.movie.movieID}}, function(responseText) {
                   if(responseText == "1") {
                       document.getElementById("notInterestedBtn").setAttribute("style", "display:none;");
                       document.getElementById("removeNotInterestedBtn").setAttribute("style", "display:inline;");
                   }
                });
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function() {
               $("#wantToSeeBtn").click( function() {
                   $.post("AddToWTSLServlet", { movieId: ${requestScope.movie.movieID}}, function(responseText) {
                       document.getElementById("wantToSeeBtn").setAttribute("style", "display:none;");
                       document.getElementById("removeWantToSeeBtn").setAttribute("style", "display:inline;");
                       alert(responseText);
                   });
               }); 
               $("#removeWantToSeeBtn").click( function() {
                   $.post("RemoveWTSLServlet", { movieId: ${requestScope.movie.movieID}}, function(responseText) {
                       document.getElementById("wantToSeeBtn").setAttribute("style", "display:inline;");
                       document.getElementById("removeWantToSeeBtn").setAttribute("style", "display:none;");
                       alert(responseText);
                   });
               }); 
               $("#notInterestedBtn").click(function() {
                   $.post("AddToNotInterestedServlet", { movieId: ${requestScope.movie.movieID}}, function(responseText) {
                        document.getElementById("notInterestedBtn").setAttribute("style", "display:none;");
                        document.getElementById("removeNotInterestedBtn").setAttribute("style", "display:inline;");
                        alert(responseText);
                   });
               });
               $("#removeNotInterestedBtn").click(function() {
                   $.post("RemoveNotInterestedServlet", { movieId: ${requestScope.movie.movieID}}, function(responseText) {
                        document.getElementById("notInterestedBtn").setAttribute("style", "display:inline;");
                        document.getElementById("removeNotInterestedBtn").setAttribute("style", "display:none;");
                        alert(responseText);
                   });
               });
            });
        </script>
        </head>
        <body>
            <div id="test"></div>
            <form id="getReviewForm" style="display:none;">
                <input name="movieID" value="${requestScope.movie.movieID}" style="display:none;"/>
            </form>
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
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarTVDropdownMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        TVs
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarTVDropdownMenu">
                                        <form action="SpecificMoviesServlet" method="GET" class="dropdown-item"><input name="searchChoice" value="5" style="display:none;"/><input type="submit" value="Top Rated TV" style="padding:0px 0px; background-color: Transparent; border:none;"/></form> 
                                        <form action="SpecificMoviesServlet" method="GET" class="dropdown-item"><input name="searchChoice" value="6" style="display:none;"/><input type="submit" value="Certified Fresh" style="padding:0px 0px; background-color: Transparent; border:none;"/></form> 
                                        <a class="dropdown-item" href="#">New TV Show Tonight</a>
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
                                        <a class="dropdown-item" href="term.jsp">Term</a>
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
                                        <form action="DisplayUserServlet" method="GET" class="dropdown-item"><input type="submit" value="My Profile"/></form>
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
            <!-- Person info and highest rate movies -->
            <div class="container-fluid padding">
                <div class="row padding">
                    <!-- Image here -->
                    <div class="col-sm-6 col-md-4 col-lg-4">
                        <p class="imgAbt" align="center">
                            <img class="card-img-top w-100 d-block" src="images/Movie/<c:out value="${requestScope.movie.movieID}"></c:out><c:out value="${requestScope.movie.poster}"></c:out>"
                        </p>
                    </div>
                    <!-- information here -->
                    <div class="col-sm-12 col-md-8 col-lg-8">
                        <div class="row padding">
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <h4>
                                <c:out value="${requestScope.movie.title}"></c:out>
                                </h4>
                                <button id="deleteBtn" type="remove" class="btn btn-sm btn-outline-danger" data-toggle="modal" data-target="#Delete">Delete Movie</button>
                                <!-- delete pupop -->
                                <div class="modal fade" id="Delete">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                        <!-- header -->
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>
                                        <!-- body -->
                                            <div class="modal-body">
                                                <form class="navbar-form" style="display:inline;" action="DeleteMovieServlet" method="POST">
                                                    <p>Are you sure you want delete this movie?</p>
                                                    <input name="movieId" value="${requestScope.movie.movieID}" style="display:none;"/>
                                                    <input class="btn btn-outline-danger" type="submit" value="Yes"/>
                                                </form>
                                                <button class="btn btn-outline-success" type="button" class="close" data-dismiss="modal">No</button>
                                            </div>
                                        <!-- footer -->
                                        </div>
                                    </div>
                                </div>
                                <dl class="row cele-info">
                                    <dt class="col-sm-3">Rating: 
                                        <c:if test="${not empty requestScope.averageRating}">
                                            ${requestScope.averageRating}
                                        </c:if>
                                        / 5.0
                                    </dt>
                                    <dd class="col-12">
                                        <button id="wantToSeeBtn" class="btn btn-sm btn-outline-danger">+ Want to see</button>
                                        <button id="removeWantToSeeBtn" class="btn btn-sm btn-outline-danger" style="display:none;">- Want to see</button>
                                        <button id="notInterestedBtn" class="btn btn-sm btn-outline-warning">+ Not interested</button>
                                        <button id="removeNotInterestedBtn" class="btn btn-sm btn-outline-warning" style="display:none;">- Not interested</button>
                                    </dd>
                                    <dd class="col-sm-12">
                                        <h5>Overview</h5>
                                        <p>
                                        <c:out value="${requestScope.movie.overview}"></c:out>
                                        </p>
                                    </dd>
                                    <dd class="col-sm-12">
                                        <h5>Featured Crew</h5>
                                        <div class="row padding">
                                            <div class="col-4">
                                                <a href="#" class="all-link"><h6><c:out value="${requestScope.mcrew[0].name}"></c:out></h6></a>
                                            <p><c:out value="${requestScope.mcrew[0].movieCrewPK.job}"></c:out></p>
                                            </div>
                                            <div class="col-4">
                                                <a href="#" class="all-link"><h6><c:out value="${requestScope.mcrew[1].name}"></c:out></h6></a>
                                            <p><c:out value="${requestScope.mcrew[1].movieCrewPK.job}"></c:out></p>
                                            </div>
                                            <div class="col-4">
                                                <a href="#" class="all-link"><h6><c:out value="${requestScope.mcrew[2].name}"></c:out></h6></a>
                                            <p><c:out value="${requestScope.mcrew[2].movieCrewPK.job}"></c:out></p>
                                            </div>
                                            <div class="col-4">
                                                <a href="#" class="all-link"><h6><c:out value="${requestScope.mcrew[3].name}"></c:out></h6></a>
                                            <p><c:out value="${requestScope.mcrew[3].movieCrewPK.job}"></c:out></p>
                                            </div>
                                            <div class="col-4">
                                                <a href="#" class="all-link"><h6><c:out value="${requestScope.mcrew[4].name}"></c:out></h6></a>
                                            <p><c:out value="${requestScope.mcrew[4].movieCrewPK.job}"></c:out></p>
                                            </div>
                                        </div>
                                    </dd>
                                </dl>
                            </div> 
                        </div>
                    </div>
                </div>
                <hr class="my-4">
            </div>
            <!-- trailers section title -->
            <div class="container-fluid padding">
                <div class="row padding text-center">
                    <div class="col-12">
                        <h1>TRAILERS</h1>
                    </div>
                    <hr class="light">
                </div>
            </div>
            <!-- trailers section title -->
            <div class="container-fluid padding">
                <div class="row padding text-center">
                    <div class="col-8 mx-auto">
                        <div class="vid-container">
                            <video width="100%" frameborder="0" controls autoplay id="myVideo">
                                <source id="mp4Source" src="assets/videos/${requestScope.trailer.path}" type="video/mp4">
                            </video>
                        </div>
                    </div>
                    <hr class="light">
                </div>
            </div>
            <!-- add/edit review and rating title -->
            <div class="container-fluid padding">
                <div class="row welcome text-center">
                    <div class="col-12">
                        <h1>ADD A REVIEW</h1>
                    </div>
                    <hr class="light">
                </div>
            </div>
            <!-- add/edit review and rating detail if not log in-->
            <div id="reviewsectionbody_n" class="container-fluid padding">
                <div class="row padding">
                    <div class="col-8 mx-auto text-center">
                        <p>Please Log In To Add/Edit Review.</p>
                    </div>
                </div>
                <hr class="light">
            </div>
            <!-- add/edit review and rating detail -->
            <div id="reviewsectionbody" class="container-fluid padding">
                <!-- rating place -->
                <div class="row padding">
                    <div class="col-12">
                        <p class="d-inline">Rating: <x-star-rating value="0" id="rating"></x-star-rating></p>
                    </div>
                </div>
                <!-- review place -->
                <div class="row padding">
                    <div class="col-12">
                        <div class="form-group">
                            <label for="comment">Review:</label>
                            <form id="reviewForm" style="display:inline;">
                                <textarea name="review" class="form-control" rows="5" id="comment"></textarea>
                                <input name="movieID" value="${requestScope.movie.movieID}" style="display:none;"/>
                                <input type="button" id="reviewbtn" class="btn btn-sm btn-outline-secondary mt-3" value="Submit"/>
                            </form>
                            <form id="removeReviewForm" style="display:inline;">
                                <input name="movieID" value="${requestScope.movie.movieID}" style="display:none;"/>
                                <input type="button" id="removereviewbtn" class="btn btn-sm btn-outline-secondary mt-3" value="Remove"/>
                            </form>
                        </div>
                    </div>
                </div>
                <hr class="my-4">
            </div>
            <!-- cast title -->
            <div class="container-fluid padding">
                <div class="row welcome text-center">
                    <div class="col-12">
                        <h1>CAST</h1>
                    </div>
                    <hr class="light">
                </div>
            </div>
            <!-- cast info -->
            <div class="container-fluid padding">
                <div class="row text-center padding">
                    <c:forEach items="${requestScope.mcast}" var="item">
                        <div class="col-2 border mx-3 my-3">
                            <a class="bmp-link" href="#">
                                <p class="imgAbt" align="center">
                                    <img width="80%" src="images/People/${item.movieCastPK.peopleID}${item.profilePath}"/>
                                </p>
                                <h4 align="center"><c:out value="${item.name}"></c:out></h4>
                            </a>
                        </div>
                    </c:forEach>         
                </div>
                <hr class="my-4">
            </div>
            <!-- movie detail title -->
            <div class="container-fluid padding">
                <div class="row welcome text-center">
                    <div class="col-12">
                        <h1>MOVIE INFO</h1>
                    </div>
                    <hr class="light">
                </div>
            </div>
            <!-- movie detail info -->
            <div class="container-fluid padding">
                <div class="row text-center">
                    <div class="col-12">
                        <dl class="row cele-info">
                            <dt class="col-6"><div class="float-right">Genre:</div></dt>
                            <dd class="col-6">
                                <div class="float-left">
                                <c:if test="${fn:length(requestScope.genres) > 1}">
                                    <c:forEach items="${requestScope.genres}" var="genres" end="${fn:length(requestScope.genres) - 2}">
                                        <c:out value="${genres.name}"></c:out> ,
                                    </c:forEach>
                                </c:if>
                                <c:out value="${requestScope.genres[fn:length(requestScope.genres) - 1].name}"></c:out>
                                </div>
                            </dd>
                            <dt class="col-6"><div class="float-right">Directed By:</div></dt>
                            <dd class="col-6"><div class="float-left">
                                    <a class="all-link" href="#">
                                    <c:if test="${fn:length(requestScope.mdirectors) > 1}">
                                        <c:forEach items="${requestScope.mdirectors}" var="directors" end="${fn:length(requestScope.mdirectors) - 2}">
                                            <c:out value="${directors.name}"></c:out> ,
                                        </c:forEach>
                                    </c:if>
                                    <c:out value="${requestScope.mdirectors[fn:length(requestScope.mdirectors) - 1].name}"></c:out>
                                    </a>
                                </div>
                            </dd>
                            <dt class="col-6"><div class="float-right">Written By:</div></dt>
                            <dd class="col-6"><div class="float-left">
                                    <a class="all-link" href="#">
                                    <c:if test="${fn:length(requestScope.mwriters) > 1}">
                                        <c:forEach items="${requestScope.mwriters}" var="writers" end="${fn:length(requestScope.mwriters) - 2}">
                                            <c:out value="${writers.name}"></c:out> ,
                                        </c:forEach>
                                    </c:if>
                                    <c:out value="${requestScope.mwriters[fn:length(requestScope.mwriters) - 1].name}"></c:out>
                                    </a>
                                </div>
                            </dd>
                            <dt class="col-6"><div class="float-right">Release Date:</div></dt>
                            <dd class="col-6"><div class="float-left"><c:out value="${requestScope.movie.releaseDate}"></c:out></div></dd>
                            <dt class="col-6"><div class="float-right">Runtime:</div></dt>
                            <dd class="col-6"><div class="float-left"><c:out value="${requestScope.movie.runtime}"></c:out> minutes</div></dd>
                            <dt class="col-6"><div class="float-right">Studio:</div></dt>
                            <dd class="col-6">
                                <div class="float-left">
                                <c:if test="${fn:length(requestScope.pc) > 1}">
                                    <c:forEach items="${requestScope.pc}" var="pc" end="${fn:length(requestScope.pc) - 2}">
                                        <c:out value="${pc.name}"></c:out> ,
                                    </c:forEach>
                                </c:if>
                                <c:out value="${requestScope.pc[fn:length(requestScope.pc) - 1].name}"></c:out>
                            </div>
                        </dd>
                    </dl>
                </div>
                <hr class="light">
            </div>
        </div>
        <!-- reviews title -->
        <div class="container-fluid padding">
            <div class="row welcome text-center">
                <div class="col-12">
                    <h1>CRITIC REVIEWS</h1>
                </div>
                <hr class="light">
            </div>
        </div>
        <!-- movie photos body -->
        <div class="container-fluid padding">
            <div class="row padding">
                <c:forEach items="${requestScope.criticReviews}" var="item">
                    <div class="border col-4 mx-auto my-3">
                        <div class="row padding">
                            <div class="col-2">
                                <img width="50px" height="50px" src="images/profile.png"/>
                            </div>
                            <div class="col-10">
                                <a href="#" class="all-link"><h6>${item.userName}</h6></a>
                                <p><r-star-rating value="${item.rating}"></r-star-rating></p>
                            </div>
                        </div>
                        <p>${item.review}</p>
                    </div>
                </c:forEach>
            </div>
            <hr class="my-4">
        </div>
        <!-- user reviews title -->
        <div class="container-fluid padding">
            <div class="row welcome text-center">
                <div class="col-12">
                    <h1>USER REVIEWS</h1>
                </div>
                <hr class="light">
            </div>
        </div>
        <!-- movie user review body -->
        <div class="container-fluid padding">
            <div class="row padding">
                <c:forEach items="${requestScope.userReviews}" var="item">
                    <div class="border col-3 mx-3 my-3">
                        <div class="row padding">
                            <div class="col-2">
                                <img width="50px" height="50px" src="images/profile.png"/>
                            </div>
                            <div class="col-10">
                                <div class="row">
                                    <div class="col-8">
                                        <a href="#" class="all-link"><h6>${item[2].userName}</h6></a>
                                    </div>
                                    <div class="col-4 text-right">
                                        <form action="ReportUserServlet" method="POST">
                                            <input name="userId" value="${item[2].userId}" style="display:none;"/>
                                            <input name="username" value="${item[2].name}" style="display:none;"/>
                                            <input name="email" value="${item[2].userName}" style="display:none;"/>
                                            <input name="movieID" value="${requestScope.movie.movieID}" style="display:none;"/>
                                            <input type="submit" value="Report" class="btn btn-sm btn-outline-danger"></button>
                                        </form>
                                    </div>
                                </div>
                                <p><r-star-rating value="${item[0].rating}"></r-star-rating></p>
                            </div>
                        </div>
                        <p>${item[1].review}</p>
                    </div>
                </c:forEach>
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
        <script src="js/starRating.js"></script>
    </body>
</html>
