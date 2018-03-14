<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page import="work.model.dto.TipIdeaBoard"%>
<%@ page import="work.util.MyUtility"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>MakerSpace</title>

<!-- Bootstrap core CSS -->
<link href="./Resource/mms/vendor/bootstrap/css/bootstrap2.min.css"
   rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="./Resource/mms/vendor/font-awesome/css/font-awesome.min.css"
   rel="stylesheet" type="text/css">
<link
   href="./Resource/mms/vendor/simple-line-icons/css/simple-line-icons.css"
   rel="stylesheet" type="text/css">
<link
   href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
   rel="stylesheet" type="text/css">



<!-- Custom styles for this template -->
<link href="./Resource/mms/css/landing-page.min.css" rel="stylesheet">

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<!-- Include jQuery Popup Overlay -->
<link href="./Resource/popup/jquery.popupoverlay.js" rel="stylesheet">
</head>

<body class="" id="">

   <!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary" id="">

		<%
			if (session.getAttribute("name") != null) {
		%>
		<a class="navbar-brand" href="mainService.jsp">MakerSpace</a>
		<%
			} else {
		%>
		<a class="navbar-brand" href="index.jsp">MakerSpace</a>
		<%
			}
		%>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor01" aria-controls="navbarColor01"
			aria-expanded="false" aria-label="Toggle navigation"></button>

		<div class="collapse navbar-collapse" id="navbarColor01">
			<ul class="navbar-nav mr-auto">
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<button type="button" class="btn btn-secondary my-2 my-sm-0"
					onclick="location.href='login.jsp'">로그인</button>
			</form>
			&nbsp; &nbsp;
			<form class="form-inline my-2 my-lg-0">
				<button type="button" class="btn btn-secondary my-2 my-sm-0"
					onclick="location.href='register.jsp'">회원가입</button>
			</form>
		</div>
	</nav>

   

	<!-- 중간 bar -->
   <body2>
   <nav class="navbar navbar-expand-lg navbar-dark bg-primary2" id="">
      <div class="container">
         <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarResponsive" aria-controls="navbarResponsive"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav mx-auto">
               <li class="nav-item px-lg-4"><a
                  class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
                  href="index.jsp">홈</a></li>
               <li class="nav-item px-lg-4"><a
                  class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
                  href="#coolTips">팁</a></li>
               <li class="nav-item px-lg-4"><a
                  class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
                  href="#business">아이디어</a></li>
            </ul>
         </div>
      </div>
   </nav>
   </body2>


	<!-- Masthead -->
	<header class="masthead text-white text-center">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-xl-9 mx-auto">
					<h1 class="mb-5">당신의 아이디어를 공유하세요!</h1>
				</div>
				
			</div>
		</div>
	</header>

	<!-- 꿀팁 table -->
	<br>
	<label for="exampleInputEmail1">&nbsp;</label>
   <br>
   <section class="coolTips" id="coolTips">
      <div class="container">
         <div class="alert alert-dismissible alert-primary">
            <h2 class="alert-heading">
               <a href="tipboardcontroller?action=getTipBoards&category=tips" class="alert-link">3월 꿀팁 베스트 5</a>
            </h2>
         </div>
      </div>
      <div class="container">
         <table class="table table-hover" style="border: solid 2px #cccccc">
            <thead>
               <tr class="table-active">
                  <th scope="col">순위</th>
                  <th scope="col">제목</th>
                  <th scope="col">작성자</th>
                  <th scope="col">조회수</th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <th scope="row">1</th>
                  <td><a href="#" class="alert-link"> 아이고 세상에 이런일이</a></td>
                  <td>황보영</td>
                  <td>11</td>
               </tr>
               <tr>
                  <th scope="row">2</th>
                  <td>Column content</td>
                  <td>Column content</td>
                  <td>Column content</td>
               </tr>
               <tr>
                  <th scope="row">3</th>
                  <td>Column content</td>
                  <td>Column content</td>
                  <td>Column content</td>
               </tr>
               <tr>
                  <th scope="row">4</th>
                  <td>Column content</td>
                  <td>Column content</td>
                  <td>Column content</td>
               </tr>
               <tr>
                  <th scope="row">5</th>
                  <td>Column content</td>
                  <td>Column content</td>
                  <td>Column content</td>
               </tr>
            </tbody>
         </table>
      </div>
   </section>

	<!-- 비즈니스 Icons Grid -->
	<br>
	<section class="business" id="business">
		<div class="container">
			<div class="alert alert-dismissible alert-primary">
				<h2 class="alert-heading">
					<h2 class="alert-link">아이디어</h2>
				</h2>
			</div>
		</div>
		<section class="testimonials text-center bg-light">
			<div class="container">
				<div class="row">
					<div class="col-lg-3">
						<div class="testimonial-item mx-auto mb-8 mb-lg-0">
						<a href="login.jsp"> 
							<img class="img-fluid rounded-circle mb-5"
								src="./Resource/mms/img/it.png" alt=""></a>
							<h3>
								<a href="login.jsp" class="alert-link">정보기술</a>
							</h3>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="testimonial-item mx-auto mb-5 mb-lg-0">
							<a href="login.jsp"> 
							<img class="img-fluid rounded-circle mb-5"
								src="./Resource/mms/img/sales&marketing.png" alt="">
							</a>
							<h3>
								<a href="login.jsp" class="alert-link">영업 & 마케팅</a>
							</h3>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="testimonial-item mx-auto mb-5 mb-lg-0">
							<a href="login.jsp"> <img
								class="img-fluid rounded-circle mb-5"
								src="./Resource/mms/img/media.png" alt="">
							</a>
							<h3>
								<a href="login.jsp" class="alert-link">미디어</a>
							</h3>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="testimonial-item mx-auto mb-5 mb-lg-0">
							<a href="login.jsp"> <img
								class="img-fluid rounded-circle mb-5"
								src="./Resource/mms/img/plus.png" alt="">
							</a>
							<h3>
								<a href="login.jsp" class="alert-link">기타</a>
							</h3>
						</div>
					</div>
				</div>
			</div>
		</section>
	</section>


	<%@include file="./include/footer.jsp"%>


   <!-- Bootstrap core JavaScript -->
   <script src="./Resource/mms/vendor/jquery/jquery.min.js"></script>
   <script src="./Resource/mms/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>