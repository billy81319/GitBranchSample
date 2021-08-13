package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import connection.DBconnection;
import dao.UserDao;
import model.User;


@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp"); 
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
		response.setContentType("text/html; charset=Big5");
		PrintWriter out = response.getWriter();
		String email = request.getParameter("login-email");
		String password = request.getParameter("login-password");
		
		try {
			UserDao udao = new UserDao(DBconnection.getConnetion());
			User user = udao.userLogin(email, password);
			
			if(user != null) {
				out.print("user login");
				request.getSession().setAttribute("auth",user);
				response.sendRedirect("index.jsp");
			}else {
				out.print("user login failed");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		
		
	}

}
