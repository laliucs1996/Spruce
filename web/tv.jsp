<%-- 
    Document   : tv
    Created on : Apr 28, 2018, 8:34:05 PM
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
        <title>TV</title>
        <link href="css/style.css" rel="stylesheet">
        <link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" >
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
        <script>
            $(document).ready(function () {                
                if (${sessionScope.userid} != null) {
                    document.getElementById("user").setAttribute("style", "display: inline;");
                    document.getElementById("loginbtn").setAttribute("style", "display: none");
                    document.getElementById("registerbtn").setAttribute("style", "display: none");
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
                    $.post("AddTVReviewServlet", $("#reviewForm").serialize(), function(responseText) {  
                        alert(responseText);
                    });
                    var ratingVal = $("#rating").val();
                    $.post("AddTVRatingServlet", { userId: ${sessionScope.userid}, tvId: ${requestScope.tv.televisionID}, rating: ratingVal}, function(responseText) {
                        
                    });
                });
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function() {
                $("#removereviewbtn").click( function() { 
                    $.post("RemoveTVReviewServlet", $("#removeReviewForm").serialize(), function(responseText) { 
                        alert(responseText);
                        $("#comment").val("");
                    });
                    $.post("RemoveTVRatingServlet", { userId: ${sessionScope.userid}, tvId: ${requestScope.tv.televisionID}}, function(reponseText) {
                        $("#rating").val("0");
                    });
                });
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function() {
                $.get("GetTVReviewServlet", { tvId: ${requestScope.tv.televisionID}}, function(responseText) {
                    $("#comment").val(responseText);
                });
                $.get("GetTVRatingServlet", { userId: ${sessionScope.userid}, tvId: ${requestScope.tv.televisionID}}, function(responseText) {
                    $("#rating").val(responseText);
                });
                $.get("GetWTSLTVServlet", { tvId: ${requestScope.tv.televisionID}}, function(responseText) {
                   if(responseText == "1") {
                       document.getElementById("wantToSeeBtn").setAttribute("style", "display:none;");
                       document.getElementById("removeWantToSeeBtn").setAttribute("style", "display:inline;");
                   }
                });
                $.get("GetNotInterestedTVServlet", { tvId: ${requestScope.tv.televisionID}}, function(responseText) {
                   if(responseText == "1") {
                       document.getElementById("notInterestedBtn").setAttribute("style", "display:none;");
                       document.getElementById("removeNotInterestedBtn").setAttribute("style", "display:inline;");
                   }
                });
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function() {
                $("#wantToSeeBtn").click(function () {
                    $.post("AddWTSLTVServlet", { tvId: ${requestScope.tv.televisionID}}, function(responseText) {
                        document.getElementById("wantToSeeBtn").setAttribute("style", "display:none;");
                        document.getElementById("removeWantToSeeBtn").setAttribute("style", "display:inline;");
                        alert(responseText);
                    });
                });
                $("#removeWantToSeeBtn").click(function () {
                    $.post("RemoveWTSLTVServlet", { tvId: ${requestScope.tv.televisionID}}, function(responseText) {
                        document.getElementById("wantToSeeBtn").setAttribute("style", "display:inline;");
                        document.getElementById("removeWantToSeeBtn").setAttribute("style", "display:none;");
                        alert(responseText);
                    });
                });
                $("#notInterestedBtn").click(function() {
                   $.post("AddToNotInterestedTVServlet", { tvId: ${requestScope.tv.televisionID}}, function(responseText) {
                        document.getElementById("notInterestedBtn").setAttribute("style", "display:none;");
                        document.getElementById("removeNotInterestedBtn").setAttribute("style", "display:inline;");
                        alert(responseText);
                   });
               });
               $("#removeNotInterestedBtn").click(function() {
                   $.post("RemoveNotInterestedTVServlet", { tvId: ${requestScope.tv.televisionID}}, function(responseText) {
                        document.getElementById("notInterestedBtn").setAttribute("style", "display:inline;");
                        document.getElementById("removeNotInterestedBtn").setAttribute("style", "display:none;");
                        alert(responseText);
                   });
               });
            });
        </script>
    </head>
    <body>
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
        <!-- episodes info -->
        <div class="container-fluid padding">
            <div class="row padding">
                <!-- Image here -->
                <div class="col-sm-6 col-md-4 col-lg-4 text-center">
                    <p class="imgAbt">
                        <img width="80%" src="images/TV/${requestScope.tv.televisionID}/${requestScope.tv.poster}"/>
                    </p>
                    <button type="button" class="btn btn-sm btn-outline-success" onClick="document.getElementById('episodes').scrollIntoView();" >Episode List</button>
                </div>
                <!-- information here -->
                <div class="col-sm-12 col-md-8 col-lg-8">
                    <div class="row padding">
                        <div class="col-sm-12 col-md-12 col-lg-12">
                            <h4>${requestScope.tv.name}</h4>
                            <button id="deleteBtn" type="remove" class="btn btn-sm btn-outline-danger" data-toggle="modal" data-target="#Delete">Delete TV</button>
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
                                            <form class="navbar-form" style="display:inline;" action="DeleteTVServlet" method="POST">
                                                <p>Are you sure you want delete this TV?</p>
                                                <input name="tvId" value="${requestScope.tv.televisionID}" style="display:none;"/>
                                                <input class="btn btn-outline-danger" type="submit" value="Yes"/>
                                            </form>
                                            <button class="btn btn-outline-success" type="button" class="close" data-dismiss="modal">No</button>
                                        </div>
                                    <!-- footer -->
                                    </div>
                                </div>
                            </div>
                            <div class="row padding">
                                <div class="col-2">
                                    <a href="#" class="nav-link dropdown-toggle all-link" id="episodesDropdownMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Season
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="episodesDropdownMenu">
                                        <c:forEach items="${requestScope.seasons}" var="result">
                                            <form class="ml-3" action="DisplayTVServlet" method="GET"><input name="televisionID" value="<c:out value="${result.tvID}"></c:out>" style="color:white; display:none;" /><input name="seasonNo" value="${result.seasonNo}" style="display:none;"/><input type="submit" value="<c:out value="${result.name}"></c:out>" style="padding:0px 0px; background-color: Transparent; border:none;"></form>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="row padding">
                                    <dl class="row cele-info">
                                        <dt class="col-sm-5">Rating: 
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
                                                <c:out value="${requestScope.tv.overview}"></c:out>
                                                </p>
                                            </dd>
                                        </dl>
                                    </div>
                                </div> 
                            </div>
                        </div>
                    </div>
                    <hr class="my-4">
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
                <!-- add/edit review and rating detail -->
                <div class="container-fluid padding">
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
                            </div>
                            <form id="reviewForm" style="display:inline;">
                                <textarea name="review" class="form-control" rows="5" id="comment"></textarea>
                                <input name="tvID" value="${requestScope.tv.televisionID}" style="display:none;"/>
                                <input type="button" id="reviewbtn" class="btn btn-sm btn-outline-secondary mt-3" value="Submit"/>
                            </form>
                            <form id="removeReviewForm" style="display:inline;">
                                <input name="tvID" value="${requestScope.tv.televisionID}" style="display:none;"/>
                                <input type="button" id="removereviewbtn" class="btn btn-sm btn-outline-secondary mt-3" value="Remove"/>
                            </form>
                        </div>
                    </div>
                    <hr class="my-4">
                </div>
                <!-- tv detail title -->
                <div class="container-fluid padding">
                    <div class="row welcome text-center">
                        <div class="col-12">
                            <h1>TV INFO</h1>
                        </div>
                        <hr class="light">
                    </div>
                </div>
                <!-- tv detail info -->
                <div class="container-fluid padding">
                    <div class="row text-center">
                        <div class="col-12">
                            <dl class="row cele-info">
                                <dt class="col-6"><div class="float-right">Genre:</div></dt>
                                <dd class="col-6">
                                    <div class="float-left" id="genre">
                                    <c:if test="${fn:length(requestScope.genres) > 1}">
                                        <c:forEach items="${requestScope.genres}" var="genres" end="${fn:length(requestScope.genres) - 2}">
                                            <c:out value="${genres.name}"></c:out> ,
                                        </c:forEach>
                                    </c:if>
                                    <c:out value="${requestScope.genres[fn:length(requestScope.genres) - 1].name}"></c:out>
                                    </div>
                                </dd>
                                <dt class="col-6"><div class="float-right">Network:</div></dt>
                                <dd class="col-6">
                                    <div id="network" class="float-left">
                                    <c:if test="${fn:length(requestScope.networks) > 1}">
                                        <c:forEach items="${requestScope.networks}" var="network" end="${fn:length(requestScope.networks) - 2}">
                                            <c:out value="${network.name}"></c:out> ,
                                        </c:forEach>
                                    </c:if>
                                    <c:out value="${requestScope.networks[fn:length(requestScope.networks) - 1].name}"></c:out>
                                    </div>
                                </dd>
                                <dt class="col-6"><div class="float-right">Premiere Date:</div></dt>
                                <dd class="col-6"><div class="float-left"><c:out value="${requestScope.tv.firstAirDate}"></c:out></div></dd>
                                <dt class="col-6"><div class="float-right">Language:</div></dt>
                                <dd class="col-6"><div class="float-left"><c:out value="${requestScope.tv.language}"></c:out></div></dd>
                                <dt class="col-6"><div class="float-right">Status:</div></dt>
                                <dd class="col-6"><div class="float-left"><c:out value="${requestScope.tv.status}"></c:out></div></dd>
                                <dt class="col-6"><div class="float-right">Type:</div></dt>
                                <dd class="col-6"><div class="float-left"><c:out value="${requestScope.tv.type}"></c:out></div></dd>
                            </dl>
                        </div>
                        <hr class="light">
                    </div>
                </div>
                <!-- cast title -->
                <div class="container-fluid padding">
                    <div class="row welcome text-center">
                        <div class="col-12">
                            <h1>Cast</h1>
                        </div>
                        <hr class="light">
                    </div>
                </div>
                <!-- cast info -->
                <div class="container-fluid padding">
                    <div class="row text-center padding">
                        <c:forEach items="${requestScope.tvCast}" var="item">
                            <div class="col-2 border mx-3 my-3">
                                <a class="bmp-link" href="#">
                                    <p class="imgAbt" align="center">
                                        <img width="80%" src="images/People/${item.TVCastPK.peopleID}${item.profilePath}"/>
                                    </p>
                                    <h4 align="center"><form class="mt-3" action="DisplayPersonServlet" method="GET"><input name="peopleID" value="<c:out value="${item.TVCastPK.peopleID}"></c:out>" style="color:white; display:none;" /><h5><input type="submit" value="<c:out value="${item.name}"></c:out>" style="padding:0px 0px; background-color: Transparent; border:none;"></h5></form></h4>
                                </a>
                            </div>
                        </c:forEach>          
                    </div>
                    <hr class="my-4">
                </div>
                <!-- tv episode list -->
                <div class="container-fluid padding" id="episodes">
                    <div class="row welcome text-center">
                        <div class="col-12">
                            <h1>Episode</h1>
                        </div>
                        <hr class="light">
                    </div>
                </div>
                <!-- tv photos body -->
                <div class="container-fluid padding">
                <c:forEach items="${requestScope.episodes}" var="result">
                        <div class="row padding">
                            <span class="col-12">
                                ${result.TVEpisodePK.episodeNo}.
                                <form style="display:inline;" action="DisplayEpisodeServlet" method="GET">
                                    <input name="episodeNo" value="${result.TVEpisodePK.episodeNo}" style="display:none;"/>
                                    <input name="seasonID" value="${result.TVEpisodePK.seasonID}" style="display:none;"/>
                                    <input name="televisionID" value="${result.TVEpisodePK.televisionID}" style="display:none;"/>
                                    <input id="epGenre" name="genres" value="
                                        <c:if test="${fn:length(requestScope.genres) > 1}">
                                            <c:forEach items="${requestScope.genres}" var="genres" end="${fn:length(requestScope.genres) - 2}">
                                                <c:out value="${genres.name}"></c:out> ,
                                            </c:forEach>
                                        </c:if>
                                        <c:out value="${requestScope.genres[fn:length(requestScope.genres) - 1].name}"></c:out>
                                           " style="display:none;"/>
                                    <input id="epNetwork" name="networks" value="
                                        <c:if test="${fn:length(requestScope.networks) > 1}">
                                            <c:forEach items="${requestScope.networks}" var="network" end="${fn:length(requestScope.networks) - 2}">
                                                <c:out value="${network.name}"></c:out> ,
                                            </c:forEach>
                                        </c:if>
                                        <c:out value="${requestScope.networks[fn:length(requestScope.networks) - 1].name}"></c:out>
                                           " style="display:none;"/>
                                    <input type="submit" value="${result.name}" style="padding:0px 0px; background-color: Transparent; border:none;"/>
                                </form>
                            </span>
                            <div class="col-12">
                                ${result.overview}
                            </div>
                        </div>
                        <hr class="my-4">
                </c:forEach>
                </div>
                <!-- reviews title -->
                <div class="container-fluid padding">
                    <div class="row welcome text-center">
                        <div class="col-12">
                            <h1>User Reviews</h1>
                        </div>
                        <hr class="light">
                    </div>
                </div>
                <!-- review body -->
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
                                                    <input name="tvId" value="${requestScope.tv.televisionID}" style="display:none;"/>
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

