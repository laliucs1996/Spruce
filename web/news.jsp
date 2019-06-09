<%-- 
    Document   : news
    Created on : May 11, 2018, 3:04:50 PM
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
                        <h1>WEEKEND BOX OFFICE RESULTS: A QUIET PLACE RECLAIMS TOP SPOT, AS RAMPAGE DROPS</h1>
                    </div>
                    <hr class="light">
                </div>
            </div>
            <!-- News Body -->
            <div class="container-fluid padding">
                <div class="row padding">
                    <div class="col-10 text-left mx-auto">
                        <h3>I FEEL PRETTY AND SUPER TROOPERS 2 BEAT EXPECTATIONS FOR THE WEEKEND OF APRIL 20-22.</h3>
                        <h5>by Erik Childress | April 22, 2018 |</h5>
                        <hr class="light">
                        <p>Normally this weekend would be considered the calm before the storm as the summer movie season begins a week early this year, but there was a surprisingly strong showing on two films that tracking companies had written off. Again. Both I Feel Pretty and Super Troopers 2 opened stronger than expected. But neither could stand up to the one film most moviegoers can agree is the must-see of the moment: John Krasinski’s A Quiet Place reclaimed the top spot at the box office, maintaining its pace for between $190 million to $200 million domestic, as Rampage took a plunge.</p>
                        <p>Amy Schumer’s Trainwreck opened to a robust $30 million and 86% Tomatometer score in summer 2015. Two years later her follow-up, Snatched (boasting the return of Goldie Hawn after a 15-year absence from the big screen) opened to a decent $19.5 million; however, the film, with a weak 36% Tomatometer score and boosted by a Mother’s Day weekend campaign, petered out quickly with just a 2.34 multiple for only a $45.8 million total. STX sold I Feel Pretty’s premise to $16 million this weekend, which, on one hand, is another drop for Schumer, but not nearly the kind predicted by tracking, which barely had it in the teens.</p>
                        <p>The track record of screenwriters Abby Kohn and Marc Silverstein (who make their directorial debut here) has some impressive box office numbers despite some critical drubbings. They include Never Been Kissed (57% Tomatometer score / $11.8 million opening / 4.68 multiple / $55.4 million total), He’s Just Not That Into You (40% / $27.7 million / 3.38 / $93.9 million), Valentine’s Day (where they just had story credit) (18% / $56.2 million / 1.96 / $110.4 million ), and The Vow (29% / $41.2 million / 3.03 / $125 million). Those last three movies opened within two to eight days each of actual Valentine’s Day. Through the Hallmark holiday, those films had already, respectively, grossed 53%, 50.9%, and 44.8% of their final grosses. Critics were also not on board with I Feel Pretty (35%) and the film’s RT Audience Score is currently lower than that for Snatched (28% vs. 30%). If it follows that same path, the $32 million production is unlikely to accumulate the near $100 million worldwide it will need to turn a profit. Snatched did only $14 million internationally and $60 million total.</p>
                        <p>The Broken Lizard brand has never grossed $20 million at the box office. Super Troopers 2 is going to do that in its first week. The crowdfunded sequel to the cult pickup from Sundance 16 years ago made more on Friday than Club Dread made in its entire run ($5 million.). This columnist’s belief that it’s far and away the troupe’s best film is at odds with Rotten Tomatoes’ collection of critics who rated it as their worst, scoring the film only a 29% on the Tomatometer. Then again their best rating is Beerfest’s 41% Tomatometer score with both Super Troopers and The Slammin’ Salmon coming in at 35%. Critics were not thrilled with the sequel either with just 33% of them rating it favorably. But their fans showed up like they never have before with a $14.7 million opening. Not too shabby for a film that raised $4.4 million after an initial request of just $2 million.</p>
                        <p>Rampage continues to generate exponential increases over its initial weekend estimates — the film, expected to post a 51% drop, fell just 41%. With a little over $283 million worldwide, the film is still about $76 million away from getting into the black for Warner Bros. Speaking of WB, Ready Player One has become the sixth film of Steven Spielberg’s career (inflation notwithstanding) to gross over $500 million worldwide alongside E.T., Jurassic Park, The Lost World: Jurassic Park, War of the Worlds, and Indiana Jones and the Kingdom of the Crystal Skull. (Jaws, Indiana Jones and the Last Crusade, and Saving Private Ryan grossed over $450 million.) With due respect to international sensations, Operation Red Sea and Detective Chinatown 2, Ready Player One is the second highest-grossing (Stateside) release globally after Black Panther this year. But with a hefty all-in pricetag of around $300 million, the studio may be looking at the home market to recoup all costs. Given their summer lineup, too — Life of the Party, Tag, Teen Titans Go! to the Movies, The Meg, and Crazy Rich Asians — it is possible only one film, Ocean’s 8, will even touch the $100 million milestone in the States.</p>
                        <p>The Telugu-language film, Bharat Ane Nenu, just missed the top 10 this week. With $2.85 million in just 305 theaters, it also boasted the best per-theater-average of the week with $9,344. Sony Classics’ The Rider (97% RT) added six more theaters (for a total of nine) to grab the second PTA of $8,715. It has made $142,768 in two weeks. (Super Troopers 2 had the third best PTA.)</p>
                        <p>The Fate of the Furious dropped 61% in its second weekend, but still had plenty in the bank to win the weekend with $38.4 million. It was a weekend of forgotten newbies including Unforgettable ($4.78 million) and Phoenix Forgotten ($1.8 million). Disney’s nature doc, Born in China, led all the new releases in sixth place with $4.79 million. The weekend also saw the release of the $90 million-financed disaster, The Promise, about the Armenian genocide released by then Open Road (now Global Road). It opened to $4 million and finished with $8.2 million. A24 also had their second wide release launch (after The Witch) with Ben Wheatley’s Free Fire. It opened in 1,070 theaters to just $994,431 and finished with just $1.79 million.</p>
                        <p>Avengers: Infinity War, the first event movie of the summer opens a week earlier than originally announced, getting an extra jump on the upcoming Deadpool 2 and Solo: A Star Wars Story — all surely to be among the top five grossers of the summer. Infinity War should be the undisputed champion crossing at least the half-billion mark domestically and the full billion and then some worldwide. Can it ultimately beat Black Panther, which, this weekend, passed $681 million domestic? Unlikely, given the direct challengers that will face off against the Avengers sooner rather than later. On the other hand, do not be surprised if the film opens to the third (maybe second) highest opening weekend ever, reclaiming the Marvel record while Black Panther continues to linger in the top 10 for its 11th straight week.</p>
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
