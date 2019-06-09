<%-- 
    Document   : userpage
    Created on : Apr 21, 2018, 11:14:51 PM
    Author     : austi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
            function previewFile() {
                var preview = document.querySelector('#profimg');
                var file = document.querySelector('input[type=file]').files[0];
                var reader = new FileReader();

                reader.addEventListener("load", function () {
                    preview.src = reader.result;
                }, false);

                if (file) {
                    reader.readAsDataURL(file);
                }
            }
        </script>
        <script>
            $(document).ready(function () {
                if (${sessionScope.userid == null}) {
                    window.location.replace("index.jsp");
                }
                if (${sessionScope.userType == "regular"})
                {
                    $("#stuff").hide();
                }
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
        <script>
            $(document).ready(function () {
                $("#profile").click(function () {
                    $("#result-title").text("Account > Profile Information");
                    $('.targetDiv').hide();
                    $("#d-profile").show();
                });
                $("#settings").click(function () {
                    $("#result-title").text("Account > Account Settings");
                    $('.targetDiv').hide();
                    $("#d-settings").show();
                });
                $("#changepw").click(function () {
                    $("#result-title").text("Account > Change Password");
                    $('.targetDiv').hide();
                    $("#d-changepw").show();
                });
                $("#followers").click(function () {
                    $("#result-title").text("Account > Followers List");
                    $('.targetDiv').hide();
                    $("#d-followers").show();
                });
                $("#following").click(function () {
                    $("#result-title").text("Account > Following List");
                    $('.targetDiv').hide();
                    $("#d-following").show();
                });
                $("#review").click(function () {
                    $("#result-title").text("Account > Review History");
                    $('.targetDiv').hide();
                    $("#d-review").show();
                });
                $("#reporteduser").click(function () {
                    $("#result-title").text("Account > Reported Users List");
                    $('.targetDiv').hide();
                    $("#d-reporteduser").show();
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
                <!-- Profile img select page -->
                <div class="modal fade" id="ProfileImg">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <!-- header -->
                            <div class="modal-header">
                                <h3 class="modal-title">Profile Image</h3>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <!-- body -->
                            <div class="modal-body">
                                <form class="navbar-form" action="LoginServlet" method="POST">
                                    <div class="form-group">
                                        <input type="file" onchange="previewFile()" accept="image/*"><br>
                                        <img class="my-2" id="profimg" src="" height="200" alt="Image preview...">
                                    </div>
                                    <input class="btn btn-outline-success" type="submit" value="Submit"/>
                                </form>
                            </div>
                            <!-- footer -->
                        </div>
                    </div>
                </div>
                <!-- Result Section -->
                <div class="container-fluid padding">
                    <div class="row padding">
                        <div class="col-sm-6 col-md-4 col-lg-3 text-center">
                            <img class="img-fluid rounded mx-auto d-block" id='myImg' width="85%" src="images/profile.png"/>
                            <ul class="list-group list-group-flush my-4">
                                <li class="list-group-item"><button type="submit-result" id="profile">Profile Information</button></li>
                                <li class="list-group-item"><button type="submit-result" id="settings">Account Settings</button></li>
                                <li class="list-group-item"><button type="submit-result" id="changepw">Change Password</button></li>
                                <li class="list-group-item"><button type="submit-result" id="review">Review History</button></li>
                                <!-- hide this button if not admin -->
                                <li id = "stuff" class="list-group-item"><button  type="submit-result" id="reporteduser">Reported Users</button></li>
                                <li class="list-group-item"><button type="submit-result" data-toggle="modal" data-target="#Delete">Delete Account</button></li>
                            </ul>
                        </div>
                        <div class="col-sm-12 col-md-8 col-lg-9">
                            <h3 id="result-title">Account > Personal List</h3>
                            <!-- profile information div -->
                            <div id="d-profile" class="targetDiv">
                                <div class="col-xs-12">
                                <ul class="list-group">
                                    <li class="list-group-item"><h4>Want to See List</h4></li>
                                    <li class="list-group-item">
                                        <div class="row padding">
                                            <c:forEach items="${requestScope.wmf}" var="item">
                                                <div class="col-3 text-center mx-auto">
                                                    <img width="95%" src="images/Movie/${item.wantToSeeMovieListPK.movieID}${item.posterURL}"/>
                                                    <form class="mt-3" action="DisplayMovieServlet" method="GET"><input name="movie" value="<c:out value="${item.wantToSeeMovieListPK.movieID}"></c:out>" style="color:white; display:none;" /><input type="submit" value="<c:out value="${item.title}"></c:out>" style="padding:0px 0px; background-color: Transparent; border:none;"></form>
                                                </div>
                                            </c:forEach>
                                            <c:forEach items="${requestScope.wtf}" var="item">
                                                <div class="col-3 text-center mx-auto">
                                                    <img width="95%" src="images/TV/${item.wantToSeeTVListPK.tvID}${item.posterPath}"/>
                                                    <form class="mt-3" action="DisplayTVServlet" method="GET"><input name="televisionID" value="<c:out value="${item.wantToSeeTVListPK.tvID}"></c:out>" style="color:white; display:none;" /><input type="submit" value="<c:out value="${item.name}"></c:out>" style="padding:0px 0px; background-color: Transparent; border:none;"></form>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </li>
                                </ul>
                                <ul class="list-group mt-3">
                                    <li class="list-group-item"><h4>Not Interested List</h4></li>
                                    <li class="list-group-item">
                                        <div class="row padding">
                                            <c:forEach items="${requestScope.nil}" var="item">
                                                <div class="col-3 text-center mx-auto">
                                                    <img width="95%" src="images/Movie/${item.notInterestedMovieListPK.movieID}${item.posterPath}"/>
                                                    <form class="mt-3" action="DisplayMovieServlet" method="GET"><input name="movie" value="<c:out value="${item.notInterestedMovieListPK.movieID}"></c:out>" style="color:white; display:none;" /><input type="submit" value="<c:out value="${item.name}"></c:out>" style="padding:0px 0px; background-color: Transparent; border:none;"></form>
                                                </div>
                                            </c:forEach>
                                            <c:forEach items="${requestScope.ntvl}" var="item">
                                                <div class="col-3 text-center mx-auto">
                                                    <img width="95%" src="images/TV/${item.notInterestedTVListPK.tvID}${item.posterPath}"/>
                                                    <form class="mt-3" action="DisplayTVServlet" method="GET"><input name="televisionID" value="<c:out value="${item.notInterestedTVListPK.tvID}"></c:out>" style="color:white; display:none;" /><input type="submit" value="<c:out value="${item.name}"></c:out>" style="padding:0px 0px; background-color: Transparent; border:none;"></form>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </li>            
                                </ul>
                            </div>
                        </div>
                        <!-- account setting div -->
                        <div id="d-settings" class="targetDiv" style="display: none">
                            <h5>Hi, you can edit your account settings here. If you leave a field blank then that setting will not change.</h5>
                            <form action="changeEmailUserServlet" method ="POST">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="yes" name="privacy" id="defaultCheck1" checked>
                                    <label class="form-check-label" for="defaultCheck1">
                                        Allow others to see my page
                                    </label>
                                </div>
                                <div class="form-group">
                                    <input name = "name" type="text" class="form-control" id="exampleInputEmail1" value="${sessionScope.username}">
                                </div>
                                <div class="form-group">
                                    <input name  = "email" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="${sessionScope.email}">
                                </div>
                                <div class="form-group">
                                    <input name = "pw" type="text" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="form-group">
                                    <input name="cpw" type="text" class="form-control" id="exampleInputPassword1" placeholder="Confirm Password">
                                </div>
                                <button type="submit" class="btn btn-outline-success">Submit</button>
                            </form>
                        </div>
                        <!-- change password div -->
                        <div id="d-changepw" class="targetDiv" style="display: none">
                            <form action = "changePassword" method = "GET">

                                <div class="form-group">
                                    <input name = "p1" type="text" class="form-control"  placeholder="Old Password">
                                </div>
                                <div class="form-group">
                                    <input name = "p2" type="text" class="form-control" placeholder="New Password">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Confirm Password">
                                </div>
                                <button type="submit" class="btn btn-outline-success">Submit</button>
                            </form>
                        </div>
                        <!-- review history div -->
                        <div id="d-review" class="targetDiv" style="display: none"> 
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <c:forEach items="${requestScope.ur}" var="item">
                                        <div class="row">
                                            <div class="col-sm-2">
                                                <a href="#">
                                                    <img width="95%" src="images/Movie/${item[0].movieID}${item[0].poster}"/>
                                                </a>
                                            </div>
                                            <div class="col-sm-8 search-result-list-item">
                                                <a href="#">
                                                    <form class="mt-3" action="DisplayMovieServlet" method="GET"><input name="movie" value="<c:out value="${item[0].movieID}"></c:out>" style="color:white; display:none;" /><h5><input type="submit" value="<c:out value="${item[0].title}"></c:out>" style="padding:0px 0px; background-color: Transparent; border:none;"></h5></form>
                                                </a>
                                                <x-star-rating value="${item[2].rating}"></x-star-rating>
                                                <div class="form-group">          
                                                    <label for="comment">Review:</label>
                                                    <p>${item[1].review}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <c:forEach items="${requestScope.tr}" var="item">
                                        <div class="row">
                                            <div class="col-sm-2">
                                                <a href="#">
                                                    <img width="95%" src="images/TV/${item[0].televisionID}${item[0].poster}"/>
                                                </a>
                                            </div>
                                            <div class="col-sm-8 search-result-list-item">
                                                <a href="#">
                                                    <form class="mt-3" action="DisplayTVServlet" method="GET"><input name="televisionID" value="<c:out value="${item[0].televisionID}"></c:out>" style="color:white; display:none;" /><h5><input type="submit" value="<c:out value="${item[0].name}"></c:out>" style="padding:0px 0px; background-color: Transparent; border:none;"></h5></form>
                                                </a>
                                                <x-star-rating value="${item[2].rating}"></x-star-rating>
                                                <div class="form-group">          
                                                    <label for="comment">Review:</label>
                                                    <p>${item[1].review}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </li>               
                            </ul>
                        </div>
                        <!-- reported users -->
                        <div id="d-reporteduser" class="targetDiv" style="display: none">
                            <h4>Users</h4>
                            <div class="row padding">
                                <c:forEach items="${requestScope.ru}" var="item">
                                    <div class="col-sm-6 col-md-4 col-lg-2 text-center">
                                        <a class="bmp-link" href="#">
                                            <p class="imgAbt" align="center">
                                                <img src="images/profile.png" width="100px" height="100px">
                                            </p>
                                            <p align="center">${item.email}</p>
                                        </a>
                                        <form action="AdminDeleteUserServlet" method="POST">
                                            <input name="userId" value="${item.email}" style="display:none;"/>
                                            <input name="userId2" value="${item.userid}" style="display:none;"/>
                                            <input value="Delete User" type="submit" class="btn btn-sm btn-outline-danger" align="center"/>
                                        </form>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
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
                                        <form class="navbar-form"action="DeleteUserServlet" method="GET">
                                            <p>Are you sure you want to delete your account??</p>
                                            <input class="btn btn-outline-danger" type="submit" value="Yes."/>
                                        </form>
                                    </div>
                                    <!-- footer -->
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
                        <a href="#" class="col-12 padding all-link"><h4>Connect With Us: </h4></a>
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
        <c:if test="${requestScope.successP == true}">
            alert("Password Changed!");
        </c:if>
        });
    </script>
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
        <c:if test="${requestScope.successs == true}">
            alert("Settings Updated");
        </c:if>
        });
    </script>
    <script src="js/starRating.js"></script>
</html>
