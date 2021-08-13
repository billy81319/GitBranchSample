<%@page import="connection.DBconnection"%>
<%@page import="model.*"%>
<%@page import="dao.ProductDao" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null) {
		request.setAttribute("auth", auth);
	}
	
ProductDao pd = new ProductDao(DBconnection.getConnetion());
List<Product> products = pd.getAllProduct();
%>
<!DOCTYPE html>
<html>
<head>
<title>Åwªï BELOVED°Ó«°</title>
<%@include file="includes/head.jsp"%>

</head>
<body>

	<%@include file="includes/navbar.jsp"%>
	<div class="container">
		<div class="card-header my -3">All Products</div>
		<div class="row">
		<%
			if(!products.isEmpty()){
				for(Product p:products){%>
				<div class="col-md-3 my-3">
				<div class="card w-100" style="width: 18rem;">
				<img alt="Card image cap" src="<%=p.getImages()%>" class="card-omg-top" width="200" height="200">
				<div class="card-body">
					<h5 class="card-title"><%= p.getName() %></h5>
					<h6 class="price">$<%=p.getPrice() %></h6>
					<h6 class="category">Category: <%=p.getCategory()%></h6>
					<div class="mt-3 d-flex justify-content-between"></div>
					<a href="Add-to-Cart?id=<%=p.getId()%>" class="btn btn-dark">Add to Cart</a> <a href="#"
						class="btn btn-primary">Buy Now</a>
				</div>
			</div>
		</div>
					
				<%}
			}
		
		%>
			

		</div>
	</div>

	<%@include file="includes/footer.jsp"%>
</body>
</html>