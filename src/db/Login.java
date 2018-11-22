package db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Login {
	String username,password,prepassword;

	public String getPrepassword() {
		return prepassword;
	}

	public void setPrepassword(String prepassword) {
		this.prepassword = prepassword;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Login [username=" + username + ", password=" + password + ", prepassword=" + prepassword + "]";
	}
	
	public String login() {
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
	
	public String reister() {
		
		try {
			Connection connection=DBConn.getConnection();
			Statement statement= connection.createStatement();
			int resultSet=statement.executeUpdate("insert into user_login(userid,password,user_type) values('"+username+"','"+password+"',0)");
			if (resultSet>0) {
				return "success";
			}
			connection.close();
			statement.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "faild";
	}
	
}
