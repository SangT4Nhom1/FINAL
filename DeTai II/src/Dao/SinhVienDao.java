package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import Connection.DBConn;
import Model.SinhVien;

public class SinhVienDao {
	Connection connection = DBConn.getConnection();
	public boolean updateSinhVien(SinhVien sv) throws SQLException
	{
		try{
			String sql="update sinhvien set SDT=?, Email=?, DiaChi=? where MSSV=?";
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setNString(1, sv.getSDT());
			ps.setNString(2, sv.getEmail());
			ps.setNString(3, sv.getDiaChi());
			ps.setLong(4, sv.getMSSV());

			int temp = ps.executeUpdate();
			return temp == 1;
		}
		catch(Exception e)
		{
			return false;
		}

	}

}
