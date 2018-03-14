<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>MakerSpace</title>

<link rel="stylesheet" href="./Resource/mms/vendor/bootstrap/css/my.css" />
<!-- Bootstrap core CSS -->
<link href="./Resource/mms/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Bootstrap side-bar menu -->
<link href="./Resource/mms/vendor/bootstrap/css/shop-homepage.css"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="./Resource/mms/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="./Resource/mms/vendor/simple-line-icons/css/simple-line-icons.css"
	rel="stylesheet" type="text/css">
<link href="./Resource/mms/vendor/simple-line-icons/css/my.css"
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

<style>
.a {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.writeBtnLoca {
	text-algin: right;
}

.floatRight {
	float: right;
}
</style>
</head>
<body>
	<%
		String CONTEXT_PATH = application.getContextPath();
	%>
	<!-- Navigation -->
 <!-- Navigation -->
	
	<%@include file="./include/topMenu.jsp"%>
   <!-- Page Content -->
   <div class="container">
      <div class="row">
         <!-- Side Menu -->
         <div class="col-lg-3">
           <h1 class="my-4">&nbsp;</h1>
            <%@include file="./include/sideMenu.jsp"%>
         </div>
			
			<!-- Table -->
			<div class="col-lg-9">
				

				<!-- Table -->
				<label for="exampleInputEmail1">&nbsp;</label> <br> <label
					for="exampleInputEmail1">&nbsp;</label> <br> <label
					for="exampleInputEmail1">&nbsp;</label> <br>
				<div class="container">
					<ol class="breadcrumb">
						<li class="breadcrumb-item">팁</li>
						
					</ol>
				</div>

				<div class="container">
					<!-- writed form -->

					<div class="container">
						<fieldset>
							<div class="floatRight">
							<form method="post" action="tipboardcontroller">
							<input
							type="hidden" name="category" value="scrap">
								<input type="hidden" name="tipBoardsIdx"
									value=<%=request.getAttribute("tipBoardsIdx")%>> <input
									type="hidden" name="action" value="scrap"><input
									type="submit" class="btn btn-block-lg btn-lg btn-primary"
									style="display: inline-block;" value="스크랩 " />
							</form>
							</div>
							<div class="form-group">
								<label for="exampleSelect1">제목</label> <input type="text"
									readonly="readonly" class="form-control" name="title"
									value=<%=request.getAttribute("title")%>>
							</div>
							<div class="form-group">
								<label for="exampleSelect1">해시태그</label> <input type="text"
									readonly="readonly" class="form-control" name="hash_tag"
									value=<%=request.getAttribute("hashTag")%>>
							</div>
							<div class="form-group">
								<label for="exampleTextarea">기대효과</label>
								<textarea class="form-control" name="result" rows="6"
									readonly="readonly"><%=request.getAttribute("title")%></textarea>
							</div>
							<div class="form-group">
								<label for="exampleTextarea">내용</label>
								<textarea class="form-control" name="content" rows="10"
									readonly="readonly"><%=request.getAttribute("content")%></textarea>
							</div>
							<div class="form-group">
								<label for="exampleInputFile">첨부파일</label> <input type="file"
									class="form-control-file" name="file" readonly="readonly"
									aria-describedby="fileHelp"> <small id="fileHelp"
									class="form-text text-muted">File max capacity</small>
							</div>
						</fieldset>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="./include/footer.jsp"%>
	<!-- Bootstrap core JavaScript -->
	<script src="./Resource/mms/vendor/jquery/jquery.min.js"></script>
	<script src="./Resource/mms/vendor/jquery/jquery.slim.min.js"></script>
	<script
		src="./Resource/mms/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="./Resource/mms/vendor/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>