<%@page import="connection.DBconnection"%>
<%@page import="model.*"%>
<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
	<%
	  User auth = (User)request.getSession().getAttribute("auth");
	if(auth != null){
		request.setAttribute("auth", auth);
	}
	%>
<!DOCTYPE html>
<html>
<head>
<title>Orders Page</title>
<%@include file="includes/head.jsp" %>

</head>
<body>
<%@include file="includes/navbar.jsp"%>

<%@include file="includes/footer.jsp" %>
</body>
</html>