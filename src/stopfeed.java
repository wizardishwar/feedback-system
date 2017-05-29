

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
 * Servlet implementation class stopfeed
 */
@WebServlet("/stopfeed")
public class stopfeed extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public stopfeed() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String branch = request.getParameter("branch");
		String year = request.getParameter("year");
		

		//PrintWriter out = response.getWriter();
		Connection con1;
		con1 = connection.getconnection();
		try {
			

			PreparedStatement ps = con1.prepareStatement("delete from status where branch=? and year=?");
			ps.setString(1, branch);
			ps.setString(2,year);
			
			 ps.executeUpdate();
			
			response.sendRedirect("AdminModule.jsp");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
