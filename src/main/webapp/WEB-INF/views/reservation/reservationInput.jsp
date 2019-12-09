<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	 <!-- Javascript -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="../resources/js/vendor/jquery-2.2.4.min.js"></script>
    <script src="../resources/js/vendor/bootstrap-4.1.3.min.js"></script>
    <script src="../resources/js/vendor/wow.min.js"></script>
    <script src="../resources/js/vendor/owl-carousel.min.js"></script>
    <script src="../resources/js/vendor/jquery.datetimepicker.full.min.js"></script>
    <script src="../resources/js/vendor/jquery.nice-select.min.js"></script>
    <script src="../resources/js/main.js"></script>

    <!-- Required Meta Tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Page Title -->
    <title>Foodfun</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="../resources/images/logo/favicon.png" type="image/x-icon">

    <!-- CSS Files -->
    <link rel="stylesheet" href="../resources/css/animate-3.7.0.css">
    <link rel="stylesheet" href="../resources/css/font-awesome-4.7.0.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.1.3.min.css">
    <link rel="stylesheet" href="../resources/css/owl-carousel.min.css">
    <link rel="stylesheet" href="../resources/css/jquery.datetimepicker.min.css">
    <link rel="stylesheet" href="../resources/css/style.css">
 
</head>
<body>
 
 <!-- Update Area Starts -->
    <section class="update-area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-top2 text-center">
                        <h3>Our <span>food</span> update</h3>
                        <p><i>Beast kind form divide night above let moveth bearing darkness.</i></p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="single-food">
                        <div class="food-img">
                            <img src="../resources/images/update1.jpg" class="img-fluid" alt="">
                        </div>
                        <div class="food-content">
                            <div class="post-admin d-lg-flex mb-3">
                                <span class="mr-5 d-block mb-2 mb-lg-0"><i class="fa fa-user-o mr-2"></i>Admin</span>
                                <span><i class="fa fa-calendar-o mr-2"></i>18/09/2018</span>
                            </div>
                            <h5>no finer food can be found</h5>
                            <p>nancy boy off his nut so I said chimney pot be James Bond aking cakes he.</p>
                            <a href="#" class="template-btn3 mt-2">read more <span><i class="fa fa-long-arrow-right"></i></span></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="single-food my-5 my-md-0">
                        <div class="food-img">
                            <img src="../resources/images/update2.jpg" class="img-fluid" alt="">
                        </div>
                        <div class="food-content">
                            <div class="post-admin d-lg-flex mb-3">
                                <span class="mr-5 d-block mb-2 mb-lg-0"><i class="fa fa-user-o mr-2"></i>Admin</span>
                                <span><i class="fa fa-calendar-o mr-2"></i>20/09/2018</span>
                            </div>
                            <h5>things go better with food</h5>
                            <p>nancy boy off his nut so I said chimney pot be James Bond aking cakes he.</p>
                            <a href="#" class="template-btn3 mt-2">read more <span><i class="fa fa-long-arrow-right"></i></span></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="single-food">
                        <div class="food-img">
                            <img src="../resources/images/update3.jpg" class="img-fluid" alt="">
                        </div>
                        <div class="food-content">
                            <div class="post-admin d-lg-flex mb-3">
                                <span class="mr-5 d-block mb-2 mb-lg-0"><i class="fa fa-user-o mr-2"></i>Admin</span>
                                <span><i class="fa fa-calendar-o mr-2"></i>22/09/2018</span>
                            </div>
                            <h5>food head above the rest</h5>
                            <p>nancy boy off his nut so I said chimney pot be James Bond aking cakes he.</p>
                            <a href="#" class="template-btn3 mt-2">read more <span><i class="fa fa-long-arrow-right"></i></span></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Update Area End -->


    <!-- Table Area Starts -->
    <section class="table-area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-top2 text-center">
                        <h3>Book <span>your</span> table</h3>
                        <p><i>Beast kind form divide night above let moveth bearing darkness.</i></p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <form action="reservationInput">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                            </div>
                            <input type="text" id="datepicker" name="rev_date">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fa fa-clock-o" ></i></span>
                            </div>
                            <input type="text" id="datepicker2" name="rev_time">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <span class="input-group-text"><i class="fa fa-user-o"></i></span>
                            </div>
                            <input type="text" name="rev_peopel">
                        </div>
                        <div class="table-btn text-center">
                            <a href="../" class="template-btn template-btn2 mt-4">book a table</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    
    

<c:import url="../layout/footer.jsp"></c:import>
</body>
</html>