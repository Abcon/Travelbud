<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Travelbud Login</title>
</head>

<body alink=black vlink=black link=steelblue>
	<%
		if (session.getAttribute("activeUser") != null) {
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
							USER LOGIN </a>
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
		<tr height=30></tr>
	</table>

	<hr width="80%" color=goldenrod>
	<hr width="80%" color=goldenrod>
	<hr width="80%" color=goldenrod>
	<hr width="80%" color=goldenrod>
	<br>

	<table border=0 align="center" bgcolor=silver width="80%"
		id="tableFormL">
		<tr>
			<td>
				<form action="login" method="post">
					<center>
						<font face="Comic Sans MS" color=steelblue style="text: bold">
							<b>UserName</b> <input type="text" name="usernamel"
							style="border-color: cornflowerblue;" c> <br> <br>
							<b>Password</b> <input type="password" name="passwordl"
							required="required" style="border-color: cornflowerblue;">
							<br> <br>
						</font> <input type="submit" value="Log In" id="loginB"
							style="font-face: 'Comic Sans MS'; 
							color: white; 
							border: white; 
							border-radius: 3px;
							cursor: pointer;
							background-color: cornflowerblue;
							height:30px;">
						<br> <br>
					</center>
				</form>
			</td>
		</tr>
		<tr>
			<td align=center><h4 style="color: red;">${errorlogin}</b></td>
		</tr>
	</table>
	
	<br>
	<hr width="80%" color=goldenrod>
	<hr width="80%" color=goldenrod>
	<hr width="80%" color=goldenrod>
	<hr width="80%" color=goldenrod>

	<table border=0 align="center" bgcolor=cornflowerblue width="80%">
		<tr height=60>
			<td><a href="signup.jsp">
					<center>
						<font color="white"> BACK </font>
					</center>
			</a></td>
		</tr>
	</table>
	<hr width="80%" color=goldenrod>
	<hr width="80%" color=goldenrod>
	<hr width="80%" color=goldenrod>
	<hr width="80%" color=goldenrod>
	<table border=0 align="center" bgcolor=cornflowerblue width="80%">
		<tr height=60>
			<td>
				<center>
					<font size="4" color="white">Don't have an account?</font>
				</center> <br> <a href="signup">
					<center>
						<font size="5" color="white">SIGN UP</font>
					</center>
			</a>
			</td>
		</tr>
	</table>
</body>

</html>