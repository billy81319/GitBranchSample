<%@page import="model.*"%>
<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
	<%
	  User auth = (User)request.getSession().getAttribute("auth");
	if(auth != null){
		response.sendRedirect("index.jsp");
	}
	%>
<!DOCTYPE html>
<html>
<head>
<title>Shopping Cart login</title>
<%@include file="includes/head.jsp"%>

</head>
<body>
<%@include file="includes/navbar.jsp"%>
	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">使用者登入</div>
			<div class="card-body">
				<form action="user-login" method="post"> <!-- action => LoginServlet-->
				
					<div class="form-group">
						<label>Email Address</label>
						<input class="email"
							class="form-control" name="login-email"
							placeholder="Enter your Email" required>
					</div>
					<div class="form-group">
						<label>Password</label>
						<input type="password" class="password"
							class="form-control" name="login-password"
							placeholder="Enter your Password" required>
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Login</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<%@include file="includes/footer.jsp"%>
</body>
</html>