package base;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.DBConn;

public class GetOrder {
	
	public String getOrder() {
		String sql="select orderid from cart order by id DESC limit 1;";
		
		try {
			Connection connection=DBConn.getConnection();
			Statement statement=connection.createStatement();
			ResultSet resultSet=statement.executeQuery(sql);
			while(resultSet.next()) {
				return resultSet.getString("orderid");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return null;
	}
	

}
