<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/custom.css">
<style>
.new {
	margin-top: 100px;
	margin-right: 150px;
	margin-left: 80px;
	border: 5px;
}
</style>
</head>
<%
	session = request.getSession(false);
	String name = (String) session.getAttribute("user");
	if (name != null) {

		out.print("Hello, " + name + " Welcome to Profile");

	}

	else {
		response.sendRedirect(request.getContextPath() + "/login.html");
	}
%>

<script>
	$(document).ready(function() {
		$("#subject").click(function() {
			$("#div1").load("NewFile.html");
		});
	});
</script>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<center>
					<h1>
						Student Feedback System<br /> <small>Admin Panel</small>
					</h1>
				</center>
			</div>
		</div>
		<br />

		<div class="row">

			<div class="col-md-2">
				<nav class="nav-sidebar">
				<ul class="nav">
					<li class="active"><a href="javascript:;">Add Teacher</a></li>
					<!-- 					<li><a href="javascript:;">Add Subject</a></li> -->
					<li id="subject">Add Subject</li>
					<li><a href="javascript:;">Assign classes</a></li>
					<li><a href="javascript:;">Start Feedback</a></li>
					<li><a href="javascript:;">Stop Feedback</a></li>
					<li class="nav-divider"></li>
					<li>
						<form action="${pageContext.request.contextPath}/logout"
							method="post">
							<input class="btn-danger" type="submit" value="Sign out">
						</form>
					</li>
				</ul>
				</nav>
			</div>


			<div id="div1" class="col-md-10">
				<center>
					<h1>Add Teachers</h1>
				</center>
				<hr>
				<form class="form-inline" action="addTeacher">
					<div class="form-group">
						<label for="name">Name:</label> <input type="text"
							class="form-control" id="name" name="name">
					</div>
					<div class="form-group">
						<label for="tcode">Teacher Code</label> <input type="text"
							class="form-control" id="tcode" name="tcode">
					</div>
					
					<div class="form-group">
						<label for="Dept">Department(CS/IT/ME)</label> <input type="text"
							class="form-control" id="dept" name="dept">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>


				</form>
			</div>
		</div>
	</div>





</body>
</html>