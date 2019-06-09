<%-- 
    Document   : tvpage
    Created on : Apr 21, 2018, 4:34:19 PM
    Author     : Stanl
--%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8"> 
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="RottenTomatoesCSS.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Bitter:400,700">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
    <link rel="stylesheet" href="assets/css/Footer-Basic.css">
    <link rel="stylesheet" href="assets/css/Header-Blue.css">
    <link rel="stylesheet" href="assets/css/Header-Dark.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/css/swiper.min.css">
    <link rel="stylesheet" href="assets/css/Navigation-with-Button.css">
    <link rel="stylesheet" href="assets/css/Navigation-with-Search.css">
    <link rel="stylesheet" href="assets/css/Simple-Slider.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  </head>
  <body>
  <!-- Navigation Bar -->
	<nav class="navbar navbar-light navbar-expand-md navigation-clean-search">
		<div class="container" id="header"><a class="navbar-brand" href="#">LOGO</a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
			<div class="collapse navbar-collapse"
				id="navcol-1">
				<form class="form-inline mx-auto" target="_self">
					<div class="form-group"><label for="search-field"><i class="fa fa-search"></i></label><input class="form-control search-field" type="search" name="search" id="search-field" style="border-style:soild"></div>
				</form><a class="btn btn-light action-button" role="button" href="#">Search</a>
				<ul class="nav navbar-nav ml-auto">
					<li class="nav-item" role="presentation"><a class="nav-link" href="#">MOVIES &amp; DVDS</a></li>
					<li class="nav-item" role="presentation"><a class="nav-link" href="#">TV</a></li>
					<li class="nav-item" role="presentation"><a class="nav-link" href="#">NEWS</a></li>
					<li class="nav-item" role="presentation"><a class="nav-link" href="#">SHOWTIMES</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<!-- Trending(Under navbar) -->
	<div class="container mt-2">
        <div id="headerDiv">
            <ul id="headUl">
                <li class="headLi" style="float:left"><a href="#" id="hottest"><strong>HOTTEST</strong></a></li>
                <li id="movie" class="headLi" style="float:left"><a href="#" style="color:white">Movie 1</a></li>
                <li class="headLi" style="float:left"><a href="#" style="color:white">Movie 2</a></li>
                <li class="headLi" style="float:left"><a href="#" style="color:white">Movie 3</a></li>
                <li id="signin" class="headLi" style="float:right"><a href="#"><strong>LOGIN</strong></a></li>
                <li id="signup" class="headLi" style="float:right"><a href="#"><strong>SIGN UP</strong></a></li>
            </ul>
        </div>
	</div>
	
	<div class="container mt-3" style="margin:0 auto;">
		<div class="row">
			<div class="col-12">
				<h3>BLACK LIGHTNING: SEASON 1</h3>
			</div>
		</div>
			
		<!-- Rating Card -->	
		<div class="row">
			<div class="col-2">
				<img src="images/cover.png" class="mt-3" alt="Responsive image">
			</div>
			<div class="col-6">
				<div class="row">
					<div class="card mt-3 ml-5 w-100" id="rating-card">
						<div class="card-body">
							<div class="row justify-content-md-center">
								<div class="column">
									<div class="">TOMATOMETER</div>
									<h2 class="text-center">97%</h2>
									<h6 id="rating">
										Average Rating: 8.2/10<br>
										Reviews Counted: 337<br>
										Fresh: 326<br>
										Rotten: 11<br>
									</h6>
								</div>
								<div class="column ml-4 mr-2">
									<div>AUDIENCE SCORE</div>
									<h2 class="text-center">79%</h2>
									<h6 id="rating">
										Average Rating: 4.1/5<br>
										User Ratings: 64,000
									</h6>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="card mt-3 ml-5 w-100" id="write-review-card">
						<div class="row ml-3">
							<h6>ADD YOUR RATING</h6>
						</div>
						<img src="images/profile.png" class="mt-1 ml-3" alt="Responsive image">
						<button type="button" class="btn btn-dark ml-2">WANT TO SEE</button>
						<button type="button" class="btn btn-dark">NOT INTERESTED</button>
						<form class="form-inline my-2 my-md-0">
							<input class="form-control mt-2 ml-3 mb-2" id="review-box" type="text" placeholder="Add a Review">
						</form>
					</div>
				</div>
			</div>
			
			<!-- Right Card -->
			<div class="col-3">
				<div class="card text-center" style="width: 19rem">
				  <div class="card-header">
					<ul class="nav nav-tabs card-header-tabs">
					  <li class="nav-item small">
						<a class="nav-link" href="#">IN <br>THEATERS</a>
					  </li>
					  <li class="nav-item small">
						<a class="nav-link" href="#">DVD & <br>STREAMING</a>
					  </li>
					  <li class="nav-item small">
						<a class="nav-link active" href="#">TV <br>SHOWS</a>
					  </li>
					</ul>
				  </div>
				  <div class="card-block mt-2">
					<h6 class="card-title text-left ml-4">Opening</h6>
					<ul>
						<li class="text-left">99% Black Lightning</li>
						<li class="text-left">99% Black Lightning</li>
						<li class="text-left">99% Black Lightning</li>
						<li class="text-left">99% Black Lightning</li>
						<li class="text-left">99% Black Lightning</li>
						<li class="text-left">99% Black Lightning</li>
						<li class="text-left">99% Black Lightning</li>
						<li class="text-left">99% Black Lightning</li>
						<li class="text-left">99% Black Lightning</li>
						<li class="text-left">99% Black Lightning</li>
						<li class="text-left">99% Black Lightning</li>
					</ul>
				  </div>
				</div>
			</div>
		</div>
		
		<!-- Videos -->
		<div class="row">
			<div class="col-12">
			<div class="card mt-5 w-100" id="video-card">
				<div class="row ml-2">
					<h3 class="bg-dark text-warning">BLACK LIGHTNING: SEASON 1 VIDEOS</h3>
				</div>
				<div class="row ml-2 mr-3">
				   <div id="myCarousel" class="carousel slide">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<div class="row">
									<div class="col-sm-3">
										<img src="images/video.png" class="mt-1 ml-3" alt="Responsive image">
									</div>
									<div class="col-sm-3">
										<img src="images/video.png" class="mt-1 ml-3" alt="Responsive image">
									</div>
									<div class="col-sm-3">
										<img src="images/video.png" class="mt-1 ml-3" alt="Responsive image">
									</div>
									<div class="col-sm-3">
										<img src="images/video.png" class="mt-1 ml-3" alt="Responsive image">
									</div>
								</div>
							</div>
							<div class="carousel-item">
								<div class="row">
									<div class="col-sm-3">
										<img src="images/video.png" class="mt-1 ml-3" alt="Responsive image">
									</div>
									<div class="col-sm-3">
										<img src="images/video.png" class="mt-1 ml-3" alt="Responsive image">
									</div>
									<div class="col-sm-3">
										<img src="images/video.png" class="mt-1 ml-3" alt="Responsive image">
									</div>
									<div class="col-sm-3">
										<img src="images/video.png" class="mt-1 ml-3" alt="Responsive image">
									</div>
								</div>
							</div>
						 </div>
						 <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						 </a>
						 <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						 </a>
					</div>
				</div>
			</div>
			</div>
		</div>
		
		<!-- Movie Info -->
		<div class="row">
			<div class="col-12">
				<div class="card mt-5 w-100" id="movie-info-card">
					<div class="row ml-2">
						<h3 class="bg-dark text-warning">TV SEASON INFO</h3>
					</div>
					<div class="row ml-2 mr-2">
						<div>
                                                    <c:out value="${requestScope.tv.overview}"></c:out>
						</div>
						<h6 class="mt-3">
							Genre:	Drama<br>
							Network:	CW<br>
							Premiere Date:	Jan 16, 2018<br>
							Creator:	Greg Berlanti<br>
							Exec. Producers:	Mara Brock Akil, Salim Akil, Greg Berlanti, Sarah Schechter
						</h6>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Episodes -->
		<div class="row">
			<div class="col-12">
				<div class="card mt-5 w-100" id="movie-info-card">
					<div class="row ml-2">
						<h3 class="bg-dark text-warning">EPISODES</h3>
					</div>
					<div class="row ml-2 mr-2 mt-2">
						<h6>1 The Resurrection</h6>
						<div class="ml-4">A retired superhero is drawn back into his old lifestyle when his daughter seeks to serve justice to evil...</div>
					</div>
					<div class="row ml-2 mr-2 mt-2">
						<h6>2 The Resurrection</h6>
						<div class="ml-4">A retired superhero is drawn back into his old lifestyle when his daughter seeks to serve justice to evil...</div>
					</div>
					<div class="row ml-2 mr-2 mt-2">
						<h6>3 The Resurrection</h6>
						<div class="ml-4">A retired superhero is drawn back into his old lifestyle when his daughter seeks to serve justice to evil...</div>
					</div>
					<div class="row ml-2 mr-2 mt-2">
						<h6>4 The Resurrection</h6>
						<div class="ml-4">A retired superhero is drawn back into his old lifestyle when his daughter seeks to serve justice to evil...</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	
	<!-- Footer -->
	<div class="footer-basic text-center mt-5">
        <footer>
            <div class="social"><a href="#"><i class="icon ion-social-instagram"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-facebook"></i></a></div>
            <ul class="list-inline">
                <li class="list-inline-item"><a href="#">Home</a></li>
                <li class="list-inline-item"><a href="#">Services</a></li>
                <li class="list-inline-item"><a href="#">About</a></li>
                <li class="list-inline-item"><a href="#">Terms</a></li>
                <li class="list-inline-item"><a href="#">Privacy Policy</a></li>
            </ul>
            <p class="copyright">Company Name © 2017</p>
        </footer>
    </div>
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>
