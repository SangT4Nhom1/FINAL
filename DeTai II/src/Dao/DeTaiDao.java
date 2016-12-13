package Dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import Connection.DBConn;
import Model.DeTai;

public class DeTaiDao {

	public boolean UpdateNhanXet(DeTai dt) {
		Connection connection = DBConn.getConnection();
		String sql = "UPDATE detai SET NgayBaoCao = ?, GioBaoCao=?, ThoiLuongBaoCao=? WHERE MaDeTai= ? ";

		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setString(1, dt.getNgayBaoCao());
			ps.setNString(2, dt.getGioBaoCao());
			ps.setNString(3, dt.getThoiLuongBaoCao());
			ps.setLong(4, dt.getMaDeTai());

			ps.executeUpdate();
			return true;
		} catch (SQLException ex) {
			Logger.getLogger(NhanXetDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return false;
	}
}
