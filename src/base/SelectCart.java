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

public class SelectCart {
	
	//实现购物车查询
	public JSONArray getCart(String userid) {
		JSONArray jsonArray=new JSONArray();  
		String sql="select * from cart where userid='"+userid+"'";
		
		try {
			Connection connection=DBConn.getConnection();
			Statement statement=connection.createStatement();
			ResultSet resultSet=statement.executeQuery(sql);
			ResultSetMetaData resultSetMetaData=resultSet.getMetaData();
			while(resultSet.next()) {
				JSONObject jsonObject=new JSONObject();
				for (int i = 1; i < resultSetMetaData.getColumnCount()+1; i++) {
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
	
	//查询已支付的订单
	public JSONArray getPaid(String userid) {
		JSONArray jsonArray=new JSONArray();  
		String sql="select * from paid where userid='"+userid+"'";
		
		try {
			Connection connection=DBConn.getConnection();
			Statement statement=connection.createStatement();
			ResultSet resultSet=statement.executeQuery(sql);
			ResultSetMetaData resultSetMetaData=resultSet.getMetaData();
			while(resultSet.next()) {
				JSONObject jsonObject=new JSONObject();
				for (int i = 1; i < resultSetMetaData.getColumnCount()+1; i++) {
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
	
	//计算商品的价格 
	public int cacuPrice(String skuno,int count) {
		String sql="select price from sku_shop where spu_no='"+skuno+"'";
		System.out.println(skuno+count);
		try {
			Connection connection=DBConn.getConnection();
			Statement statement= connection.createStatement();
			ResultSet resultSet=statement.executeQuery(sql);
			if (resultSet.next()) {
				int price=resultSet.getInt("price");
				return price*count;
			}
			connection.close();
			statement.close();
			resultSet.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 1;
	}
	
	
	//实现结算功能
	public String payFor(String orderid) {
		String sql="insert into paid (userid,date,sku_no,count,name,orderid) select userid,date,sku_no,count,name,orderid from cart where 'orderid'='"+orderid+"'";
		
		try {
			Connection connection=DBConn.getConnection();
			Statement statement= connection.createStatement();
			ResultSet resultSet=statement.executeQuery(sql);
			if(resultSet.next()) {
				ResultSet reDelect=statement.executeQuery("delete from cart where orderid='"+orderid+"'");
				if (reDelect.next()) {
					System.out.println("结算成功");
				}
				reDelect.close();
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
