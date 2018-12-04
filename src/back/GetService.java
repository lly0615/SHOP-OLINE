package back;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import db.DBConn;

public class GetService {
	public JSONArray getInfo() {
		JSONArray jsonArray=new JSONArray();
		try {
			Connection connection=DBConn.getConnection();
			Statement statement=connection.createStatement();
			String sql="select * from paid";
			ResultSet resultSet=statement.executeQuery(sql);
			ResultSetMetaData resultSetMetaData=resultSet.getMetaData();
			while(resultSet.next()) {
				JSONObject jsonObject=new JSONObject();
				for(int i=1;i<resultSetMetaData.getColumnCount()+1;i++) {
					jsonObject.put(resultSetMetaData.getColumnName(i), resultSet.getString(i));
				}
				jsonArray.put(jsonObject);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return jsonArray;
	}
}
