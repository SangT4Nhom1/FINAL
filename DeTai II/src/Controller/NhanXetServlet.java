package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*import javax.servlet.http.HttpSession;*/

import Dao.NhanXetDao;
import Model.NhanXet;

@WebServlet("/NhanXetServlet")
public class NhanXetServlet extends HttpServlet {
	NhanXetDao nhanxetdao = new NhanXetDao();
	private static final long serialVersionUID = 1L;

	public NhanXetServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
		rd.include(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String url = "";
		NhanXet nhanxet = new NhanXet();
		String command = request.getParameter("command");
		/*HttpSession session = request.getSession();*/
		switch (command) {
		case "insert":

			long MaDeTai= Long.parseLong(request.getParameter("MaDeTai"));
			long MaGV= Long.parseLong(request.getParameter("MaGV"));
			String TenDetTai=request.getParameter("TenDeTai");
			String TenGV=request.getParameter("TenGV");
			String Nhanxet=request.getParameter("NhanXet");
			String BaoCao=request.getParameter("BaoCao");
			String XepLoai=request.getParameter("XepLoai");

			boolean i = nhanxetdao.UpdateNhanXet(new NhanXet(MaDeTai,MaGV,TenDetTai,TenGV,Nhanxet,BaoCao,XepLoai));
			if(i==true)
			{
				url="/GV_Danh_Sach_De_Tai.jsp";
			}
			else
			{
				response.setContentType("text/html;charset=UTF-8;");
				request.setAttribute("error", "Bài này đã Đánh Giá R");
				url="/GV_Danh_Gia_De_Tai.jsp";
			}
			break;
		}

		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
