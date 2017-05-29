

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class feedbackdb
 */
@WebServlet("/feedbackdb")
public class feedbackdb extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public feedbackdb() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String tcode =request.getParameter("tcode");
		String branch =request.getParameter("branch");
		String scode=request.getParameter("scode");
		String year=request.getParameter("year");
		String q1=request.getParameter("Q1");
		String q2=request.getParameter("Q2");
		String q3=request.getParameter("Q3");
		String q4=request.getParameter("Q4");
		String q5=request.getParameter("Q5");
		String q6=request.getParameter("Q6");
		String q7=request.getParameter("Q7");
		String q8=request.getParameter("Q8");
		String q9=request.getParameter("Q9");
		String q10=request.getParameter("Q10");
		
		Connection con1;
		con1 = connection.getconnection();
		try {
			String sql = "insert into feedbackdb values(?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
			PreparedStatement ps = con1.prepareStatement(sql);
			    ps.setString(1,branch);
	            ps.setString(2,year);
	            ps.setString(3,tcode);
	            ps.setString(4,scode);
	            ps.setString(5,q1);
	            ps.setString(6,q2);
	            ps.setString(7,q3);
	            ps.setString(8,q4);
	            ps.setString(9,q5);
	            ps.setString(10,q6);
	            ps.setString(11,q7);
	            ps.setString(12,q8);
	            ps.setString(13,q9);
	            ps.setString(14,q10);
	            	            
			ps.executeUpdate();
            
            response.sendRedirect("studenthome.jsp");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
