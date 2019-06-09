<%-- 
    Document   : celebrity
    Created on : Apr 22, 2018, 12:25:56 AM
    Author     : austi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang = "en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Celebrity</title>
        <link href="css/style.css" rel="stylesheet">
        <link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" >
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
    </head>
    <body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light sticky-top">
    <div class="container-fluid padding">
        <!-- Web LOGO -->
        <div class="col-sm-3 col-lg-2">
            <a class="navbar-brand" href="index.jsp"><img style="width:50%; height:50%" src="images/logo.png"></a>
        </div>
        <div class="col-sm-9 col-lg-4">
        <form class="navbar-form navbar-left form-inline mx-2 w-50">
            <div class="input-group position-static" id="search-bar">
                <input type="search" placeholder="search..">
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
                    <a class="nav-link dropdown-toggle" id="navbarMovieDropdownMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Movies
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarMovieDropdownMenu">
                        <a class="dropdown-item" href="userpage.jsp">Coming soon</a>
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
                    <button type='button' class="btn btn-outline-success" data-toggle="modal" data-target="#Signup">Sign up</button>
                </li>
                <li class="nav-item">
                    <button type='button' class="btn btn-outline-success" data-toggle="modal" data-target="#Login">Log in</button>
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
                        <form role="form">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Username"/>
                                <input type="text" class="form-control" placeholder="Password" />
                                <input type="text" class="form-control" placeholder="Confirm Password" />
                            </div>
                        </form>
                    </div>
                <!-- footer -->
                    <div class="modal-footer">
                        <button class="btn btn-outline-success">Submit</button>
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
                    <img width="95%" src="images/People/<c:out value="${requestScope.person.peopleID}"></c:out><c:out value="${requestScope.person.profilePath}"></c:out>"/>
                </p>
            </div>
            <!-- information here -->
            <div class="col-sm-12 col-md-8 col-lg-8">
                <div class="row padding">
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <h4><c:out value="${requestScope.person.name}"></c:out></h4>
                        <dl class="row cele-info">
                            <dt class="col-sm-3">Birthday: </dt>
                            <dd class="col-sm-9"><c:out value="${requestScope.person.birthday}"></c:out></dd>

                            <dt class="col-sm-3">Birthplace: </dt>
                            <dd class="col-sm-9"><c:out value="${requestScope.person.placeOfBirth}"></c:out></dd>
                            
                        <dt class="col-sm-3">Description: </dt>
                            <dd class="col-sm-12">
                                <p>
                                    <c:out value="${requestScope.person.biography}"></c:out>
                                </p>
                            </dd>
                        </dl>
                    </div> 
                </div>
            </div>
        </div>
        <hr class="my-4">
    </div>
    <!-- Filmography -->
    <div class="container-fluid padding">
        <div class="row welcome text-center">
            <div class="col-12">
                <h1>Filmography</h1>
            </div>
            <hr class="light">
        </div>
    </div>
    <!-- movies table -->
    <div class="container-fluid padding">
        <p>Movies</p>            
            <table class="table">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Credit</th>
                    <th>Box office</th>
                    <th>Year</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.mcrew}" var="item">
                    <tr>
                        <td><a href="#" class="cele-info-table-link">${item[2].title}</a></td>
                        <td>${item[1].department}</td>
                        <td>$${item[2].revenue}</td>
                        <td>${item[2].releaseDate}</td>
                    </tr>
                </c:forEach>
                <c:forEach items="${requestScope.mcast}" var="item">
                    <tr>
                        <td><a href="#" class="cele-info-table-link">${item[2].title}</a></td>
                        <td>${item[1].movieCastPK.cname}</td>
                        <td>$${item[2].revenue}</td>
                        <td>${item[2].releaseDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
            </table>
        <p>TVs</p>            
            <table class="table">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Credit</th>
                    <th>Year</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.tcrew}" var="item">
                    <tr>
                        <td><a href="#" class="cele-info-table-link">${item[2].name}</a></td>
                        <td>${item[1].TVCrewPK.job}</td>
                        <td>${item[2].firstAirDate}</td>
                    </tr>
                </c:forEach>
                <c:forEach items="${requestScope.tcast}" var="item">
                    <tr>
                        <td><a href="#" class="cele-info-table-link">${item[2].name}</a></td>
                        <td>${item[1].TVCastPK.character}</td>
                        <td>${item[2].firstAirDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
            </table>
        <hr class="my-4">
    </div>
    <!-- Footer -->
    <footer>
        <div class="container-fluid padding">
            <div class="row text-center padding">
                <a href="#" class="col-12 padding"><h4>Connect With Us: </h4></a>
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
</body>
</html>
