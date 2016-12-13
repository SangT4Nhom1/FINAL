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
import Dao.GiaoVienDao;
import Dao.SinhVienDao;
import Model.GiaoVien;
import Model.SinhVien;

@WebServlet("/ThongTinServlet")
public class ThongTinServlet extends HttpServlet {
	GiaoVienDao gvdao=new GiaoVienDao();
	SinhVienDao svdao=new SinhVienDao();
	private static final long serialVersionUID = 1L;

	public ThongTinServlet() {
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
		String Id_TK = request.getParameter("id_tk");
		String Quyen = request.getParameter("quyen");

		if(command.equals("updatesinhvien")==true)
		{
			try{
				svdao.updateSinhVien(new SinhVien(Long.parseLong(Id_TK),request.getParameter("SDT"),
						request.getParameter("Email"),request.getParameter("DiaChi")));
				url = "/SV_home.jsp";
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		else 
			if(command.equals("updategiaovien")==true)
			{
				try{
					gvdao.updateGiaoVien(new GiaoVien(Long.parseLong(Id_TK),request.getParameter("SDT"),request.getParameter("Email"),request.getParameter("DiaChi")));
					if(Quyen.equals("gv")==true)
						url = "/GV_home.jsp";
					else
						if(Quyen.equals("tk")==true)
							url = "/TruongKhoa_Home.jsp";
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
