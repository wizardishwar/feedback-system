

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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdmAuth
 */
@WebServlet("/AdmAuth")
public class AdmAuth extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmAuth() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		Connection con1;
		con1 = connection.getconnection();
		try {
			
			String user = request.getParameter("user");
			String Pass = request.getParameter("pass");


			PreparedStatement ps = con1.prepareStatement("select * from admauth where userid=? and password=?");
			ps.setString(1, user);
			ps.setString(2, Pass);
			ResultSet rs = ps.executeQuery();
			//out.println("aa halo");
			Boolean status =false;
			status=rs.next();
			if(status)
			{
				HttpSession session = request.getSession();
	            session.setAttribute("user", user);
	            response.sendRedirect(request.getContextPath() + "/AdminModule.jsp");
				//out.println("rangeela");
				//out.println(rs.getString(1));
				
			}
			

//			if (status) {
////				out.println("welcome !");
////				HttpSession session = request.getSession();
////	            session.setAttribute("user", user);
////	            response.sendRedirect(request.getContextPath() + "/AdminModule.jsp");
////	            response.sendRedirect("Welcome");
//				
//			}
//
		else {  PrintWriter out = response.getWriter();
				out.println("Wrong UserId or Password!! ");
				out.close();
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	
	
	}
	


