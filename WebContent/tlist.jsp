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
<title>List of Teachers</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<%
		Connection con1;
		con1 = connection.getconnection();
		Statement statement = con1.createStatement();
		ResultSet resultset = statement.executeQuery("select * from teacher");
	%>

	<div class="container">
		<div class="row">
			<div class="col-md-offset-2 col-md-5">
				<h3>List Of Teachers</h3>
			</div>
			<hr>
		</div>
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<TABLE class="table table-striped">
					<TR>
						<TH>Name</TH>
						<TH>Teacher Code</TH>
						<TH>Department</TH>

					</TR>
					<%
						while (resultset.next()) {
					%>
					<TR>
						<TD><%=resultset.getString(1)%></td>
						<TD><%=resultset.getString(2)%></TD>
						<TD><%=resultset.getString(3)%></TD>

					</TR>
					<%
						}
					%>
				</TABLE>
			</div>
		</div>
<hr>
		<div class="row">
			<div class="col-md-offset-2 col-md-5">
				<h3>Remove Teacher</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-md-offset-2 col-md-4">
				<form class="form-inline" action="removeTeacher" method="post">

					<label for="tcode">Teacher Code</label> <input type="text"
						class="form-control" id="tcode" name="tcode">
					<button type="submit" class="btn btn-danger">Submit</button>


				</form>
			</div>
		</div>
</body>

</html>