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
  <title>Login</title>
  <!-- Bootstrap core CSS-->
  <link href="./Resource/mms/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="./Resource/mms/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="./Resource/mms/css/sb-admin.css" rel="stylesheet">
</head>

<body class="bg-dark">
  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Login</div>
      <div class="card-body">
        <form method = "post" action = "member_controller">
          <div class="form-group">
            <label for="exampleInputEmail1">Email address</label>
            <input class="form-control" name="email" type="email" aria-describedby="emailHelp" placeholder="Enter email">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Password</label>
            <input class="form-control" name="password" type="password" placeholder="Password">
          </div>
          
          <a class="btn btn-primary btn-block" href="index.jsp">Login</a>
        	<div class="text-center">
           <input type="hidden" name="action" value ="login">
           <button type ="submit" class="btn btn-primary btn-sm">Login</button>
           <a class="d-block small mt-3" href="register.jsp">Register an Account</a>
           <a class="d-block small" href="forgot_password.jsp">Forgot Password?</a>
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