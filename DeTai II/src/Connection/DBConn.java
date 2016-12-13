package Connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {

	public static Connection getConnection(){
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/detai?useUnicode=true&characterEncoding=UTF-8", "root", "inspiron14");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	public static void main(String[] args) {
		System.out.println(getConnection());
	}

}
