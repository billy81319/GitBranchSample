<%@page import="connection.DBconnection"%>
<%@page import="model.*"%>
<%@page import="dao.*"%>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if(cart_list != null){
	ProductDao pDao = new ProductDao(DBconnection.getConnetion());
	cartProduct = pDao.getCartProducts(cart_list);
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Cart Page</title>
<%@include file="includes/head.jsp"%>
<style type="text/css">
.table tbody td{
vartical-align:middle;
}
.btn-incre,.btn-decre{
box-shadow:none;
font-size:20px;
}
</style>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<div class="container">
		<div class="d-flex py-3">
			<h3>Total Price:$500</h3>
			<a class="mx-3 btn btn-primary" href="#">Check out</a>
		</div>
		<table class="table able-lougt">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td>Women Shoes</td>
					<td>Shoes</td>
					<td>$500</td>
				<td>
				<form action="" method="post" class="form-inline">
				<input type="hidden" name="id" value="1" class="form-input">
				<div class="form-group d-flex justify-content-between">
				<a class="btn btn-sm btn-incre" href=""><i class="fas fa-minus-square"></i></a>
				<input type="text" name="quantity" class="form-control" value="1" readonly>
				<a class="btn btn-sm btn-incre" href=""><i class="fa fa-plus-square"></i></a>
				</div>
				</form>
				</td>
				<td><a class="rm_button" href="">Remove</a></td>
				</tr>	
			</tbody>

		</table>
	</div>

	<%@include file="includes/footer.jsp"%>
</body>
</html>