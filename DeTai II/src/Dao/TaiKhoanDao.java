package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import Connection.DBConn;
import Model.TaiKhoan;


public class TaiKhoanDao {
	Connection connection = DBConn.getConnection();

	//Dang nhap
	public TaiKhoan login(long Id_TK, String Pass) {

		String sql = "select * from taikhoan where Id_TK='" + Id_TK+ "' and Pass='" + Pass + "'";

		PreparedStatement ps;
		try {
			ps = (PreparedStatement) connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				TaiKhoan tk = new TaiKhoan();
				tk.setId_TK(rs.getLong("Id_TK"));// khai bao trong csdl
				tk.setPass(rs.getNString("Pass"));
				tk.setQuyen(rs.getNString("Quyen"));

				connection.close();
				return tk;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	//hàm kiểm tra đổi password
	public boolean changepassword(TaiKhoan tk) throws SQLException {
		try {
			Connection connection = DBConn.getConnection();
			String sql = "UPDATE TaiKhoan SET Pass = ? WHERE Id_TK= ?";
			PreparedStatement ps = connection.prepareCall(sql);

			ps.setString(1, tk.getPass());
			ps.setLong(2, tk.getId_TK());

			int temp = ps.executeUpdate();
			return temp == 1;
		} catch (Exception e) {
			return false;
		}
	}
}
