<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="conpackage.connection"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Students Details</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="row">
			<div class="col-md-offset-2 col-md-5">
				<h3>Remove Student</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-md-offset-2 col-md-4">
				<form class="form-inline" action="remstudent" method="post">

					<label for="rollno">Roll NO</label> <input type="number"
						class="form-control" id="roll" name="roll">
					<button type="submit" class="btn btn-danger">Submit</button>


				</form>
			</div>
		</div>
<hr>

	<%
		Connection con1;
		con1 = connection.getconnection();
		Statement statement = con1.createStatement();
		ResultSet resultset = statement.executeQuery("select name,roll,email,year,branch from student");
	%>

	<div class="container">
		<div class="row">
			<div class="col-md-offset-2 col-md-5">
				<h3>List Of Students</h3>
			</div>
			<hr>
		</div>
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<TABLE class="table table-striped">
					<TR>
						<TH>Name</TH>
						<TH>Roll No</TH>
						<TH>Email</TH>
						<TH>Year</TH>
						<TH>Branch</TH>
						

					</TR>
					<%
						while (resultset.next()) {
					%>
					<TR>
						<TD><%=resultset.getString(1)%></td>
						<TD><%=resultset.getString(2)%></TD>
						<TD><%=resultset.getString(3)%></TD>
						<TD><%=resultset.getString(4)%></TD>
						<TD><%=resultset.getString(5)%></TD>

					</TR>
					<%
						}
					%>
				</TABLE>
			</div>
		</div>

</body>
</html>