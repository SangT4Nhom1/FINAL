package Dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import Connection.DBConn;
import Model.Diem;

public class DiemDao {
	public boolean InsertNhanXet(Diem diem) {
		Connection connection = DBConn.getConnection();
		String sql = "INSERT INTO diem(MaDeTai,MaGV,Diem) VALUES(?,?,?)";

		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setLong(1, diem.getMaDeTai());
			ps.setLong(2,diem.getMaGV() );
			ps.setLong(3,diem.getDiem() );

			ps.executeUpdate();
			return true;
		} catch (SQLException ex) {
			Logger.getLogger(DiemDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return false;
	}

}
