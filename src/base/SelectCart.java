package base;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.sun.org.apache.bcel.internal.generic.NEW;

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
	
	
	//查询已支付的订单
		public JSONArray getCompld(String userid) {
			JSONArray jsonArray=new JSONArray();  
			String sql="select * from compld where userid='"+userid+"'";
			
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
		String sql="select * from cart where orderid='"+orderid+"'";
		
		try {
			Connection connection=DBConn.getConnection();
			Statement statement= connection.createStatement();
			ResultSet resultSet=statement.executeQuery(sql);
			System.out.println(sql);
			if(resultSet.next()) {
				String userid=resultSet.getString("userid");
				String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS").format(new Date());
				String sku_no=resultSet.getString("sku_no");
				int count=resultSet.getInt("count");
				String name=resultSet.getString("name");
				String insql="insert into paid(userid,date,sku_no,count,name,orderid) values('"+userid+"','"+date+"','"+sku_no+"','"+count+"','"+name+"','"+orderid+"')";
				int res=statement.executeUpdate(insql);
				System.out.println(insql);
				if (res>0) {
					System.out.println("插入了数据");
					int reDelect=statement.executeUpdate("delete from cart where orderid='"+orderid+"'");
					if (reDelect>0) {
						System.out.println("结算成功");
						return "success";
					}
				}
			}
			connection.close();
			statement.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "faild";
	}
	
	
	//完成订单
		public String comPld(String orderid) {
			String sql="select * from paid where orderid='"+orderid+"'";
			
			try {
				Connection connection=DBConn.getConnection();
				Statement statement= connection.createStatement();
				ResultSet resultSet=statement.executeQuery(sql);
				System.out.println(sql);
				if(resultSet.next()) {
					String userid=resultSet.getString("userid");
					String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS").format(new Date());
					String sku_no=resultSet.getString("sku_no");
					int count=resultSet.getInt("count");
					String name=resultSet.getString("name");
					String insql="insert into compld(userid,date,sku_no,count,name,orderid) values('"+userid+"','"+date+"','"+sku_no+"','"+count+"','"+name+"','"+orderid+"')";
					int res=statement.executeUpdate(insql);
					System.out.println(insql);
					if (res>0) {
						System.out.println("插入了数据");
						int reDelect=statement.executeUpdate("delete from paid where orderid='"+orderid+"'");
						if (reDelect>0) {
							System.out.println("结算成功");
							return "success";
						}
					}
				}
				connection.close();
				statement.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return "faild";
		}
		
		public String delectOrder(String orderid) {
			
			try {
				Connection connection=DBConn.getConnection();
				Statement statement=connection.createStatement();
				int reDelect=statement.executeUpdate("delete from compld where orderid='"+orderid+"'");
				if (reDelect>0) {
					System.out.println("删除成功");
					return "success";
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return "faild";
		}
	

}
