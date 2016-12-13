package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import Connection.DBConn;
import Model.GiaoVien;

public class GiaoVienDao {
	Connection connection = DBConn.getConnection();
	public boolean updateGiaoVien(GiaoVien gv) 
	{
		try{
			String sql="update giaovien set SDT=?, Email=?, DiaChi=? where MSGV=?";
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setNString(1, gv.getSDT());
			ps.setNString(2, gv.getEmail());
			ps.setNString(3, gv.getDiaChi());
			ps.setLong(4, gv.getMSGV());

			int temp = ps.executeUpdate();
			return temp == 1;
		}
		catch(Exception e)
		{
			return false;
		}

	}

}
