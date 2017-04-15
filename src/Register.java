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

/** *
 * Servlet implementation class Register
 */

@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public Register() {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name =request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String year=request.getParameter("year");
		String branch=request.getParameter("branch");
		String roll=request.getParameter("roll");
		
		
		
		
		Connection con1;
		con1 = connection.getconnection();
		PrintWriter out = response.getWriter();
		out.println(name+" "+roll+""+email+" "+password+ " "+year+" "+branch);
		try {
			String sql = "insert into student values(?,?,?,?,?,?);";
			out.println(sql);
			PreparedStatement ps = con1.prepareStatement(sql);
			    ps.setString(1,name);
	            ps.setString(2,roll);
	            ps.setString(3,email);
	            ps.setString(4,year);
	            ps.setString(5,branch);
	            ps.setString(6,password);
	            
			ps.executeUpdate();
            out.println("<h1>done!!!!!!!!</h1>");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}