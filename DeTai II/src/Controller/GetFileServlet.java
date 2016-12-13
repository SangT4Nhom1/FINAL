package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
 
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/GetFileServlet")
public class GetFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetFileServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		 long MaDeTai =Long.parseLong( request.getParameter("MaDeTai"));
	        ServletOutputStream sos;
	        Connection  con=null;
	        PreparedStatement pstmt=null;
	         
	        response.setContentType("application/pdf");
	 
	        response.setHeader("Content-disposition","inline; filename="+MaDeTai+".pdf" );
	 
	 
	         sos = response.getOutputStream();
	         
	 
	           try {
	               Class.forName("com.mysql.jdbc.Driver");
	               con = DriverManager.getConnection("jdbc:mysql://localhost:3306/detai","root","inspiron14");
	          } catch (Exception e) {
	                     System.out.println(e);
	                     System.exit(0); 
	                          }
	            
	          ResultSet rset=null;
	            try {
	                pstmt = con.prepareStatement("Select File from bainop where MaDeTai=?");
	                pstmt.setLong(1, MaDeTai);
	                rset = pstmt.executeQuery();
	                if (rset.next())
	                    sos.write(rset.getBytes("File"));
	                else
	                    return;
	                 
	            } catch (SQLException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	     
	        sos.flush();
	        sos.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
