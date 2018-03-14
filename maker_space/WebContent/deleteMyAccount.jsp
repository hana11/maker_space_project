<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<script>
$(document).ready(function(){
	//인증코드를 메일로 발송하고 코드를 저장
	$("#auth").click(function() {
	   var email = $("#email").val();
	   if (email != "") {
	      $.ajax({
	         "url" : 'membercontroller',
	         "method" : 'post',
	         "data" : "email=" + email + "&action=confirmEmail",
	         success : function(data) {
	        	alert('Success send a code'); 
	            
	            $("#code")[0].value = data;
	            $("#auth").show();
	         }
	      })
	   } else {
	      alert('write your Email');
	   }
	});
})


</script>

<body>
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
			
			<!-- Table -->
			<div class="col-lg-9">
				<h1 class="my-4">&nbsp;</h1>
				

            <div class="card-body">
				<form method="post" action="membercontroller">
                  <div class="form-group">
                     
                     <div class="form-row">
                        <div class="col-md-6">
                           <label for="exampleInputName">이메일</label> 
  							<input class="form-control" name="email" type="email" placeholder="이메일을 입력해주세요"><br>
                        </div>
                     </div>
                     <div class="form-row">
                        <div class="col-md-6">
                           <label for="exampleInputPassword1">비밀번호</label> 
                            <input class="form-control" name="password" type="password" placeholder="비밀번호를 입력해주세요">
                        </div>
                     </div>
                  </div>
				</form>
				<div class="form-row">
					<div class="col-md-7">
						<input type="hidden" name="action" value="removeMember">
						<button type="submit" class="btn btn-block btn-lg btn-primary">삭제</button>
					</div>

				</div>
            </div>
				
			</div>
         </div>
         </div>
         <%@include file="./include/footer.jsp" %>
</body>
</html>