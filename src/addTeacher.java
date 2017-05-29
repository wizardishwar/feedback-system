

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
 * Servlet implementation class addTeacher
 */
@WebServlet("/addTeacher")
public class addTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addTeacher() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String name =request.getParameter("name");
		String tcode =request.getParameter("tcode");
		String dept =request.getParameter("dept");
		
		PrintWriter out=response.getWriter();
		out.println("Mr/Ms  " + name + "whose Teacher Code is " + tcode + "belongs to" + dept + "department" );
		
		Connection con1;
		con1 = connection.getconnection();
		try {
			String sql = "insert into teacher values(?,?,?);";
			out.println(sql);
			PreparedStatement ps = con1.prepareStatement(sql);
			    ps.setString(1,name);
	            ps.setString(2,tcode);
	            ps.setString(3,dept);
	            	            
			ps.executeUpdate();
            out.println("<h1>done!!!!!!!!</h1>");
            response.sendRedirect("AdminModule.jsp");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
