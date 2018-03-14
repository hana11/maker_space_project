<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>회원가입</title>
<!-- Bootstrap core CSS-->
<link href="./Resource/mms/vendor/bootstrap/css/bootstrap2.min.css"
	rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="./Resource/mms/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- Custom styles for this template-->
<link href="./Resource/mms/css/sb-admin.css" rel="stylesheet">
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
<body class="bg-dark">
	<div class="container">
		<div class="card card-register mx-auto mt-5">
			<div class="card-header">
				회원가입
				<button type="button" class="close" aria-label="Close"
					onclick="javascript:history.back()">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="card-body">
				<form method="post" action="membercontroller">
					<div class="form-group">
						<div class="form-row">
							<div class="col-md-6">
								<label for="exampleInputName">이름</label> <input
									class="form-control" name="name" type="text"
									aria-describedby="nameHelp" placeholder="이름을 입력해주세요">
							</div>
							<div class="col-md-6">
								<label for="exampleInputLastName">핸드폰 번호</label> <input
									class="form-control" name="mobile" type="text"
									aria-describedby="nameHelp" placeholder="핸드폰번호를 입력해주세요">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="form-row">
							<div class="col-md-8">
								<label for="exampleInputEmail1">이메일 </label> 
								<input class="form-control" name="email" type="email" id='email' aria-describedby="emailHelp" placeholder="이메일을 입력해주세요">
							</div>
							<div class = "col-md-4">
								<label for="exampleInputEmail1">&nbsp;</label>
								<input class="btn btn-primary btn-block" type="button" class='btn' id='auth' value='인증번호 발송'>
							</div>
							<div class="col-md-6">
							<br>
								<label for="confirmedEmailCode">인증번호</label> 
								<input class="form-control" name="code" type="text" Placeholder="인증번호를 입력해주세요">
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="form-row">
							<div class="col-md-6">
								<label for="exampleInputPassword1">비밀번호</label> <input
									class="form-control" name="password" type="password"
									placeholder="비밀번호를 입력해주세요(6자리 이상)">
							</div>
							<div class="col-md-6">
								<label for="exampleConfirmPassword">비밀번호 확인</label> <input
									class="form-control" name="confirmPassword" type="password"
									placeholder="비밀번호를 다시한번 입력해주세요">
							</div>
						</div>
					</div>

					<div class="form-group">
						<div class="form-row">
							<div class="col-md-6">
								<label for="exampleInputPassword1">소속</label> 
								<input class="form-control" name="company" type="text" placeholder="소속 회사를 입력해주세요">
							</div>
						</div>
					</div>


					<div class="text-center">
						<input type="hidden" name="action" value="join">
						<button type="submit" class="btn btn-primary btn-block">회원가입</button>

						<a class="d-block small mt-3" href="login.jsp">로그인</a> <a
							class="d-block small" href="forgot_password.jsp">비밀번호 찾기</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script src="./Resource/mms/vendor/jquery/jquery.min.js"></script>
	<script
		src="./Resource/mms/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script src="./Resource/mms/vendor/jquery-easing/jquery.easing.min.js"></script>
</body>

</html>