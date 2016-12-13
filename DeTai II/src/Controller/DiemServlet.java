package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.DiemDao;
import Model.Diem;

@WebServlet("/DiemServlet")
public class DiemServlet extends HttpServlet {
	DiemDao diemdao =new DiemDao();
	private static final long serialVersionUID = 1L;

	public DiemServlet() {
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
		Diem dien=new Diem();
		String command = request.getParameter("command");
		if(command.equals("insert")==true)
		{
			long MaDeTai=Long.parseLong(request.getParameter("MaDeTai"));
			long MaGV=Long.parseLong(request.getParameter("MaGV"));
			long Diem=Long.parseLong(request.getParameter("Diem"));

			boolean i= diemdao.InsertNhanXet(new Diem(MaDeTai,MaGV,Diem));
			url="/GV_home.jsp";
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		}

	}

}
