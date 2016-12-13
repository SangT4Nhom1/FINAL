package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.NhanXet;
import Model.DeTai;
import Dao.NhanXetDao;
import Dao.DeTaiDao;

@WebServlet("/SapXepServlet")
public class SapXepServlet extends HttpServlet {
	NhanXetDao nhanxetdao=new NhanXetDao();
	DeTaiDao detaidao=new DeTaiDao();
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SapXepServlet() {
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
		String url = "";
		String ChucVu="";
		Long MaGV;
		boolean i=false;
		String command = request.getParameter("command");
		Long MaDeTai=Long.parseLong(request.getParameter("MaDeTai"));
		String TenDeTai=request.getParameter("TenDeTai");
		//NhanXet nhanxet = new NhanXet();
		//DeTai detai=new DeTai();
		if(command.equals("insert")==true)
		{
			String NgayBaoCao=request.getParameter("NgayBaoCao");
			String GioBaoCao=request.getParameter("GioBaoCao");
			String ThoiLuong=request.getParameter("ThoiLuongBaoCao");

			i=detaidao.UpdateNhanXet(new DeTai(MaDeTai,NgayBaoCao,GioBaoCao,ThoiLuong));
			if(i==true)
			{
				i=false;
				ChucVu="Giáo Viên Hướng Dẫn";
				MaGV=Long.parseLong(request.getParameter("GVHD"));
				i=nhanxetdao.InsertNhanXet(new NhanXet(MaDeTai,TenDeTai,MaGV,ChucVu));
				if(i=true)
				{
					i=false;
					ChucVu="Giáo Viên Phản Biện";
					MaGV=Long.parseLong(request.getParameter("GVPB"));
					i=nhanxetdao.InsertNhanXet(new NhanXet(MaDeTai,TenDeTai,MaGV,ChucVu));
					if(i=true)
					{
						i=false;
						ChucVu="Ủy Viên";
						MaGV=Long.parseLong(request.getParameter("UV"));
						i=nhanxetdao.InsertNhanXet(new NhanXet(MaDeTai,TenDeTai,MaGV,ChucVu));
						if(i=true)
						{
							i=false;
							ChucVu="Chủ Tịch Hội Đồng";
							MaGV=Long.parseLong(request.getParameter("CTHD"));
							i=nhanxetdao.InsertNhanXet(new NhanXet(MaDeTai,TenDeTai,MaGV,ChucVu));
							if(i=true)
							{
								url="/truongkhoa_sapxep.jsp";
							}
							else
							{
								nhanxetdao.deleteNhanXet(new NhanXet(MaDeTai));
								response.setContentType("text/html;charset=UTF-8;");
								request.setAttribute("cthd", "Trùng Giáo Viên");
								url="/truongkhoa_sapxep_2.jsp";
							}
						}
						else
						{
							nhanxetdao.deleteNhanXet(new NhanXet(MaDeTai));
							response.setContentType("text/html;charset=UTF-8;");
							request.setAttribute("uv", "Trùng Giáo Viên");
							url="/truongkhoa_sapxep_2.jsp";
						}
					}
					else
					{
						nhanxetdao.deleteNhanXet(new NhanXet(MaDeTai));
						response.setContentType("text/html;charset=UTF-8;");
						request.setAttribute("gvpb", "Trùng Giáo Viên");
						url="/truongkhoa_sapxep_2.jsp";
					}
				}
				else
				{
					nhanxetdao.deleteNhanXet(new NhanXet(MaDeTai));
					response.setContentType("text/html;charset=UTF-8;");
					request.setAttribute("gvhd", "Trùng Giáo Viên");
					url="/truongkhoa_sapxep_2.jsp";
				}
			}
			else
			{
				response.setContentType("text/html;charset=UTF-8;");
				request.setAttribute("trungngay", "Trùng Ngày Giờ Báo Cáo");
				url="/truongkhoa_sapxep_2.jsp";
			}

		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}
}


