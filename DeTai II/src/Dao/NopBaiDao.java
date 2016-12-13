package Dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import Connection.DBConn;
import Model.NopBai;

public class NopBaiDao {
	public boolean InsertNopBai(NopBai nb) {
		Connection connection = DBConn.getConnection();
		String sql = "INSERT INTO bainop(MaDeTai,TenDetai,MaSV,TenSV,TenGVHD,TomTat,File) VALUES(?,?,?,?,?,?,?)";

		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setLong(1, nb.getMaDeTai());
			ps.setNString(2, nb.getTenDeTai());
			ps.setLong(3, nb.getMSSV());
			ps.setString(4, nb.getTenSV());
			ps.setString(5, nb.getTenGV());
			ps.setString(6, nb.getTomTat());
			ps.setBytes(7, nb.getFile());
			
			ps.executeUpdate();
			return true;
		} catch (SQLException ex) {
			Logger.getLogger(NopBaiDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return false;
	}	
}
