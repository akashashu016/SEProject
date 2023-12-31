<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Evento</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">


        <link rel="stylesheet" href="assets/css/iconfont.css">
        <link rel="stylesheet" href="assets/css/slick/slick.css">
        <link rel="stylesheet" href="assets/css/slick/slick-theme.css">
        <link rel="stylesheet" href="assets/css/stylesheet.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/jquery.fancybox.css">
        <link rel="stylesheet" href="assets/css/bootstrap.css">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <!--        <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">-->


        <!--For Plugins external css-->
        <link rel="stylesheet" href="assets/css/plugins.css" />

        <!--Theme custom css -->
        <link rel="stylesheet" href="assets/css/style.css">

        <!--Theme Responsive css-->
        <link rel="stylesheet" href="assets/css/responsive.css" />
<style type="text/css">
		table,tr,th {padding:10px;}
		</style>

        <script src="assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    </head>
    <body data-spy="scroll" data-target=".navbar-collapse">

        <div class='preloader'><div class='loaded'>&nbsp;</div></div>
        <div class="culmn">
            <header id="main_menu" class="header navbar-fixed-top">            
                <div class="main_menu_bg">
                    <div class="container">
                        <div class="row">
                            <div class="nave_menu">
                                <nav class="navbar navbar-default">
                                    <div class="container-fluid">
                                        <!-- Brand and toggle get grouped for better mobile display -->
                                        <div class="navbar-header">
                                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                                <span class="sr-only">Toggle navigation</span>
                                                <span class="icon-bar"></span>
                                                <span class="icon-bar"></span>
                                                <span class="icon-bar"></span>
                                            </button>
                                            <a class="navbar-brand" href="index.html" style="font-size:60px;color:white; font-family:Bradley Hand ITC; font-weight:bold; margin-top:20px">
                                                EVENTO
                                            </a>
                                        </div>

                                        <!-- Collect the nav links, forms, and other content for toggling -->



                                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

                                            <ul class="nav navbar-nav navbar-right">
                                                <li><a href="#home" style="font-family:Bradley Hand ITC;font-size:19px;">HOME</a></li>
                                                <li><a href="#history" style="font-family:Bradley Hand ITC;font-size:19px;">ABOUT US</a></li>
                                                <li><a href="#blog"  style="font-family:Bradley Hand ITC;font-size:19px;">Events</a></li>
                                                <li><a href="#contact"  style="font-family:Bradley Hand ITC;font-size:19px;">Contact</a></li>
                                                <li><a href="admin.html"  style="font-family:Bradley Hand ITC;font-size:19px;">Admin</a></li>
                                                <li><a href="organizer.html"  style="font-family:Bradley Hand ITC;font-size:19px;">Organizer</a></li>
                                                <li><a href="user.html"  style="font-family:Bradley Hand ITC;font-size:19px;">User</a></li>
                                            </ul>


                                        </div>

                                    </div>
                                </nav>
                            </div>	
                        </div>

                    </div>

                </div>
            </header> <!--End of header -->




            <!--home Section -->
            <section id="home" class="home">
                <div class="overlay">
                    <div class="home_skew_border">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-12 ">
                                    <div class="main_home_slider text-center">
                                        <div class="single_home_slider">
                                            <div class="main_home wow fadeInUp" data-wow-duration="700ms">
<h3 style="font-family:Bradley Hand ITC;font-size:40px;font-weight:bold;">Welcome to User,<%= session.getAttribute("UserName") %></h3><Br><Br>
<table align="center" style="font-family:Bradley Hand ITC;" width=100% border=3>
<tr style="font-size:25px;color:white;font-weight:bold;"><th>EventName</th><th>Date</th><th>Category</th>
<th>Price(per Ticket)</tH><th>Venue</th><th>Number of Tickets</tH><th>
Total amount</th></tr>
<%@page import="java.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:8083/evento","root","password");
String user=(String)session.getAttribute("UserName");
 PreparedStatement pst=con.prepareStatement("Select * from payments where username=?");
 pst.setString(1,user);
 ResultSet rs=pst.executeQuery();
 while(rs.next())
 {
%>
<tr style="font-size:21px;color:white">
<th><%= rs.getString(3) %></th><th><%= rs.getString(4) %></th><th><%= rs.getString(5) %></th>
<th><%= rs.getString(6) %></th><th><%= rs.getString(7) %></th><th><%= rs.getString(8) %></th>
<th><%= rs.getString(9) %></th>
</tr>
<%
 }
%>
</table>
					<br>
					<br><a href="userhome.jsp">Back</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </section><!--End of home section -->




           <!-- History section -->
            <section id="history" class="history sections">
                <div class="container">
                    <div class="row">
                        <div class="main_history">
                            <div class="col-sm-6">
                                <div class="single_history_img">
                                    <img src="assets/images/stab1.jpg" alt="" />
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="single_history_content">
                                    <div class="head_title">
                                        <h2 style="font-family:Bradley Hand ITC;font-size:45px; font-weight:bold;">About Us</h2>
                                    </div>
                                    <p style="font-family:Bradley Hand ITC;font-size:15px;">EVENTO is a company which offers its user to do various kinds of activities like create events, book tickets to the ongoing events in various cities, 
    search for the events based on the location of one's interests and convenience. EVENTO provide with different categories of events like food, cultural, 
    college, social events which includes concerts, walkathons, educational fairs, exhibitions, camps and many more. One can directly book the events of 
    their choice and grab the chance of enjoying the events.<br />
    EVENTO also provides a platform for the event organizers to create their Events, publish and can also sell their tickets. Evento provides a very 
    consumer friendly way of creating the events without much effort.   </p>

                                   
                                </div>
                            </div>
                        </div>
                    </div><!--End of row -->
                </div><!--End of container -->
            </section><!--End of history -->




            <!-- Blog Section -->
            <section id="blog" class="blog">
                <div class="container-fluid">
                    <div class="row">
                        <div class="main_blog sections">
                            <div class="head_title text-center">
                                <h2 style="font-family:Bradley Hand ITC;font-size:45px;font-weight:bold;"">EVENTS</h2>
                                <div class="subtitle" style="font-family:Bradley Hand ITC;">
                                    Come Explore for having more fun
                                </div>
                                <div class="separator"></div>
                            </div><!-- End off Head_title -->

                            <div class="main_blog_content">
                                <div class="col-sm-6">
                                    <div class="single_blog_area textwhite">
                                        <div class="row">
                                            <div class="col-sm-6 no-padding">
                                                <div class="single_blog_img">
                                                    <img src="assets/images/blog1.jpg" alt="" />
                                                </div>
                                            </div>
                                            <div class="col-sm-6 no-padding">
                                                <div class="single_blog_text s_b_left">
                                                    <p></p>
                                                    <h3 style="font-family:Bradley Hand ITC;font-size:45px; font-weight:bold;">FOOD</h3>
                                                    <div class="separator2"></div><br/>
                                                    <p style="font-family:Bradley Hand ITC;font-size:18px;">As long as Food is in your mouth,<br />You have solved<br/> all Questions for time being.<br/>
You can't buy Happiness,<br/>but you can buy Food which gives happines...</p>
</p>

                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="single_blog_area textwhite">
                                        <div class="row">
                                            <div class="col-sm-6 no-padding">
                                                <div class="single_blog_img">
                                                    <img src="assets/images/blog2.jpg" alt="" />
                                                </div>
                                            </div>
                                            <div class="col-sm-6 no-padding">
                                                <div class="single_blog_text s_b_left">
                                                    
                                                    <h3 style="font-family:Bradley Hand ITC;font-size:45px; font-weight:bold;">CULTURAL</h3>
                                                    <div class="separator2"></div><br/>
                                                    <p style="font-family:Bradley Hand ITC;font-size:20px;">Art is an Effort to create,<br />beside the Real World,a more Humane World...!!!<br />Every Moment and Every Event of Every Man's Life<br />plants something in his Soul...</p>

                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="single_blog_area textwhite">
                                        <div class="row">

                                            <div class="col-sm-6 col-sm-push-6 no-padding">
                                                <div class="single_blog_img">
                                                    <img src="assets/images/blog3.jpg" alt="" />
                                                </div>
                                            </div>

                                            <div class="col-sm-6 col-sm-pull-6 no-padding">
                                                <div class="single_blog_text s_b_right">
                                                    
                                                    <h3 style="font-family:Bradley Hand ITC;font-size:45px; font-weight:bold;">COLLEGE</h3>
                                                    <div class="separator2"></div><br/>
                                                    <p style="font-family:Bradley Hand ITC;font-size:21px;">There is a Time..<br/> and Place for everything...and</br /> It's called <br/> COLLEGE...!!!<br />We don't remember Days,<br/>We remember Moments</p>

                                                    
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="single_blog_area textwhite">
                                        <div class="row">
                                            <div class="col-sm-6 col-sm-push-6 no-padding">
                                                <div class="single_blog_img">
                                                    <img src="assets/images/blog4.jpg" alt="" />
                                                </div>
                                            </div>
                                            <div class="col-sm-6 col-sm-pull-6 no-padding">
                                                <div class="single_blog_text s_b_right">
                                                    
                                                    <h3 style="font-family:Bradley Hand ITC;font-size:45px; font-weight:bold;">SOCIAL</h3>
                                                    <div class="separator2"></div><br/>
                                                    <p style="font-family:Bradley Hand ITC;font-size:24px;">Giving is not just<br/> about make a Donation<br />It's about<br/> making a Difference...!!!<br/>Be the difference and <br/> Make the Difference<br/></p></p>

                                                   
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                </div><!-- End off container -->
            </section><!-- End off Blog Section -->


            <section id="contact" class="contact">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="contact_contant sections">
                                <div class="head_title text-center">
                                    <h2 style="font-family:Bradley Hand ITC;font-size:45px; font-weight:bold;">KEEP IN TOUCH</h2>
                                    <div class="subtitle" style="font-family:Bradley Hand ITC;">
                                        EVENTO  
                                    </div>
                                    <div class="separator"></div>
                                </div><!-- End off Head_title -->
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="main_contact_info">
                                            <div class="row">
                                                <div class="contact_info_content padding-top-90 padding-bottom-60 p_l_r">
                                                    <div class="col-sm-12">
                                                        <div class="single_contact_info">
                                                            <div class="single_info_text">
                                                                <h3 style="font-family:Bradley Hand ITC;font-size:45px; font-weight:bold;">OUR ADDRESS</h3>
                                                                <h4 style="font-family:Bradley Hand ITC;">Wright State University,<br/>
																Dayton<br/>
																Ohio-45324
																</h4>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-12">
                                                        <div class="single_contact_info">
                                                            <div class="single_info_text">
                                                                <h3 style="font-family:Bradley Hand ITC;font-size:45px; font-weight:bold;">CALL US</h3>
                                                                <h4 style="font-family:Bradley Hand ITC;">+(123)-456-789</h4>
                                                                <h4 style="font-family:Bradley Hand ITC;">+(123)-456-789</h4>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-12">
                                                        <div class="single_contact_info">
                                                            <div class="single_info_text">
                                                                <h3 style="font-family:Bradley Hand ITC;font-size:45px; font-weight:bold;">EMAIL US</h3>
                                                                <h4 style="font-family:Bradley Hand ITC;">eventoproj@gmail.com</h4>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div> 

                                    <div class="col-sm-6">
                                        <div class="single_contant_left padding-top-90 padding-bottom-90">
                                            <form action="#" id="formid" style="font-family:Bradley Hand ITC;">
                                                <div class="col-lg-8 col-md-8 col-sm-10 col-lg-offset-2 col-md-offset-2 col-sm-offset-1">

                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <div class="form-group">
															<img src="assets/images/zoozoo1.png" alt=""width="100%" height="100%" />

                                                               <!-- <input type="text" class="form-control" name="name" placeholder="First Name" required="">-->
                                                            </div>
                                                        </div>
                                                    </div>


                                                  <!--  <div class="row">
                                                        <div class="col-sm-12">
                                                            <div class="form-group">
                                                                <input type="email" class="form-control" name="email" placeholder="Email" required="">
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-12">
                                                            <div class="form-group">
                                                                <input type="text" class="form-control" name="subject" placeholder="Subject" required="">
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="form-group">
                                                        <textarea class="form-control" name="message" rows="7" placeholder="Message"></textarea>
                                                    </div>

                                                    <div class="">
                                                        <input type="submit" value="SEND MESSAGE" class="btn btn-lg" style="font-family:Bradley Hand ITC;font-size:15px; font-weight:bold;">
                                                    </div>
                                                </div> 
                                            </form>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>-->
            </section><!-- End of contact section -->



            <!--Footer section-->
            <section class="footer">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="main_footer">
                                <div class="row">
                                    <div class="col-sm-6 col-xs-12">
                                        <div class="flowus">
                                            
                                        </div>
                                    </div>

                                    <div class="col-sm-6 col-xs-12">
                                        <div class="copyright_text">
                                            <p class=" wow fadeInRight" data-wow-duration="1s" style="font-family:Bradley Hand ITC;font-size:18px">Made with <i class="fa fa-heart"></i> All Rights Reserved</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section><!-- End off footer Section-->











        </div>

        <!-- START SCROLL TO TOP  -->

        <div class="scrollup">
            <a href="#"><i class="fa fa-chevron-up"></i></a>
        </div>

        <script src="assets/js/vendor/jquery-1.11.2.min.js"></script>
        <script src="assets/js/vendor/bootstrap.min.js"></script>

        <script src="assets/js/jquery.magnific-popup.js"></script>
        <script src="assets/js/jquery.mixitup.min.js"></script>
        <script src="assets/js/jquery.easing.1.3.js"></script>
        <script src="assets/js/jquery.masonry.min.js"></script>

        <!--slick slide js -->
        <script src="assets/css/slick/slick.js"></script>
        <script src="assets/css/slick/slick.min.js"></script>


        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>

    </body>
</html>
