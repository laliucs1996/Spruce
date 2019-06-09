<%-- 
    Document   : term
    Created on : May 6, 2018, 6:14:19 PM
    Author     : Austin
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
            <!-- The Title -->
            <div class="container-fluid padding">
                <div class="row welcome text-center">
                    <div class="col-12">
                        <h1>Spruce</h1>
                    </div>
                    <hr class="light">
                </div>
            </div>
            <div class="container-fluid padding">
                <div class="row welcome text-left">
                    <div class="col-8 mx-auto">
                        <h3>Terms and Conditions</h3>
                        <p>Last updated: (5/8/2018)</p>
                        <p>Please read these Terms and Conditions ("Terms", "Terms and Conditions") carefully before using the cse308spruce.com operated by CSE308 Spruce. </p>
                        <p>Your access to and use of the Service is conditioned on your acceptance of and compliance with these Terms. These Terms apply to all visitors, users and others who access or use the Service. </p>
                        <p style="font-weight: bold">By accessing or using the Service you agree to be bound by these Terms. If you disagree with any part of the terms then you may not access the Service. </p>
                        <hr class="light">
                        <p style="font-weight: bold">Content</p>
                        <p>Our Service allows you to post, link, store, share and otherwise make available certain information, text, graphics, videos, or other material. You are responsible for the posting of this content.
Our Service may contain links to third-party web sites or services that are not owned or controlled by My Company (change this). 
</p>
                        <p>CSE 308 Spruce has no control over, and assumes no responsibility for, the content, privacy policies, or practices of any third-party web sites or services. You further acknowledge and agree that My Company (change this) shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with use of or reliance on any such content, goods or services available on or through any such web sites or services. 
                        </p>
                        <p style="font-weight: bold">Changes</p>
                        <p>We reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material we will try to provide at least 30 (change this) days' notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion. </p>
                        <p style="font-weight: bold">Contact Us</p>
                        <p>If you have any questions about these Terms, please contact us.</p>
                       
                    </div>
                    <hr class="light">
                </div>
            </div>
            <!-- Footer -->
            <footer>
                <div class="container-fluid padding">
                    <div class="row text-center padding">
                        <div class="col-4 mx-auto">
                            <a href="contactus.jsp" class="all-link"><h4>Connect With Us: </h4>
                        </div>
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