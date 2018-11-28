package base;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.sun.org.apache.bcel.internal.generic.NEW;

import db.DBConn;

public class AddCart {
	String userid;
	String name;
	String skuno;
	int count;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSkuno() {
		return skuno;
	}
	public void setSkuno(String skuno) {
		this.skuno = skuno;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "AddCart [userid=" + userid + ", name=" + name + ", skuno=" + skuno + ", count=" + count + "]";
	}
	
	public String addCart() {
		
		SimpleDateFormat sFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS");
		String date=sFormat.format(new Date());
		
		SimpleDateFormat sFt=new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String orderid=sFt.format(new Date());
		String sql="insert into cart(userid,date,sku_no,count,name,orderid) values('"+userid+"','"+date+"','"+skuno+"','"+count+"','"+name+"','"+orderid+"')";
		
		try {
			Connection connection=DBConn.getConnection();
			Statement statement= connection.createStatement();
			int resultSet=statement.executeUpdate(sql);
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
