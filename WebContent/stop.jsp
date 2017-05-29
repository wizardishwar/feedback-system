<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Stop feedback</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/login.css">
<script src="js/login.js"></script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-offset-5 col-md-5">
				<h3>Stop Feedback</h3>
			</div>
		</div>

		<div class="row">
			<div class="col-md-offset-3">
				<form class="form-inline" action="stopfeed" method="post">
					<div class="form-group">
						<label for="Branch">Branch</label> <input type="Text"
							class="form-control" id="brach" pattern="[A-Z]{2}{3}"
							title="Branch Code (CS/IT/AEI)" placeholder="Branch"
							name="branch">
					</div>

					<div class="form-group">
						<label for="Year">Year</label> <input type="number"
							class="form-control" id="year" placeholder="Year" name="year">
					</div>

					<button type="submit" class="btn btn-danger">Stop</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>