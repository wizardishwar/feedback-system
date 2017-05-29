import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class reportgen
 */
@WebServlet("/reportgen")
public class reportgen extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reportgen() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String tcode=request.getParameter("tcode");
		String scode=request.getParameter("scode");
		Connection con1;
		con1 = connection.getconnection();
		try {
			String sql = "select * from feedbackdb where tcode=? and subcode=?";
			//out.println(sql);
			PreparedStatement ps = con1.prepareStatement(sql);
			   ps.setString(1,tcode);
	           ps.setString(2,scode);
	           
	            	            
			ResultSet resultSet=ps.executeQuery();
			 XSSFWorkbook workbook = new XSSFWorkbook(); 
		      XSSFSheet spreadsheet = workbook
		      .createSheet("Student feedback " +tcode+scode);
		      
		      XSSFRow row=spreadsheet.createRow(1);
		      XSSFCell cell;
		      
		      cell=row.createCell(1);
		      cell.setCellValue("Branch");
		      cell=row.createCell(2);
		      cell.setCellValue("Year");
		      cell=row.createCell(3);
		      cell.setCellValue("Teacher code");
		      cell=row.createCell(4);
		      cell.setCellValue("Subject Code");
		      cell=row.createCell(5);
		      cell.setCellValue("Q1");
		      cell=row.createCell(6);
		      cell.setCellValue("Q2");
		      cell=row.createCell(7);
		      cell.setCellValue("Q3");
		      cell=row.createCell(8);
		      cell.setCellValue("Q4");
		      cell=row.createCell(9);
		      cell.setCellValue("Q5");
		      cell=row.createCell(10);
		      cell.setCellValue("Q6");
		      cell=row.createCell(11);
		      cell.setCellValue("Q7");
		      cell=row.createCell(12);
		      cell.setCellValue("Q8");
		      cell=row.createCell(13);
		      cell.setCellValue("Q9");
		      cell=row.createCell(14);
		      cell.setCellValue("Q10");
			int i=2;
		      while(resultSet.next())
			{
				
		          row=spreadsheet.createRow(i);
		          cell=row.createCell(1);
		          cell.setCellValue(resultSet.getString("branch"));
		          cell=row.createCell(2);
		          cell.setCellValue(resultSet.getInt("Year"));
		          cell=row.createCell(3);
		          cell.setCellValue(resultSet.getString("tcode"));
		          cell=row.createCell(4);
		          cell.setCellValue(resultSet.getString("subcode"));
		          cell=row.createCell(5);
		          cell.setCellValue(resultSet.getString("q1"));
		          cell=row.createCell(6);
			      cell.setCellValue(resultSet.getString("q2"));
			      cell=row.createCell(7);
			      cell.setCellValue(resultSet.getString("q3"));
			      cell=row.createCell(8);
			      cell.setCellValue(resultSet.getString("q4"));
			      cell=row.createCell(9);
			      cell.setCellValue(resultSet.getString("q5"));
			      cell=row.createCell(10);
			      cell.setCellValue(resultSet.getString("q6"));
			      cell=row.createCell(11);
			      cell.setCellValue(resultSet.getString("q7"));
			      cell=row.createCell(12);
			      cell.setCellValue(resultSet.getString("q8"));
			      cell=row.createCell(13);
			      cell.setCellValue(resultSet.getString("q9"));
			      cell=row.createCell(14);
			      cell.setCellValue(resultSet.getString("q10"));

		          i++;
				
				
			}
		      FileOutputStream out = new FileOutputStream(
		    	      new File("E:\\feedback_"+tcode+"_"+scode+ ".xlsx"));
		    	      workbook.write(out);
		    	      out.close();
		    	      
		   request.setAttribute("msg", "The actual error message to be displayed");

		   RequestDispatcher rd = getServletContext().getRequestDispatcher("/yourpage.jsp");
		   rd.forward(request, response);
		   System.out.println("Report has been generated at location: E:\\feedback_"+tcode+"_"+scode+ ".xlsx has been generated");
            response.sendRedirect("report.jsp");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		
		
		
		
		
	}

}
