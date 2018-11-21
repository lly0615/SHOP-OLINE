package base;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import org.json.JSONException;
import org.json.JSONObject;

import db.DBConn;

public class Details {
	public JSONObject getShopInfo(int skuno) {
		JSONObject jsonObject=new JSONObject();
		try {
			Connection connection=DBConn.getConnection();
			Statement statement=connection.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from sku_shop where spu_no='"+skuno+"'");
			ResultSetMetaData resultSetMetaData=resultSet.getMetaData();
			while(resultSet.next()) {
				for(int i=1;i<resultSetMetaData.getColumnCount()+1;i++) {
					jsonObject.put(resultSetMetaData.getColumnName(i), resultSet.getString(i));
				}
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
		
		return jsonObject;
	}
	
	public JSONObject getImg(int skuno) {
		JSONObject jsonObject=new JSONObject();
		try {
			Connection connection1=DBConn.getConnection();
			Statement statement1 = connection1.createStatement();
			ResultSet resultSet1 = statement1.executeQuery("select * from sku_shop where spu_no='"+skuno+"'");
			while(resultSet1.next()) {
				JSONObject mainimg=new JSONObject();
				mainimg.put("orig", "images/"+resultSet1.getString("main_img"));
				mainimg.put("main", "images/"+resultSet1.getString("main_img"));
				mainimg.put("thumb", "images/"+resultSet1.getString("main_img"));
				
				JSONObject first=new JSONObject();
				first.put("main", mainimg);
				
				JSONObject gallery=new JSONObject();
				JSONObject item=new JSONObject();
				String urlPath=resultSet1.getString("img_path");
				String imgpath[]=urlPath.split("#");
				for(int i=0;i<imgpath.length;i++) {
					item.put("orig", "images/"+imgpath[i]);
					item.put("main", "images/"+imgpath[i]);
					item.put("thumb", "images/"+imgpath[i]);
					gallery.put("item_"+i, item);
				}
				System.out.println(gallery);
				first.put("gallery", gallery);
				System.out.println(first.toString());
				first.put("type", "simple");
				first.put("video", false);
				jsonObject.put("prod_1", first);
				System.out.println(jsonObject.toString());
			}
			connection1.close();
			statement1.close();
			resultSet1.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return jsonObject;
	}
	
}
