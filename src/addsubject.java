

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addsubject
 */
@WebServlet("/addsubject")
public class addsubject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addsubject() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String subname =request.getParameter("subname");
		String subcode =request.getParameter("subcode");
		String year =request.getParameter("year");
		String tcode =request.getParameter("tcode");
		String branch =request.getParameter("branch");
		
		
		
		
		Connection con1;
		con1 = connection.getconnection();
		try {
			String sql = "insert into subject values(?,?,?,?,?);";
			//out.println(sql);
			PreparedStatement ps = con1.prepareStatement(sql);
			    ps.setString(1,subname);
	            ps.setString(2,subcode);
	            ps.setString(3,year);
	            ps.setString(4,tcode);
	            ps.setString(5,branch);
	            
	            	            
			ps.executeUpdate();
            response.sendRedirect("AdminModule.jsp");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
