package db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
	private static final String driver = "com.mysql.jdbc.Driver";
    private static final String url = "jdbc:mysql://localhost:3306/onlineshop?useUnicode=true&characterEncoding=UTF-8&?useSSL=true";
    private static final String user = "root";
    private static final String password = "1234";
    
    private static Boolean connectSQL = true;
    
    
    public static Connection getConnection(){
        Connection conn = null;
        try {
            //1 加载驱动程序
            Class.forName(driver);
            System.out.println("加载驱动程序成功");

            conn = DriverManager.getConnection(url, user, password);
          
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("加载驱动程序失败");
        }catch (SQLException e) {
            e.printStackTrace();
            connectSQL = false;
            System.out.println("数据库连接失败异常");
        }
        
        return conn;
    }
    
    //返回连接状态
    public static Boolean getConnectSQL(){
        return connectSQL;
    }
}
