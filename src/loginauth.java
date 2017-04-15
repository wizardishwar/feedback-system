import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class loginauth
 **/

@WebServlet("/loginauth")
public class loginauth extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public loginauth() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String rollno = request.getParameter("rollno");
		String Password = request.getParameter("password");

		Connection con1;
		con1 = connection.getconnection();
		try {
			

			PreparedStatement ps = con1.prepareStatement("select * from student where roll=? and password=?");
			ps.setString(1, rollno);
			ps.setString(2, Password);
			ResultSet rs = ps.executeQuery();
			out.println("aa halo");
			Boolean status =false;
			status=rs.next();
			if(status)
			{out.println("rangeela");
				out.println(rs.getString(1));
				
			}
			

			if (status) {
				out.println("welcome !");
			}

			else {
				out.println("fo");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
