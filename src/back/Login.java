package back;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.DBConn;

public class Login {

	public String login(String username,String password) {
		try {
			Connection connection=DBConn.getConnection();
			Statement statement=connection.createStatement();
			ResultSet resultSet=statement.executeQuery("select password from user_login where userid='"+username+"'");
			if (resultSet.next()) {
				String pa=resultSet.getString("password");
				if (pa.equals(password)) {
					return "success";
				}
			}
			connection.close();
			statement.close();
			resultSet.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "faild";
	}

}
