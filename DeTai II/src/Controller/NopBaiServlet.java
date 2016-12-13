package Controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet("/NopBaiServlet")
@MultipartConfig
public class NopBaiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NopBaiServlet() {
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
		final Part filePart = request.getPart("file1");

		Long MaDeTai=Long.parseLong(request.getParameter("MaDeTai"));
		String TenDeTai=request.getParameter("TenDeTai");
		Long MaSV=Long.parseLong(request.getParameter("MaSV"));
		String TenSV = request.getParameter("TenSV");
		String TenGVHD = request.getParameter("TenGVHD");
		String TomTat = request.getParameter("TomTat");

		InputStream pdfFileBytes = null;
		final PrintWriter writer = response.getWriter();
		try {

			if (!filePart.getContentType().equals("application/pdf"))
			{
				response.setContentType("text/html;charset=UTF-8;");
				request.setAttribute("error1", "File ERROR ");
				url="/SV_NopBai.jsp";
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			}

			else 
				if (filePart.getSize()>1048576 ) //2mb=1048576
				{ 
					{
						response.setContentType("text/html;charset=UTF-8;");
						request.setAttribute("error2", "File > 2MB");
						url="/SV_NopBai.jsp";
						RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
						rd.forward(request, response);
					}
				}

			pdfFileBytes = filePart.getInputStream(); 

			final byte[] bytes = new byte[pdfFileBytes.available()];
			pdfFileBytes.read(bytes); 

			Connection  con=null;

			try {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/detai","root","inspiron14");
			} catch (Exception e) {
				e.printStackTrace();
			}

			int success=0;
			PreparedStatement pstmt = con.prepareStatement("INSERT INTO bainop VALUES(?,?,?,?,?,?,?)");

			pstmt.setLong(1, MaDeTai);
			pstmt.setString(2,TenDeTai );
			pstmt.setLong(3, MaSV);
			pstmt.setString(4,TenSV );
			pstmt.setString(5, TenGVHD);
			pstmt.setString(6, TomTat);
			pstmt.setBytes(7,bytes);  
			success = pstmt.executeUpdate();
			con.close(); 
			if(success>=1)  
			{
				url="/SV_home.jsp";
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			}
			else
			{
				response.setContentType("text/html;charset=UTF-8;");
				request.setAttribute("error3", "Bài này đã nộp rồi");
				url="/SV_NopBai.jsp";
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			}
		} 
		catch (FileNotFoundException fnf) 
		{
			response.setContentType("text/html;charset=UTF-8;");
			request.setAttribute("error4", "Lỗi");
			url="/SV_NopBai.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);

		} 
		catch (SQLException e) 
		{
			response.setContentType("text/html;charset=UTF-8;");
			request.setAttribute("error3", "Bài này đã nộp rồi");
			url="/SV_NopBai.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} 
		finally 
		{

			if (pdfFileBytes != null) 
			{
				pdfFileBytes.close();
			}
			if (writer != null) 
			{
				writer.close();
			}
		}
	}

}
