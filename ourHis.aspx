<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ourHis.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    <div class="navbar navbar-inverse navbar-fixed-top headroom" runat="server">
        <div class="container">
            <div class="navbar-header">

                <!-- Button for smallest screens -->
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.aspx">
                    <img src="assets/images/logo.png" alt="">
                </a>
                &nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div class="navbar-collapse collapse" runat="server">
                <ul class="nav navbar-nav pull-right">
                    <li>
                        <a href="index.aspx">Home</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Services<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="search.aspx">Search</a>
                            </li>
                            <li>
                                <a href="top10.aspx">Top10</a>
                            </li>
                            <li>
                                <a href="Map.aspx">Map</a>
                            </li>
                            <li>
                                <a href="compare.aspx">Compare</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="forum.aspx">Discuss</a>
                    </li>
                    <li class=" active">
                        <a href="ourHis.aspx">About Us</a>
                    </li>
                    <li>
                        <a href="Contact.aspx">Contact</a>
                    </li>
                    <li>
                        <a href="<%=URL%>">
                            <asp:Label runat="server" id="UserSigned" Text="SIGN IN / SIGN UP" class="btn-sm btn-info"></asp:Label>

                        </a>
                    </li>
                    <li>
                        <a href="<%=URL1%>">
                            <asp:Label runat="server" id="user" class="btn-sm btn-success" Visible="False" />

                        </a>
                    </li>

                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="Server">
    <header id="head" class="secondary"></header>
    <div class="container" style="background-color: white">
        <ol class="breadcrumb">
            <li><a href="index.aspx">Home</a></li>
            <li class="active">About Us</li>
        </ol>
    </div>
    <br />
    <br />
    <br />
    <div class="container">
        <h3>About us</h3>
        <hr>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <p>Raising a child is probably one of the primary concerns for every household in Victoria. One of the important factors for this concern is the safety of children and teenagers in the neighbourhood. Shield is a website that gives information about the safety condition in Victoria’s neighbourhoods. This website allows registered users who are parents, teachers, or future parents to view, find, and compare child safety condition of different areas in Victoria. This website is using open data from Victoria Government about vaccination, bullying, crime on young, and child abuse. The data came from surveys about those factors conducted in Victoria from 2009 to 2012. This website also provides a forum for sharing and discussing how to improve the safety condition regarding children and young people.  Therefore, this website is important because it provides safety information that plays a vital role in supporting the child’s safety and well-being.</p>
                <hr>
            </div>
        </div>
        <div class="row">
        </div>
        <!--.row -->
    </div>
    <!--./container -->

    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h4>Video introduction</h4>
                <p>
                    Before you register, you might wanna know, what will be provided by the website. Have a look at this video, it would tell you what will be happen next!
                </p>
                <img src="assets/images/childpic.jpg" class="img-circle" alt="tv">
            </div>
            <!--.col -->

            <div class="col-md-8">
                <div class="col-md-12">
                    <h3>Have a look, it's funny!</h3>
                    <p>
                        <strong>How to get some information about child safety?</strong>

                    </p>

                    <p>
                        <a href="https://www.youtube.com/watch?v=6TTttL_LIik" target="_blank">View video on YouTube.</a>
                    </p>

                </div>
                <div class="vid">

                    <iframe width="640" height="360" src="https://www.youtube.com/embed/6TTttL_LIik?feature=player_detailpage" frameborder="0" allowfullscreen></iframe>
                </div>
                <!--./vid -->

            </div>
            <!--.col -->

        </div>
        <!--./row -->

    </div>
    <!--./container -->

    <div class="container">


        <!-- The Team -->
        <div class="home-doctors  clearfix">

            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 ">
                        <hr>
                        <div class="slogan-section animated fadeInUp clearfix ae-animation-fadeInUp">
                            <h2>Meet our <span>Specialists</span></h2>
                            <p>
                                Our developer are from Monash University Information Technology faculty. They are experienced, and have enough knowledge on both website building and 
                                            data anaylsing. Also, currently they are working as website administrator, feel free to contact them.
                            </p>
                        </div>
                    </div>
                </div>



                <div class="row">



                    <!-- entry1 -->
                    <div class="col-lg-3 col-md-3 col-sm-6  text-center doc-item">
                        <div class="common-doctor animated fadeInUp clearfix ae-animation-fadeInUp">

                            <ul class="list-inline social-lists animate">

                                <li><a href="clger007@gmail.com"><i class="fa fa-google"></i></a></li>
                                <li><a href="https://au.linkedin.com/pub/cheligeer-ken/a2/339/72a"><i class="fa fa-linkedin-square"></i></a></li>
                                <li><a href="https://www.facebook.com/ken.cheleeger"><i class="fa fa-facebook"></i></a></li>
                            </ul>

                            <figure>
                                <img width="670" height="500" src="assets/images/ken.jpg" class="doc-img animate attachment-gallery-post-single wp-post-image" alt="doctor-2">
                            </figure>

                            <div class="text-content">
                                <h5>Cheligeer</h5>
                                <!-- <div class="for-border"></div> -->
                                <h5><small>Developer</small></h5>
                            </div>
                        </div>
                    </div>





                    <!-- entry2 -->
                    <div class="col-lg-3 col-md-3 col-sm-6  text-center doc-item">
                        <div class="common-doctor animated fadeInUp clearfix ae-animation-fadeInUp">

                            <ul class="list-inline social-lists animate">

                                <li><a href="baolixiang900818@gmail.com"><i class="fa fa-google"></i></a></li>
                               
                                <li><a href="https://www.facebook.com/profile.php?id=100006684613921&fref=ts"><i class="fa fa-facebook"></i></a></li>
                            </ul>

                            <figure>
                                <img width="670" height="500" src="assets/images/AjX-REN.jpg" class="doc-img animate attachment-gallery-post-single wp-post-image" alt="doctor-2">
                            </figure>

                            <div class="text-content">
                                <h5>Xiang Ren</h5>
                                <!-- <div class="for-border"></div> -->
                                <h5><small>Developer</small></h5>
                            </div>
                        </div>
                    </div>




                    <!-- entry3 -->
                    <div class="col-lg-3 col-md-3 col-sm-6  text-center doc-item">
                        <div class="common-doctor animated fadeInUp clearfix ae-animation-fadeInUp">

                            <ul class="list-inline social-lists animate">

                                <li><a href="mihirmore.9017@gmail.com"><i class="fa fa-google"></i></a></li>
                               
                                <li><a href="https://www.facebook.com/mihirthekiller?fref=ts"><i class="fa fa-facebook"></i></a></li>
                            </ul>

                            <figure>
                                <img width="670" height="500" src="assets/images/Mihir.jpg" class="doc-img animate attachment-gallery-post-single wp-post-image" alt="doctor-2">
                            </figure>

                            <div class="text-content">
                                <h5>Mihir More</h5>
                                <!-- <div class="for-border"></div> -->
                                <h5><small>Developer</small></h5>
                            </div>
                        </div>
                    </div>





                    <!-- entry4 -->
                    <div class="col-lg-3 col-md-3 col-sm-6  text-center doc-item">
                        <div class="common-doctor animated fadeInUp clearfix ae-animation-fadeInUp">

                            <ul class="list-inline social-lists animate">

                                <li><a href="yeninurizati@gmail.com"><i class="fa fa-google"></i></a></li>
                                <li><a href="https://www.linkedin.com/pub/yeni-nur-izati/b5/a33/710"><i class="fa fa-linkedin-square"></i></a></li>
                                <li><a href="https://twitter.com/yeninurizati"><i class="fa fa-twitter"></i></a></li>
                            </ul>

                            <figure>
                                <img width="670" height="500" src="assets/images/YENI.jpg" class="doc-img animate attachment-gallery-post-single wp-post-image" alt="doctor-2">
                            </figure>

                            <div class="text-content">
                                <h5>YENI</h5>
                                <!-- <div class="for-border"></div> -->
                                <h5><small>Developer</small></h5>
                            </div>
                        </div>
                    </div>
                    <!-- // -->




                    <div class="visible-sm clearfix margin-gap"></div>
                </div>

            </div>

        </div>
        <!-- //The Team -->
        <div class="container">




            <b>© Startech 2015 All Rights Reserved<b>
                <hr />
        </div>
        <style type="text/css">
            @import url(//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css);



            .animate {
                -webkit-transition: all 0.3s ease-in-out;
                -moz-transition: all 0.3s ease-in-out;
                -o-transition: all 0.3s ease-in-out;
                -ms-transition: all 0.3s ease-in-out;
                transition: all 0.3s ease-in-out;
            }

            /*=============== Home-team ===============*/

            .home-doctors {
                text-align: center;
                padding: 70px 0 80px;
            }

                .home-doctors h2 {
                    font-weight: normal;
                }

                .home-doctors .common-doctor {
                    background-color: #fff;
                }

                    .home-doctors .common-doctor figure {
                        overflow: hidden;
                        width: 100%;
                        height: 196px;
                    }

                .home-doctors img {
                    width: 100%;
                    height: auto;
                    margin-top: -6em;
                }

                .home-doctors .common-doctor h5 {
                    margin: 0 0 7px;
                    font-size: 18px;
                    font-weight: 700;
                    color: #3a3c41;
                }

                .home-doctors .common-doctor .for-border {
                    margin-bottom: 20px;
                }

                .home-doctors .common-doctor .text-content {
                    padding: 19px 14px 13px;
                }

                .home-doctors.doctors-var-two {
                    text-align: left;
                    background-color: #fff;
                }

                    .home-doctors.doctors-var-two .slogan-section {
                        text-align: left;
                    }

                    .home-doctors.doctors-var-two .common-doctor {
                        background-color: transparent;
                    }

                        .home-doctors.doctors-var-two .common-doctor .for-border {
                            display: none;
                        }

                        .home-doctors.doctors-var-two .common-doctor .text-content {
                            padding: 20px 0 20px;
                        }

                    .home-doctors.doctors-var-two .text-center {
                        text-align: left;
                    }

            .slogan-section {
                margin-bottom: 50px;
                text-align: center;
            }

            .home-doctors .common-doctor .for-border {
                margin-bottom: 20px;
            }

            .for-border {
                height: 11px;
                width: 100%;
                background: transparent url(http://omarhabash.com/nova/wp-content/uploads/2014/08/feature-border.png) center center no-repeat;
                border: none;
            }

            .home-doctors .common-doctor h5 small {
                color: #008fd5;
                font-weight: bold;
                font-size: 0.8em;
                font-style: italic;
            }

            .home-doctors .common-doctor ul {
                position: absolute;
                top: 50%;
                left: 0;
                width: 100%;
                margin-top: -28px;
                text-align: center;
                margin-top: 10em;
                opacity: 0;
                z-index: 1;
            }

            .home-doctors .common-doctor li a {
                background: #008fd5;
                color: white;
                padding: 0.75em;
                border: 5px solid rgba(255, 255, 255, 0.33);
            }


            .doc-img {
                /* Webkit for Chrome and Safari */
                -webkit-transform: scale(1, 1);
                // This is the scale for the normal size of the image. -webkit-transition-duration: 500ms;
                -webkit-transition-timing-function: ease-out;
                /* Webkit for Mozila Firefox */
                -moz-transform: scale(1, 1);
                -moz-transition-duration: 500ms;
                -moz-transition-timing-function: ease-out;
                /* Webkit for IE( Version: 11, 10 ) */
                -ms-transform: scale(1, 1);
                -ms-transition-duration: 500ms;
                -ms-transition-timing-function: ease-out;
            }

            .doc-item:hover .doc-img {
                /* Webkit for Chrome and Safari */
                -webkit-transform: scale(1.2, 1.2);
                // This is the enlarged size scale of the image. -webkit-transition-duration: 500ms;
                -webkit-transition-timing-function: ease-out;
                /* Webkit for Mozila Firefox */
                -moz-transform: scale(1.2, 1.2);
                -moz-transition-duration: 500ms;
                -moz-transition-timing-function: ease-out;
                /* Webkit for IE( Version: 11, 10 ) */
                -ms-transform: scale(1.20, 1.20);
                -ms-transition-duration: 500ms;
                -ms-transition-timing-function: ease-out;
                opacity: 0.7;
            }

            .doc-item:hover .social-lists {
                margin-top: -2em;
                opacity: 1;
            }
        </style>
</asp:Content>

