package connection;

import java.sql.*;


public class DBconnection {
	private static Connection connection = null;
	public static final String theURL = 
			"jdbc:mysql://localhost:3306/BELOVED?serverTimezone=Asia/Taipei";
	
	public static Connection getConnetion() throws ClassNotFoundException, SQLException {
		if(connection == null) {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(theURL,"David","123456");
			System.out.println("connected");
		}
		return connection;
	}

}
