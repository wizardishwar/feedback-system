<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="conpackage.connection"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
	
</script>
<link rel="stylesheet" href="css/custom.css">

<style>
.new {
	margin-top: 100px;
	margin-right: 150px;
	margin-left: 80px;
	border: 5px;
}
</style>

<title>Student Home</title>
</head>

<%
	session = request.getSession(false);
	String roll = (String) session.getAttribute("rollno");
	if (roll != null) {

		out.print("Hello, " + roll + " Welcome to Profile");

	}

	else {
		response.sendRedirect(request.getContextPath() + "/index.html");
	}
%>


<body>

	<%
		String branch = null, year = null;
		Boolean status = false;
		Connection con1;
		con1 = connection.getconnection();
		PreparedStatement ps = con1.prepareStatement("select branch,year from student where roll=?");
		ps.setString(1, roll);
		//System.out.println("reached here!!!");
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			branch = rs.getString("branch");
			year = rs.getString("year");
			//out.print("Branch" + branch + "Year" + year );
			//System.out.println("reached here!!!");
		}

		PreparedStatement pss = con1.prepareStatement("select status from status where branch=? and year=? ");
		pss.setString(1, branch);
		pss.setString(2, year);

		ResultSet res = pss.executeQuery();
		while (res.next()) {
			status = res.getBoolean("status");
			//year=rs.getString("year");
			//out.print("Branch" + branch + "Year" + year );
			//System.out.println("reached here!!!");
		}

		if (status == true) {
			//out.print("oloaoaooaao");

			PreparedStatement pst = con1.prepareStatement(
					"select a.subname,a.subcode,b.name,b.tcode from subject a,teacher b where a.tcode=b.tcode and branch=? and year=?");
			     pst.setString(1, branch);
			     pst.setString(2,year);
			ResultSet res1 = pst.executeQuery();
	%>

	<hr>
<form action="feedback.jsp"  method="post">
	<div class="row">
		<div class="col-md-offset-5 col-md-5">
			<h3>Feedback Form</h3>
		</div>
	</div>

	
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
		
			<TABLE class="table table-striped">
				<TR>
					<TH>Subject Name</TH>
					<TH>Subject Code</TH>
					<TH>Name</TH>
					<TH>Teacher Code</TH>
					<Th></Th>

				</TR>
				<%
					while (res1.next()) {
				%>
				<TR>
					<TD><%=res1.getString(1)%></td>
					<TD><%=res1.getString(2)%></TD>
					<TD><%=res1.getString(3)%></TD>
					<TD><%=res1.getString(4)%></TD>
					<TD>
					<form action="feedback.jsp" method="post">
					
					<input type="hidden" name="sname" value="<%=res1.getString(1)%>">
					<input type="hidden" name="scode" value="<%=res1.getString(2)%>">
					<input type="hidden" name="name" value="<%=res1.getString(3)%>">
					<input type="hidden" name="tcode" value="<%=res1.getString(4)%>">
					<input type="hidden" name="branch" value="<%=branch%>">
					<input type="hidden" name="year" value="<%=year%>">
					
					
					<button type="submit" class="btn btn-primary">Feedback</button>
                    
                    </form>
                    </TD>
				</TR>
				
				
				<%
				
					}
					
				%>
			</TABLE>
		</div>
	</div>
	<div class="row">
	<div class="col-md-6 col-md-offset-3">
			
		
		<div class="alert alert-danger">
			<strong>Please Note!</strong> This is an anonymous feedback form please do not enter
			any personal information in the form
		</div>
		</div>
	</div>
	
	<div class="row">
	  <div class="col-md-6 col-md-offset-3">
	  <button type="submit" class="btn btn-primary">Submit Feedback</button>
	  </div>
	
	</div>
<%} %>

</form>
</body>
</html>