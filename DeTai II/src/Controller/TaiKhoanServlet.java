package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Connection.DBConn;
import Dao.TaiKhoanDao;
import Model.TaiKhoan;


@WebServlet("/loginServelet")
public class TaiKhoanServlet extends HttpServlet {

	TaiKhoanDao tkdao=new TaiKhoanDao();

	private static final long serialVersionUID = 1L;

	public TaiKhoanServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
		rd.include(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String command = request.getParameter("command");
		String url = "";

		Connection connection = DBConn.getConnection();
		PreparedStatement stmt;
		ResultSet rs;
		TaiKhoan tk = new TaiKhoan();
		HttpSession session = request.getSession();
		String sql = "select * from taikhoan where Id_TK=? and Pass=?";
		if(command.equals("login")==true)
		{
			String id = request.getParameter("id_tk"); 
			String Pass = request.getParameter("pass");

			try {
				stmt = connection.prepareStatement(sql);
				stmt.setString(1, id);
				stmt.setString(2, Pass);
				rs = stmt.executeQuery();
				if (rs.next()) {
					String quyen = rs.getString("Quyen");

					tk.setId_TK(rs.getLong("ID_TK"));
					tk.setPass(rs.getNString("Pass"));
					tk.setQuyen(rs.getNString("Quyen"));

					session.setAttribute("tk", tk);
					if (quyen.equals("tk")==true) {
						url = "/TruongKhoa_Home.jsp";
					}
					else{
						if(quyen.equals("gv")==true){
							url = "/GV_home.jsp";	
						}
						else{
							url = "/SV_home.jsp";	
						}
					}
				}
				else {
					url = "/index.jsp";
				}
			} // end try

			catch (Exception e) {
				e.printStackTrace();
			}
		}
		else
			if(command.equals("logout")==true)
			{
				session.invalidate();
				url="/index.jsp";
			}
			else
				if(command.equals("changepass")==true)
				{
					String Id_TK = request.getParameter("id_tk");
					String passold = request.getParameter("passold");
					String Quyen = request.getParameter("quyen");

					String passnhap = request.getParameter("passold2");
					String passnew = request.getParameter("passnew");
					String passre = request.getParameter("passnew2");
					if(passold.equals(passnhap)==true)
					{
						if(passnew.equals(passre)==true)
						{
							try{
								tkdao.changepassword(new TaiKhoan(Long.parseLong(Id_TK), request.getParameter("passnew")));
								if(Quyen.equals("sv")==true)
									url = "/SV_home.jsp";
								else
									if(Quyen.equals("gv")==true)
										url = "/GV_home.jsp";
									else
										if(Quyen.equals("tk")==true)
											url = "/TruongKhoa_Home.jsp";
							}
							catch(SQLException e)
							{
								e.printStackTrace();
							}
						}
						else
						{
							request.setAttribute("khongtrungmk", "Mật khẩu nhập không khớp");
							if(Quyen.equals("sv")==true)
								url = "/SVDoiMK.jsp";
							else
								if(Quyen.equals("gv")==true)
									url = "/GV_Doi_MK.jsp";
								else
									if(Quyen.equals("tk")==true)
										url = "/TruongKhoa_Doi_MK.jsp";
						}

					}
					else
					{
						request.setAttribute("saimk", "Mật khẩu không đúng");
						if(Quyen.equals("sv")==true)
							url = "/SVDoiMK.jsp";
						else
							if(Quyen.equals("gv")==true)
								url = "/GV_Doi_MK.jsp";
							else
								if(Quyen.equals("tk")==true)
									url = "/TruongKhoa_Doi_MK.jsp";
					}

				}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
