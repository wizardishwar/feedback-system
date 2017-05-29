

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
 * Servlet implementation class remstudent
 */
@WebServlet("/remstudent")
public class remstudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public remstudent() {
        super();
        // TODO Auto-generated constructor stub
    }

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			String tcode = request.getParameter("roll");

			//PrintWriter out = response.getWriter();
			Connection con1;
			con1 = connection.getconnection();
			try {
				

				PreparedStatement ps = con1.prepareStatement("delete from student where roll=?");
				ps.setString(1, tcode);
				
				 ps.executeUpdate();
				
				response.sendRedirect("AdminModule.jsp");
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


		
	}

}
