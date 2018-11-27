<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Travelbud Signup</title>
<style>
label {
	display: inline-block;
	float: center;
	clear: left;
	width: 9%;
	text-align: center;
	font-weight: bold;
	color: white;
	border: 3;
	border-radius: 3px;
	background-color: cornflowerblue;
}

input {
	display: inline-block;
	float: center;
}

body {
	color: cornflowerblue;
}
</style>
</head>

<body alink=steelblue vlink=steelblue link=steelblue>
	<!-- <script src="js/SignInUp.js"></script> -->
	<%
		if(session.getAttribute("activeUser")!=null){
		 	response.sendRedirect("ProHome");	
		}
		%>
	<table align="center" bgcolor=silver width="80%">
		<tr>
			<td><img src="img/travelbud.png" width=250 height=150></td>
			<td bgcolor="cornflowerblue" width=100></td>
			<td bgcolor="goldenrod"></td>
			<td bgcolor="goldenrod"></td>
			<td bgcolor="goldenrod"></td>
			<td>
				<center>
					<font face="Rosewood Std Regular" size=10 color=steelblue> <a
						href="index.jsp" style="text-decoration: none"
						onmouseout="this.style.color='steelblue';"
						onmouseover="this.style.color='cornflowerblue';"> TRAVELBUD
							SIGNUP </a>
					</font>
				</center>
			</td>
			<td bgcolor="goldenrod"></td>
			<td bgcolor="goldenrod"></td>
			<td bgcolor="goldenrod"></td>
			<td bgcolor="cornflowerblue" width=100></td>
		</tr>
	</table>

	<table border=0 align="center" bgcolor="cornflowerblue" width="80%">
		<tr height=30>
		</tr>
	</table>

	<hr width="80%" color=goldenrod>
	<hr width="80%" color=goldenrod>
	<hr width="80%" color=goldenrod>
	<hr width="80%" color=goldenrod>
	<br>

	<table border=0 align="center" bgcolor=silver width="80%">
	<tr><td></td></tr>
		<tr>
			<td>
				<form action="signup" method="post">
					<center>
					<br>
						<label>FirstName:</label> <input type="text" name="fname" 
						placeholder="Enter your first name" required>
						<br> <br> <label>LastName:</label> <input type="text"
							name="lname" placeholder="Enter your last name" required> <br> <br> 
							<label>Address:</label>
						<input type="text" name="address" placeholder="Enter your address" required> <br> <br>
						<label>Phone no.:</label> <input type="text" name="phoneno"
							placeholder="Enter 10 digits phone no." pattern="\d{10}" required > <br> <br> <label>UserName:</label> <input
							type="text" name="username" placeholder="Enter your username" required> <br> <br>
						<label>Password:</label> <input type="password" name="password"
							placeholder="Enter your password" required> <br> <br> <label>Confirm
							Password:</label> <input type="password" name="cpassword"
							placeholder="Re-enter your password"
							required> <br> <br> <input
							type="submit" value="Signup"
							style="font-face: 'Comic Sans MS'; color: white; border: white; border-radius: 3px; 
							cursor:pointer; background-color: cornflowerblue; height: 30px;">
						<br>
					</center>
				</form>

			</td>
		</tr>
		<tr>
			<td align=center><h4 style="color: red;">${errorPsw}</b></td>
		</tr>
	</table>

	<br>
	<hr width="80%" color=goldenrod>
	<hr width="80%" color=goldenrod>
	<hr width="80%" color=goldenrod>
	<hr width="80%" color=goldenrod>

	<table border=0 align="center" bgcolor=cornflowerblue width="80%">
		<tr height=60>
			<td><a href="index.jsp" style="color: white;">
					<center>
						<h4>BACK</h4>
					</center>
			</a></td>
		</tr>
	</table>


	<center>
		<font face="Comic Sans MS" size=4 color=goldenrod>Do u already
			have an account?</font> <br> <a href="login.jsp"> <font
			face="Comic Sans MS" size=5 color=steelblue>LOGIN</font>
		</a>
	</center>
	<hr>
	<hr>
	<br>


</body>
</html>