package base;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import db.DBConn;

public class Shops {
	
	public JSONArray selectShops(int brandID) {
		JSONArray jsonArray=new JSONArray();
		try {
			Connection connection=DBConn.getConnection();
			Statement statement=connection.createStatement();
			ResultSet resultSet=statement.executeQuery("select * from sku_shop where brand_id='"+brandID+"'");
			ResultSetMetaData resultSetMetaData=resultSet.getMetaData();
			while(resultSet.next()) {
				JSONObject jsonObject=new JSONObject();
				for(int i=1;i<resultSetMetaData.getColumnCount()+1;i++) {
					jsonObject.put(resultSetMetaData.getColumnName(i), resultSet.getString(i));
				}
				jsonArray.put(jsonObject);
			}
			connection.close();
			statement.close();
			resultSet.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonArray;
	}
	
	public JSONArray selectIndexShops() {
		JSONArray jsonArray=new JSONArray();
		try {
			Connection connection=DBConn.getConnection();
			Statement statement=connection.createStatement();
			ResultSet resultSet=statement.executeQuery("select * from sku_shop limit 0,9");
			ResultSetMetaData resultSetMetaData=resultSet.getMetaData();
			while(resultSet.next()) {
				JSONObject jsonObject=new JSONObject();
				for(int i=1;i<resultSetMetaData.getColumnCount()+1;i++) {
					jsonObject.put(resultSetMetaData.getColumnName(i), resultSet.getString(i));
				}
				jsonArray.put(jsonObject);
			}
			connection.close();
			statement.close();
			resultSet.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(jsonArray);
		return jsonArray;
	}
	
}
