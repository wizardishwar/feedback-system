package conpackage;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class connection {
	private static Connection con;
	private static String driverName = "com.mysql.jdbc.Driver";
	private static String username = "root";
	private static String password = "ishwar";
	private static String url = "jdbc:mysql://localhost:3309/feedback";

	public static Connection getconnection()
	{
		
				     try {
	            Class.forName(driverName);
	            try {
	                con = DriverManager.getConnection(url, username, password);
	            } catch (SQLException ex) {
	                // log an exception. fro example:
	                System.out.println("Failed to create the database connection."); 
	            }
	        } catch (ClassNotFoundException ex) {
	            // log an exception. for example:
	            System.out.println("Driver not found."); 
	        }
	        return con;
	    

}}
