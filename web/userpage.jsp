<%-- 
    Document   : userpage
    Created on : Apr 21, 2018, 11:14:51 PM
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
	<title>Userpage</title>
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
                $("#profile").click(function(){
                    $("#result-title").text("Account > Profile Information");
                    $('.targetDiv').hide();
                    $("#d-profile").show();
                });
                $("#settings").click(function(){
                    $("#result-title").text("Account > Account Settings");
                    $('.targetDiv').hide();
                    $("#d-settings").show();
                });
                $("#changepw").click(function(){
                    $("#result-title").text("Account > Change Password");
                    $('.targetDiv').hide();
                    $("#d-changepw").show();
                });
                $("#followers").click(function(){
                    $("#result-title").text("Account > Followers List");
                    $('.targetDiv').hide();
                    $("#d-followers").show();
                });
                $("#following").click(function(){
                    $("#result-title").text("Account > Following List");
                    $('.targetDiv').hide();
                    $("#d-following").show();
                });
                $("#rating").click(function(){
                    $("#result-title").text("Account > Rating History");
                    $('.targetDiv').hide();
                    $("#d-rating").show();
                });
                $("#review").click(function(){
                    $("#result-title").text("Account > Review History");
                    $('.targetDiv').hide();
                    $("#d-review").show();
                });
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
                                    <a class="nav-link" href="#">Home</a>
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
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarAboutDropdownMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        About
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarNewsDropdownMenu">
                                        <a class="dropdown-item" href="about.jsp">About</a>
                                        <a class="dropdown-item" href="term.jsp">Term</a>
                                        <a class="dropdown-item" href="help.jsp">Help</a>
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
                                        <form action="DisplayUserServlet" method="GET" class="dropdown-item">My Profile</form>
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
    <!-- profile image pop up -->
    <div class="modal fade" id="ProfileImg">
            <div class="modal-dialog">
                <div class="modal-content">
                <!-- header -->
                    <div class="modal-header">
                        <h3 class="modal-title">Log In</h3>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                <!-- body -->
                    <div class="modal-body">
                        <form class="navbar-form">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Username"/>
                                <input type="text" class="form-control" placeholder="Password" />
                            </div>
                        </form>
                    </div>
                <!-- footer -->
                    <div class="modal-footer">
                        <button class="btn btn-outline-success">Log In</button>
                    </div> 
                </div>
            </div>
        </div>
    <!-- Result Section -->
    <div class="container-fluid padding">
        <div class="row padding">
            <div class="col-sm-6 col-md-4 col-lg-3 text-center">
                <img class="img-fluid rounded mx-auto d-block" id='myImg' width="85%" src="img/Deadpool_2_poster.jpg"/>
                <button type="edit" class="btn btn-sm btn-outline-secondary">Change Profile Image</button>
                <ul class="list-group list-group-flush my-4">
                    <li class="list-group-item"><button type="submit-result" id="profile">Profile Information</button></li>
                    <li class="list-group-item"><button type="submit-result" id="settings">Account Settings</button></li>
                    <li class="list-group-item"><button type="submit-result" id="changepw">Change Password</button></li>
                    <li class="list-group-item"><button type="submit-result" id="followers">Followers List</button></li>
                    <li class="list-group-item"><button type="submit-result" id="following">Following List</button></li>
                    <li class="list-group-item"><button type="submit-result" id="rating">Rating History</button></li>
                    <li class="list-group-item"><button type="submit-result" id="review">Review History</button></li>
                    <li class="list-group-item"><button type="submit-result">Delete Account</button></li>
                </ul>
            </div>
            <div class="col-sm-12 col-md-8 col-lg-9">
                <h3 id="result-title">Account > Profile Information</h3>
                <!-- profile information div -->
                <div id="d-profile" class="targetDiv">
                    <div class="col-xs-12">
                        <h5>${sessionScope.username}</h5>
                        <p>profile stats:</p>
                        <ul class="list-group">
                            <li class="list-group-item"><h4>Wants to see list</h4></li>
                            <li class="list-group-item">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <a href="#">
                                            <img width="95%" src="img/Deadpool_2_poster.jpg"/>
                                        </a>
                                    </div>
                                    <div class="col-sm-8 search-result-list-item">
                                        <a href="#">
                                            <h3>movie title</h3>
                                        </a>
                                        <h5>release years</h5>
                                        <p>movie about</p>
                                        <button type="remove" class="btn btn-sm btn-outline-danger">remove</button>
                                    </div>
                                </div>
                            </li>               
                        </ul>
                        <ul class="list-group">
                            <li class="list-group-item"><h4>Not interested list</h4></li>
                            <li class="list-group-item">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <a href="#">
                                            <img width="95%" src="img/Deadpool_2_poster.jpg"/>
                                        </a>
                                    </div>
                                    <div class="col-sm-8 search-result-list-item">
                                        <a href="#">
                                            <h3>movie title</h3>
                                        </a>
                                        <h5>release years</h5>
                                        <p>movie about</p>
                                        <button type="remove" class="btn btn-sm btn-outline-warning">remove</button>
                                    </div>
                                </div>
                            </li>               
                        </ul>
                    </div>
                </div>
                <!-- account setting div -->
                <div id="d-settings" class="targetDiv" style="display: none">
                    <h5>Hi, you can edit your account setting with enter correct password here. if you leave text blank then will keep your original setting.</h5>
                    <form>
                        <div class="form-group">
                            <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter user ID(TODO, get from db)">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email(TODO, get from db)">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Password">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Confirm Password">
                        </div>
                        <button type="submit" class="btn btn-outline-success">Submit</button>
                    </form>
                </div>
                <!-- change password div -->
                <div id="d-changepw" class="targetDiv" style="display: none">
                    <form>
                        
                        <div class="form-group">
                            <input type="text" class="form-control"  placeholder="Old Password">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="New Password">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Confirm Password">
                        </div>
                        <button type="submit" class="btn btn-outline-success">Submit</button>
                    </form>
                </div>
                <!-- followers list div -->
                <div id="d-followers" class="targetDiv" style="display: none">
                    <h4>People</h4>
                    <div class="row padding">
                        <div class="col-sm-6 col-md-4 col-lg-2 text-center">
                            <a class="bmp-link" href="#">
                                <p class="imgAbt" align="center">
                                    <img src="img/Deadpool_2_poster.jpg" width="100px" height="100px">
                                </p>
                                <p align="center">User Name</p>
                            </a>
                            <button type="follow" class="btn btn-sm btn-outline-success">following or follow</button>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-2 text-center">
                            <a class="bmp-link" href="#">
                                <p class="imgAbt" align="center">
                                    <img src="img/Deadpool_2_poster.jpg" width="100px" height="100px">
                                </p>
                                <p align="center">User Name</p>
                            </a>
                            <button type="follow" class="btn btn-sm btn-outline-success">following or follow</button>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-2 text-center">
                            <a class="bmp-link" href="#">
                                <p class="imgAbt" align="center">
                                    <img src="img/Deadpool_2_poster.jpg" width="100px" height="100px">
                                </p>
                                <p align="center">User Name</p>
                            </a>
                            <button type="follow" class="btn btn-sm btn-outline-success">following or follow</button>
                        </div>
                    </div>
                </div>
                <!-- following list div -->
                <div id="d-following" class="targetDiv" style="display: none">
                    <h4>People</h4>
                    <div class="row padding">
                        <div class="col-sm-6 col-md-4 col-lg-2 text-center">
                            <a class="bmp-link" href="#">
                                <p class="imgAbt" align="center">
                                    <img src="img/Deadpool_2_poster.jpg" width="100px" height="100px">
                                </p>
                                <p align="center">User Name</p>
                            </a>
                            <button type="follow" class="btn btn-sm btn-outline-success" align="center">following</button>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-2 text-center">
                            <a class="bmp-link" href="#">
                                <p class="imgAbt" align="center">
                                    <img src="img/Deadpool_2_poster.jpg" width="100px" height="100px">
                                </p>
                                <p align="center">User Name</p>
                            </a>
                            <button type="follow" class="btn btn-sm btn-outline-success">following</button>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-2 text-center">
                            <a class="bmp-link" href="#">
                                <p class="imgAbt" align="center">
                                    <img src="img/Deadpool_2_poster.jpg" width="100px" height="100px">
                                </p>
                                <p align="center">User Name</p>
                            </a>
                            <button type="follow" class="btn btn-sm btn-outline-success">following</button>
                        </div>
                    </div>
                </div>
                <!-- rating history div -->
                <div id="d-rating" class="targetDiv" style="display: none"> 
                    <ul class="list-group">
                            <li class="list-group-item">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <a href="#">
                                            <img width="95%" src="img/Deadpool_2_poster.jpg"/>
                                        </a>
                                    </div>
                                    <div class="col-sm-8 search-result-list-item">
                                    <a href="#">
                                        <h3>movie title</h3>
                                    </a>
                                    <h5>release years</h5>
                                    <p>stars user give</p>
                                    <button type="edit" class="btn btn-sm btn-outline-secondary">edit</button>
                                </div>
                            </div>
                        </li>               
                    </ul>
                </div>
                <!-- review history div -->
                <div id="d-review" class="targetDiv" style="display: none"> 
                    <ul class="list-group">
                            <li class="list-group-item">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <a href="#">
                                            <img width="95%" src="img/Deadpool_2_poster.jpg"/>
                                        </a>
                                    </div>
                                    <div class="col-sm-8 search-result-list-item">
                                    <a href="#">
                                        <h3>movie title</h3>
                                    </a>
                                    <h5>release years</h5>
                                    <div class="form-group">
                                        <label for="comment">Review:</label>
                                        <textarea class="form-control" rows="5" id="comment" placeholder="load user review text here"></textarea>
                                    </div>
                                    <button type="edit" class="btn btn-sm btn-outline-secondary">edit</button>
                                    <button type="remove" class="btn btn-sm btn-outline-secondary">remove</button>
                                </div>
                            </div>
                        </li>               
                    </ul>
                </div>
            </div>
        </div>
        <hr class="my-4">
    </div>
    <!-- Footer -->
    <footer>
        <div class="container-fluid padding">
            <div class="row text-center padding">
                <a href="#" class="col-12 padding"><h4>Connect Us: </h4></a>
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
    </fmt:bundle>
</body>
</html>
