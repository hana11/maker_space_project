<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Register</title>
  <!-- Bootstrap core CSS-->
  <link href="./Resource/mms/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="./Resource/mms/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="./Resource/mms/css/sb-admin.css" rel="stylesheet">
</head>

<body class="bg-dark">
  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">Register an Account</div>
      <div class="card-body">
        <form method ="post" action ="member/controller">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputName">Name</label>
                <input class="form-control" name ="name" type="text" aria-describedby="nameHelp" placeholder="Enter name">
              </div>
              <div class="col-md-6">
                <label for="exampleInputLastName">Phone Number</label>
                <input class="form-control" name="mobile" type="text" aria-describedby="nameHelp" placeholder="Enter phone number">
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-8">
                <label for="exampleInputEmail1">Email address</label>
                <input class="form-control" name="email" type="email" aria-describedby="emailHelp" placeholder="Enter email">

              </div>
              <div class="col-md-4">
                <label for="exampleInputEmail1">&nbsp;</label><br>
                <button type="button" class="btn btn-primary btn-sm">중복확인</button>

              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputPassword1">Password</label>
                <input class="form-control" name="password" type="password" placeholder="Password">
              </div>
              <div class="col-md-6">
                <label for="exampleConfirmPassword">Confirm password</label>
                <input class="form-control" name="confirmPassword" type="password" placeholder="Confirm password">
              </div>
            </div>
          </div>
          <input type="hidden" name="action" value ="join">
          <input type="submit" value ="회원가입"> 
          <a class="btn btn-primary btn-block" type ="submit" href="login.jsp">Register</a>
       
        <div class="text-center">
          <a class="d-block small mt-3" href="login.jsp">Login Page</a>
          <a class="d-block small" href="forgot-password.jsp">Forgot Password?</a>
        </div>
         </form>
      </div>
    </div>
  </div>
  <!-- Bootstrap core JavaScript-->
  <script src="./Resource/mms/vendor/jquery/jquery.min.js"></script>
  <script src="./Resource/mms/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="./Resource/mms/vendor/jquery-easing/jquery.easing.min.js"></script>
</body>

</html>