<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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
<title>Feedback</title>
</head>

<%
	session = request.getSession(false);
	String roll = (String) session.getAttribute("rollno");
	if (roll != null) {

		out.print("Hello, " + roll + " Please fill the form");

	}

	else {
		response.sendRedirect(request.getContextPath() + "/index.html");
	}

      String sname=request.getParameter("sname");
      String scode=request.getParameter("scode");
      String name=request.getParameter("name");
      String tcode=request.getParameter("tcode");
      String branch=request.getParameter("branch");
      String year=request.getParameter("year");
      

%>

<body>

	<div class="row">
		<div class="col-md-12">
			<center>
				<h1>
					 Feedback Details
				</h1>
			</center>
		</div>
	</div>
<div class="row">
<div class="col-md-offset-3 col-md-6 col-md-offset-3" >
<div class="table-responsive  ">
			<table class="table table-bordered">
				<thead class="thead-inverse">
					<tr>
						<th>Subject Name</th>
						<th>Subject Code</th>
						<th>Teacher's name</th>
						<th>Teacher Code</th>
				    </tr>
				</thead>
				<tbody>
					<tr>
						<td><%=sname%></td>
						<td><%=scode%></td>
						<td><%=name%></td>
						<td><%=tcode%></td>
				    </tr>
				</tbody>
			</table>
		</div>



</div>
</div>

<div class="row">
<div class="col-md-offset-2 col-md-8">
<div class="table-responsive  ">
<form action="feedbackdb" method="post">
			<table class="table table-bordered">
				<thead class="thead-inverse">
					<tr>
						<th>Code</th>
						<th>Question</th>
						<th>Rating</th>
				    </tr>
				</thead>
				<tbody>
					<tr>
						<td>Q1</td>
						<td>Clarity In understanding the topic taught by the teacher?</td>
						<td><input type="number" name="Q1" min=1 max=5></td>
				   </tr>
				   <tr>
						<td>Q2</td>
						<td>Use of teaching aid and practical/real time example</td>
						<td><input type="number" name="Q2" min=1 max=5></td>
				   </tr><tr>
						<td>Q3</td>
						<td>Whether teacher integrates the course with model questions and university examination paper</td>
						<td><input type="number" name="Q3" min=1 max=5></td>
				   </tr><tr>
						<td>Q4</td>
						<td>Effectiveness of teacher in terms of communication skills and board presentation</td>
						<td><input type="number" name="Q4" min=1 max=5></td>
				   </tr><tr>
						<td>Q5</td>
						<td>Teachers response to students queries</td>
						<td><input type="number" name="Q5" min=1 max=5></td>
				   </tr><tr>
						<td>Q6</td>
						<td>Teachers help with notes /text books/e-resources,etc</td>
						<td><input type="number" name="Q6" min=1 max=5></td>
				   </tr>
				   <tr>
						<td>Q7</td>
						<td>Accessibility of teacher beyond normal class hours to solve the problem</td>
						<td><input type="number" name="Q7" min=1 max=5></td>
				   </tr>
				   <tr>
						<td>Q8</td>
						<td>Teacher shares answers of class test/ Sessional test/PUT after conduction of test</td>
						<td><input type="number" name="Q8" min=1 max=5></td>
				   </tr><tr>
						<td>Q9</td>
						<td>Punctuality of teacher and discipline in the class room</td>
						<td><input type="number" name="Q9" min=1 max=5></td>
				   </tr><tr>
						<td>Q10</td>
						<td>Motivates students and inspire them for ethical conduct</td>
						<td><input type="number" name="Q10" min=1 max=5></td>
				   </tr>
				</tbody>
			</table>
			<input type="hidden" name="sname"  value="<%=sname%>">
			<input type="hidden" name="scode"  value="<%=scode%>">
			<input type="hidden" name="name"   value="<%=name%>">
			<input type="hidden" name="tcode"  value="<%=tcode%>">
			<input type="hidden" name="branch" value="<%=branch%>">
			<input type="hidden" name="year"   value="<%=year%>">
					
			
			<button type="submit" class="btn-success">Submit</button>
		</form>
		</div>
</div>

</div>
	<h1>Yo Bitch get of the way !!!!!!!!!!!!!!!!</h1>
</body>
</html>