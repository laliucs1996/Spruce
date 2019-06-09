<%-- 
    Document   : otheruser
    Created on : Apr 23, 2018, 2:15:39 PM
    Author     : Austin
--%>

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
            function toggle(thechoice) {
                var text;
                if(thechoice=="profile"){
                    text="Profile Information"
                }
                else if(thechoice=="followers"){
                    text="Followers List";
                }
                else if(thechoice=="following"){
                    text="Following List";
                }
                else if(thechoice=="rating"){
                    text="Rating History";
                }
                else if(thechoice=="review"){
                    text="Review History";
                }
                document.getElementById("result-title").innerHTML = text;
                document.getElementById("profile").style.display = "none"; 
                document.getElementById("followers").style.display = "none"; 
                document.getElementById("following").style.display = "none";
                document.getElementById("rating").style.display = "none";
                document.getElementById("review").style.display = "none";
                document.getElementById(thechoice).style.display = "block";
            }
        </script>
    </head>
    <body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light sticky-top">
    <div class="container-fluid padding">
        <!-- Web LOGO -->
        <div class="col-sm-3 col-lg-2">
            <a class="navbar-brand" href="index.jsp"><img src="img/logo.png"></a>
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
                <ul class="list-group list-group-flush my-4">
                    <li class="list-group-item"><button type="submit-result" onclick="toggle('profile');">Profile Information</button></li>
                    <li class="list-group-item"><button type="submit-result" onclick="toggle('followers');">Followers List</button></li>
                    <li class="list-group-item"><button type="submit-result" onclick="toggle('following');">Following List</button></li>
                    <li class="list-group-item"><button type="submit-result" onclick="toggle('rating');">Rating History</button></li>
                    <li class="list-group-item"><button type="submit-result" onclick="toggle('review');">Review History</button></li>
                </ul>
            </div>
            <div class="col-sm-12 col-md-8 col-lg-9">
                <h3 id="result-title">Profile Information</h3>
                <!-- profile information div -->
                <div id="profile">
                    <button type="follow" class="btn btn-sm btn-outline-success">following or follow</button>
                    <div class="col-xs-12">
                        <h5>user name(TODO)</h5>
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
                                    </div>
                                </div>
                            </li>               
                        </ul>
                    </div>
                </div>
                <!-- followers list div -->
                <div id="followers" style="display: none">
                    <h4>People</h4>
                    <div class="row padding">
                        <div class="col-sm-6 col-md-4 col-lg-2 text-center">
                            <a class="bmp-link" href="#">
                                <p class="imgAbt" align="center">
                                    <img src="img/Deadpool_2_poster.jpg" width="100px" height="100px">
                                </p>
                                <p align="center">User Name</p>
                            </a>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-2 text-center">
                            <a class="bmp-link" href="#">
                                <p class="imgAbt" align="center">
                                    <img src="img/Deadpool_2_poster.jpg" width="100px" height="100px">
                                </p>
                                <p align="center">User Name</p>
                            </a>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-2 text-center">
                            <a class="bmp-link" href="#">
                                <p class="imgAbt" align="center">
                                    <img src="img/Deadpool_2_poster.jpg" width="100px" height="100px">
                                </p>
                                <p align="center">User Name</p>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- following list div -->
                <div id="following" style="display: none">
                    <h4>People</h4>
                    <div class="row padding">
                        <div class="col-sm-6 col-md-4 col-lg-2 text-center">
                            <a class="bmp-link" href="#">
                                <p class="imgAbt" align="center">
                                    <img src="img/Deadpool_2_poster.jpg" width="100px" height="100px">
                                </p>
                                <p align="center">User Name</p>
                            </a>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-2 text-center">
                            <a class="bmp-link" href="#">
                                <p class="imgAbt" align="center">
                                    <img src="img/Deadpool_2_poster.jpg" width="100px" height="100px">
                                </p>
                                <p align="center">User Name</p>
                            </a>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-2 text-center">
                            <a class="bmp-link" href="#">
                                <p class="imgAbt" align="center">
                                    <img src="img/Deadpool_2_poster.jpg" width="100px" height="100px">
                                </p>
                                <p align="center">User Name</p>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- rating history div -->
                <div id="rating" style="display: none"> 
                    <ul class="list-group">
                        <li class="list-group-item">
                            <div class="row">
                                <div class="col-sm-2">
                                    <a href="#">
                                        <img width="95%" src="img/Deadpool_2_poster.jpg"/>
                                    </a>
                                </div>
                                <div class="col-sm-8 search-result-list-item">
                                    <a href="#" class="all-link">
                                        <h3>movie title</h3>
                                    </a>
                                    <h5>release years</h5>
                                    <p>stars user give(view only)</p>
                                </div>
                            </div>
                        </li>               
                    </ul>
                </div>
                <!-- review history div -->
                <div id="review" style="display: none"> 
                    <ul class="list-group">
                            <li class="list-group-item">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <a href="#">
                                            <img width="95%" src="img/Deadpool_2_poster.jpg"/>
                                        </a>
                                    </div>
                                    <div class="col-sm-8 search-result-list-item">
                                        <a href="#" class="all-link">
                                            <h3>movie title</h3>
                                        </a>
                                    <h5>release years</h5>
                                    <div class="form-group">
                                        <label for="comment">Review:</label>
                                        <p rows="5" id="comment" placeholder="load user review text here">load review here</p>
                                    </div>
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
