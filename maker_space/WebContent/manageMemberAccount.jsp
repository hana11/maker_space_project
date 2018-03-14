<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="work.model.dto.Member"%>
<%@ page import="work.util.MyUtility"%>
<%@ page import="java.util.ArrayList"%>
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
			ArrayList<Member> members = (ArrayList<Member>) request.getAttribute("members");
			System.out.println("\n## members : " + members);
		%>
			
			<!-- Table -->
			<div class="col-lg-9">
				<h1 class="my-4">&nbsp;</h1>
			
			<div class="container">
				<ol class="breadcrumb">
					<li class="breadcrumb-item">회원 관리</li>
					<li class="breadcrumb-item active">정보 수정 & 삭제</li>
				</ol>

			</div>
			<div class="container">
				<table class="table table-hover" style="border: solid 2px #cccccc">
					<thead>
						<tr class="table-active">
							<th scope="col">소속</th>
							<th scope="col">이름</th>
							<th scope="col">이메일</th>
							<th scope="col">회원등급</th>
							<th scope="col">회원탈퇴</th>
						</tr>
					</thead>
					<%
						Member dto = null;
						for (int index = 0; index < members.size(); index++) {
							dto = members.get(index);
					%>

					<tbody>
						<tr>
							<!-- 이름 클릭시 해당 회원 상세조회 -->
							
							<td><%=dto.getCompany()%></td>
							<td><%=dto.getName()%></td>
							<td><a
								href="membercontroller?action=getInfoByAdmin&email=<%=dto.getEmail()%>"><%=dto.getEmail()%>
							</a></td>
							<td><%= dto.getGrade() %></td>
							<td>
							
							<a href="membercontroller?action=removeMemberByAdmin&email=<%= dto.getEmail() %>">탈퇴 </a>
							</td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
			
		
		</div>
		</div>		
			
			
			
		<!-- / Table -->

		<!-- Search bar -->
		
<!-- /.Search -->

<%@ include file="./include/footer.jsp"%>

<!-- Bootstrap core JavaScript -->
<script src="./Resource/mms/vendor/jquery/jquery.min.js"></script>
<script src="./Resource/mms/vendor/jquery/jquery.slim.min.js"></script>
<script src="./Resource/mms/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="./Resource/mms/vendor/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>