<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="conpackage.connection"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Start Feedback</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/login.css">
<script src="js/login.js"></script>



</head>
<body>
<%
		Connection con1;
		con1 = connection.getconnection();
		Statement statement = con1.createStatement();
		ResultSet resultset = statement.executeQuery("select * from status");
	%>
	
<div class="row">
			<div class="col-md-offset-5 col-md-5">
				<h3>Start Feedback</h3>
			</div>
		</div>
		
 <div class="row">			
	<div class="col-md-offset-3">			
    <form class="form-inline" action="startfeed" method="post">
    <div class="form-group">
      <label for="Branch">Branch</label>
      <input type="Text" class="form-control" id="brach"  pattern="[A-Z]{2}{3}" title= "Branch Code (CS/IT/AEI)" placeholder="Branch" name="branch"  >
    </div>
    
    <div class="form-group">
      <label for="Year">Year</label>
      <input type="number" class="form-control" id="year" placeholder="Year" name="year">
    </div>
    
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
</div>
			
	</div>
<hr>	

<div class="row">
			<div class="col-md-offset-5 col-md-5">
				<h3>Active Feedback</h3>
			</div>
		</div>

<div class="row">
			<div class="col-md-offset-2 col-md-5">
				
			</div>
			<hr>
		</div>
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<TABLE class="table table-striped">
					<TR>
						<TH>Branch</TH>
						<TH>Year</TH>
						

					</TR>
					<%
						while (resultset.next()) {
					%>
					<TR>
						<TD><%=resultset.getString(1)%></td>
						<TD><%=resultset.getString(2)%></TD>
						

					</TR>
					<%
						}
					%>
				</TABLE>
			</div>
		</div>
<hr>



</body>
</html>