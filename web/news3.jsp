<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>News</title>
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
            <!-- News Title -->
            <div class="container-fluid padding">
                <div class="row welcome text-center">
                    <div class="col-12">
                        <h1>HEAR US OUT: THANOS MIGHT NOT ACTUALLY BE SUCH A BAD GUY</h1>
                    </div>
                    <hr class="light">
                </div>
            </div>
            <!-- News Body -->
            <div class="container-fluid padding">
                <div class="row padding">
                    <div class="col-10 text-left mx-auto">
                        <h3>IS THE MAD TITAN REALLY JUST A MISUNDERSTOOD, LOVESICK LONER IN NEED OF A HOME, SOME LOVE, AND A REALLY BIG HUG?</h3>
                        <h5>by Grae Drake | April 20, 2018 | </h5>
                        <p>I am obsessed with two things: finding a leather moto jacket that doesn’t make me look like Ric Ocasek on a bad day, and Thanos. Ever since the Mad Titan showed up at the end of The Avengers in 2012, I’ve wondered what this big bad gauntlet-crazy grape guy was cooking up. I’ve worn holes in my carpet with the pacing and the pontificating. Since I don’t have a relationship to the comic books, I’ve found myself hungry for more information. And in my deep thinking I’ve come up with a bit of an idea.</p>
                        <p>Thanos might not be as bad a guy as we think he is.</p>
                        <p>Stay with me, now. It’s easier for most of us to identify with the good guys. But when careful writing makes us give the same consideration to the baddies, then things become really interesting. Anyone who’s ever lived in a sibling’s shadow can understand Loki. Or a person feeling vengeance can see why Vanko wants to slice Tony Stark in two. Or why Hela would want to destroy Asgard. And Killmonger’s claim to the throne was actually aligned with royal Wakandan protocol, even though his approach was…a little over the top.</p>
                        <p>When you pore over the comics, you can start to see how Thanos could be about to join the ranks of Marvel’s most misunderstood villains. And why you might actually come to like the big guy. Hear us out:</p>
                        <p>THANOS IS SAD AND LONELY, LIKE AN ORANGE JULIUS IN A FOOD COURT THAT TIME LONG FORGOT.  </p>
                        <p>The Mad Titan came into this world as a (theoretically) innocent baby, and his mom, Sui-San, was so freaked out about his appearance that she tried to murder him immediately. That really sets you up for some disturbing life patterns – which we’ll get back to later. But his life as Grimace’s unofficial cousin has made him an outsider. Apparently, he never found a community on Titan that embraced color and accessories with quite the same fervor as he does, and then, well, Titan was destroyed. No more planet for this outcast. So how did he spend his time? (You know, aside from floating around on a rock.)</p>
                        <p>AND HE HAS A PRETTY AWESOME HEARTBREAK STORY UP HIS SLEEVE.</p>
                        <p>Thanos met Death, a super-goth emo girl who didn’t like him back. He didn’t care that she only really had affinity for those who she was supposed to snuff out. Like everyone else in every universe ever, he found himself trying to impress someone who couldn’t have cared less, and would stop at nothing to get her attention. So, he combined that mission with his love of sparkly things, and he cooked up a plan to summon up Death everywhere he saw and wipe out half the universe. That sly smile he gets whenever he thinks about it should be sign enough that this guy has it real bad — just like my friend that asked out the towel girl at his gym, panicked, and bought a sports car to impress her on their date.</p>
                        <p>ALSO, HE’S NOT TOTALLY UNREASONABLE.</p>
                        <p>Gamora reveals in the Infinity War trailer that he wants to destroy half the universe. Not the WHOLE universe, y’all. He’s going a little overboard and is very misguided, sure. But he is obviously drawn to having the life that didn’t exist for him as a child, with a partner and children.</p>
                        <p>NOW, LET’S TALK ABOUT HIS DYSFUNCTIONAL FAMILY.</p>
                        <p>He did adopt two daughters, which is usually a sign of a decent person… right? And sure, he made Gamora and Nebula fight each other and then replaced some of their parts with machinery, and there’s no excusing that. But he tried to get them into the family business and give them a life that he didn’t have. Luckily, the only success he really had — and an accidental success at that — was activating the inherent strength in the two women. They hit bumps in their adult lives (like occasionally trying to kill each other and stealing stuff), but they’re both ultimately productive citizens of the universe. Any parent just wants their child to have a better life than they had — and in this case, because of their mettle and resources, his daughters are absolutely better off than Thanos was.</p>
                        <p>WHY DO YOU THINK HE’S WAITED THIS LONG? WE’RE CALLING IT: HE’S AN ATTENTION SEEKER.</p>
                        <p>It’s taken lots of space years for things to heat up in Thanos’ world. He’s relishing every moment. Dig into the comic books and you discover that his terrible start to life and unhealthy approach to relationships makes him the ultimate self-saboteur. He doesn’t actually want to succeed, because every time he gets an opportunity to put his money where his mouth is, he is undone. This dude just wants attention (which I could have told you when I first got a good look at his shoulder pads in 2014).</p>
                        <p>FINALLY…DOES HE PASS THE BEER TEST? </p>
                        <p>In politics, pundits talk about the beer test — would you want to go to a bar and drink with a candidate? Finer points aside, Thanos has lived through a lot, has a bunch of intergalactic tales to tell, and would actually be a good hang. One can only assume that he has more expensive jewelry stashed somewhere and would probably pick up the bill once in a while. With some intergalactic counseling and some people who are willing to invest some energy in being his friend, Thanos might not be such a terror.</p>
                        <hr class="light">
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
