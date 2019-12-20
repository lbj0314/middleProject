<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<c:import url="../layout/header.jsp"></c:import>

    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>Au Register Forms by Colorlib</title>

    <!-- Icons font CSS-->
    <link href="../resources/memberMyres/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="../resources/memberMyres/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">

    <!-- ../resources/memberMyres/vendor CSS-->
    <link href="../resources/memberMyres/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="../resources/memberMyres/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="../resources/memberMyres/css/main.css" rel="stylesheet" media="all">
</head>

<body>
	<c:import url="../layout/header_area.jsp"></c:import>
	
    <div class="page-wrapper bg-blue p-t-100 p-b-100 font-robo">
        <div class="wrapper wrapper--w680">
            <div class="card card-1">
                <div class="card-heading"></div>
                <div class="card-body">
                    <h2 class="title"></h2>
                    <form method="POST">
                        <div class="input-group">
                            <input class="input--style-1" type="text" placeholder="NAME" name="name">
                        </div>                   
                        <div class="input-group">
                            <div class="rs-select2 js-select-simple select--no-search">
                                <select name="class">
                                    <option disabled="disabled" selected="selected">CLASS</option>
                                    <option>Class 1</option>
                                    <option>Class 2</option>
                                    <option>Class 3</option>
                                </select>
                                <div class="select-dropdown"></div>
                            </div>
                        </div>
                    
                        <div class="p-t-20">
                            <button class="btn btn--radius btn--green" type="submit">확인</button>
                      	   <button class="btn btn--radius btn--green" type="submit">예약취소</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Jquery JS-->
    <script src="../resources/memberMyres/vendor/jquery/jquery.min.js"></script>
    <!-- ../resources/memberMyres/vendor JS-->
    <script src="../resources/memberMyres/vendor/select2/select2.min.js"></script>
    <script src="../resources/memberMyres/vendor/datepicker/moment.min.js"></script>
    <script src="../resources/memberMyres/vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="../resources/memberMyres/js/global.js"></script>
    
    <!--=============== footer =================-->
	<c:import url="../layout/footer.jsp" />
    

</body>

</html>