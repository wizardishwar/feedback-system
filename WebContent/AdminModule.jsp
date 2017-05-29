<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin panel</title>
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
</head>

<%
	session = request.getSession(false);
	String name = (String) session.getAttribute("user");
	if (name != null) {

		out.print("Hello, " + name + " Welcome to Profile");

	}

	else {
		response.sendRedirect(request.getContextPath() + "/index.html");
	}
%>

<script>
	$(document).ready(function() {
		$("#subject").click(function() {
			$("#div1").load("addsubj.html");

		}

		);
	});
	

$(document).ready(function() {
	$("#feedbackstart").click(function() {
		$("#div1").load("start.jsp");

	}

	);
});


$(document).ready(function() {
	$("#feedbackstop").click(function() {
		$("#div1").load("stop.jsp");

	}

	);
});


$(document).ready(function() {
	$("#tlist").click(function() {
		$("#div1").load("tlist.jsp");

	}

	);
});


$(document).ready(function() {
	$("#report").click(function() {
		$("#div1").load("report.jsp");

	}

	);
});


$(document).ready(function() {
	$("#students").click(function() {
		$("#div1").load("students.jsp");

	}

	);
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
					<li class="active">Add Teacher</li>
					<li id="tlist">Teachers</li>
					<li id="students">Students</li>
					<li id="subject">Add Subject</li>
					<li id="report">Generate Report</li>
					<li id="feedbackstart">Start Feedback</li>
					<li id="feedbackstop">Stop Feedback</li>
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