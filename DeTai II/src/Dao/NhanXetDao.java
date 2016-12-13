package Dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import Connection.DBConn;
import Model.NhanXet;

public class NhanXetDao {
	public boolean UpdateNhanXet(NhanXet nx) {
		Connection connection = DBConn.getConnection();
		String sql = "UPDATE nhanxet SET TenDeTai = ?, TenGV=?, NhanXet=?, BaoCao=?, XepLoai=? WHERE MaDeTai= ? and MaGV=?";

		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setString(1, nx.getTenDeTai());
			ps.setNString(2, nx.getTenGV());
			ps.setNString(3, nx.getNhanXet());
			ps.setNString(4, nx.getBaoCao());
			ps.setNString(5, nx.getXepLoai());
			ps.setLong(6, nx.getMaDeTai());
			ps.setLong(7, nx.getMaGV());

			ps.executeUpdate();
			return true;
		} catch (SQLException ex) {
			Logger.getLogger(NhanXetDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return false;
	}
	public boolean InsertNhanXet(NhanXet nx) {
		Connection connection = DBConn.getConnection();
		String sql = "INSERT INTO nhanxet(MaDeTai,TenDetai,MaGV,ChucVu) VALUES(?,?,?,?)";

		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setLong(1, nx.getMaDeTai());
			ps.setString(2, nx.getTenDeTai());
			ps.setLong(3, nx.getMaGV());
			ps.setNString(4, nx.getChucVu());	            

			ps.executeUpdate();
			return true;
		} catch (SQLException ex) {
			Logger.getLogger(NhanXetDao.class.getName()).log(Level.SEVERE, null, ex);
			return false;
		}
	}
	public boolean deleteNhanXet(NhanXet nx)
	{
		Connection connection = DBConn.getConnection();
		String sql = "delete from nhanxet where MaDeTai=?";

		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setLong(1, nx.getMaDeTai());	            

			ps.executeUpdate();
			return true;
		} catch (SQLException ex) {
			Logger.getLogger(NhanXetDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return false;
	}

}
