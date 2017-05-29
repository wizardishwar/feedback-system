

import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
//import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class removeTeacher
 */
@WebServlet("/removeTeacher")
public class removeTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public removeTeacher() {
        super();
        // TODO Auto-generated constructor stub
    }

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				
		String tcode = request.getParameter("tcode");

		//PrintWriter out = response.getWriter();
		Connection con1;
		con1 = connection.getconnection();
		try {
			

			PreparedStatement ps = con1.prepareStatement("delete from teacher where tcode=?");
			ps.setString(1, tcode);
			
			 ps.executeUpdate();
			
			response.sendRedirect("AdminModule.jsp");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	}

}
