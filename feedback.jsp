<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<link rel="stylesheet" href="navbar.css">
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<title>
		Build a Survey Form using HTML and CSS
	</title>

	<style>

		/* Styling the Body element i.e. Color,
		Font, Alignment */
		body {
			background-color:;
			font-family: Verdana;
		}

		/* Styling the Form (Color, Padding, Shadow) */
		form {
			background-color: #fff;
			max-width: 500px;
			margin: 50px auto;
			padding: 30px 20px;
			box-shadow: 2px 5px 10px rgba(0, 0, 0, 0.5);
		}

		/* Styling form-control Class */
		.form-control {
			text-align: left;
			margin-bottom: 25px;
		}

		/* Styling form-control Label */
		.form-control label {
			display: block;
			margin-bottom: 10px;
		}

		/* Styling form-control input,
		select, textarea */
		.form-control input,
		.form-control select,
		.form-control textarea {
			border: 1px solid #777;
			border-radius: 2px;
			font-family: inherit;
			padding: 10px;
			display: block;
			width: 95%;
		}

		/* Styling form-control Radio
		button and Checkbox */
		.form-control input[type="radio"],
		.form-control input[type="checkbox"] {
			display: inline-block;
			width: auto;
		}

		/* Styling Button */
		button {
			background-color: #05c46b;
			border: 1px solid #777;
			border-radius: 2px;
			font-family: inherit;
			font-size: 21px;
			display: block;
			width: 100%;
			margin-top: 50px;
			margin-bottom: 20px;
		}
	</style>
	<script>
	function addCompi(){
			
			window.location = "AddCompetitions.jsp";
		}
		function gotoHome(){
		window.location = "homePage.jsp";
		}
		function gotoContact(){
			window.location = "contactUs.jsp";
		}
		function gotoAbout(){
			window.location = "AboutUs.jsp";
		}
		function gotoLogin(){
			window.location = "ParticipantLogin.jsp";
		}
	</script>	
</head>

<body>
<nav>
	<ul class="menu">
		<li class="logo"><a role="button" onclick="gotoHome()" href="#">Competative World</a></li>
		
		<li class="item button"><a role="button" onclick="gotoLogin()" href="#">Log out</a></li>
		<li class="toggle"><span class="bars"></span></li>
	</ul>
</nav>
	<div align=center style="padding-top:20px;"><h1>Feedback Form</h1>

	<!-- Create Form -->
	<form id="form" action="SubmitFeedbackServlet" method="">
	<%session.setAttribute("cid",request.getParameter("cid")); %>
		<!-- Details -->
		<div class="form-control">
			<label for="name" id="label-name">
				Name
			</label>

			<!-- Input Type Text -->
			<input type="text"
				name="name"
				placeholder="Enter your name" />
		</div>

		<div class="form-control">
			<label for="email" id="label-email">
				Email
			</label>

			<!-- Input Type Email-->
			<input type="email"
				name="email"
				placeholder="Enter your email" />
		</div>


		<div class="form-control">
			<label for="role" id="label-role">
				Which option best describes you?
			</label>
			
			<!-- Dropdown options -->
			<select name="role" id="role">
				<option value="student">Student</option>
				<option value="intern">Intern</option>
				<option value="professional">
					Professional
				</option>
				<option value="other">Other</option>
			</select>
		</div>


		

		<div class="form-control">
			<label for="comment">
				Any comments or suggestions
			</label>

			<!-- multi-line text input control -->
			<textarea name="comment" id="comment"
				placeholder="Enter your comment here">
			</textarea>
		</div>

		<!-- Multi-line Text Input Control -->
		<button type="submit" value="submit">
			Submit
		</button>
	</form>
</body>

</html>
