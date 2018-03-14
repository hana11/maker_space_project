<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
    
<%@ page import="work.model.dto.Member" %>
<%@ page import="work.util.MyUtility" %>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
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

 <%
      String CONTEXT_PATH = application.getContextPath();
   %>
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
				<%
	Member dto = (Member)request.getAttribute("dto");
%>
			<!-- Table -->
			<div class="col-lg-9">
				<h1 class="my-4">&nbsp;</h1>
		
			<div class="card-body">
				<form action="<%= CONTEXT_PATH %>/search.jsp">
					<div class="form-group">
						<div class="form-row">
							<div class="col-md-6">
								<label for="exampleInputName">Name</label>
								<ol class="breadcrumb">
									<%= dto.getName() %>
								</ol>
							</div>
							<div class="col-md-6">
								<label for="exampleInputPassword1">Password</label>
								<ol class="breadcrumb">
									<%
                            String secureMemberPw = MyUtility.convertSecureString(dto.getPassword());
                            %>
									<%= secureMemberPw %>
								</ol>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-6">
								<label for="exampleInputMobile">Phone Number</label>
								<ol class="breadcrumb">
									<%= dto.getMobile() %>
								</ol>
							</div>
							<div class="col-md-6">
								<label for="exampleInputEmail1">Email address</label>
								<ol class="breadcrumb">
									<%= dto.getEmail()%>
								</ol>
							</div>
						</div>

						<div class="form-row">
							<div class="col-md-6">
								<label for="exampleInputCompany">Company</label>
								<ol class="breadcrumb">
									<%= dto.getCompany() %>
								</ol>
							</div>
							<div class="col-md-6">
								<label for="exampleInputCompany">Point</label>
								<ol class="breadcrumb">
									<%= dto.getPoint()%>
								</ol>
							</div>
						</div>

						<div class="form-row">
							<div class="col-md-6">
								<label for="exampleInputCompany">Grade</label>
								<ol class="breadcrumb">
									<%= dto.getGrade() %>
								</ol>
							</div>
						</div>
					</div>
					
				</form>
			</div>
		</div>
	</div>
</div>

	<!-- footer -->
	<%@include file="./include/footer.jsp" %>
	<!-- ./footer -->

   <!-- Bootstrap core JavaScript -->
   <script src="./Resource/mms/vendor/jquery/jquery.min.js"></script>
   <script src="./Resource/mms/vendor/jquery/jquery.slim.min.js"></script>
   <script
      src="./Resource/mms/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   <script src="./Resource/mms/vendor/bootstrap/js/bootstrap.min.js"></script>

</body>

</html>