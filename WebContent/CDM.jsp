<%@page import="com.test.models.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Create Travel Group</title>
<style>
label{
    display: inline-block;
    float: center;
    clear: left;
    width: 13%;
    text-align: right;
}
input {
  display: inline-block;
  float: center;
}
p{
 font-size: 14px;
}
</style>
</head>
<body alink=teal vlink=teal link=teal>
	<a name=top></a>
	<%
		//not allow to go back after login for HTTP 1.1
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		//
		
		User activeUser = (User) session.getAttribute("activeUser");

		if (activeUser == null) {
			response.sendRedirect("login");
		}
	%>
	<table align="center" bgcolor="#c9c9c9" width="80%" height="13%">
		<td><b><font color=#C9C9C9>---------</font><font face="Georgia"
				size=10><a href="index.jsp" style="text-decoration: none"
					onmouseout="this.style.color='teal';"
					onmouseover="this.style.color='#c24641';">TRAVEL GROUP</a></font></b></td>
		<tr align=right>
			<td>
				<button style="background-color: #c0c0c0; width: 70; height: 25">
					<a href="maincards.jsp" style="text-decoration: none"><p
							onmouseout="this.style.color='teal';"
							onmouseover="this.style.color='#c24641';"><b>Blog</b></p></a>
				</button>
				<button style="background-color: #c0c0c0; width: 80; height: 25">
					<a href="test.jsp" style="text-decoration: none"><p
							onmouseout="this.style.color='teal';"
							onmouseover="this.style.color='#c24641';"><b>Post</b></p></a>
				</button>
				<button style="background-color: #c0c0c0; width: 110; height: 25">
					<a href="cardistry.jsp" style="text-decoration: none"><p
							onmouseout="this.style.color='teal';"
							onmouseover="this.style.color='#c24641';"><b>About us</b></p></a>
				</button>
				<font color=#C9C9C9>1212312</font>
			</td>
		</tr>
	</table>
	<br>
	<table align="center" bgcolor=silver width="80%" height="5%" border=1
		bordercolor=white cellpadding=20>
		<tr>
			<td><font color=teal size=4px><b>Create a group and enjoy!!!</b> </font></td>
		</tr>
	</table>
	<table align="center" background=img/bd.jpg width="80%" border=1
		cellpadding=10 bordercolor=white>
		<td>
			<form action="CreateGroup" method="post">
				<center>
					<font face=Cambria color=teal size=4>
					<br><label> <b>Group name:</b></label> <input type="text" name="gname" required> <br>
					<br>
					<label><b>Set destination: </b></label><input
						type="text" name="gdestination" required> <br>
					<br><label><b>Fix a date:</b></label> 
					<input type="text" name="gdate" placeholder="dd-mm-yyyy" 
					pattern="\d{1,2}-\d{1,2}-\d{4}" required> <br>
					<br>
<!-- 					<br><b>Fix a date:</b> <input type="date" name="grpdate" required> <br> -->
					
<!-- 					activeUser id adding to userId for adding to other webtravelbud tables sql -->
					<input type="hidden" id="userId" name="userId" value=<%=activeUser.getId()%>>
					
					</font> <input type="submit" value="Create travel group"
					style="font-face: 'Comic Sans MS'; 
							color: white; 
							border: white; 
							border-radius: 3px;
							background-color: teal;
							cursor: pointer;
							height: 30px;">
					<br><br>
				</center>
			</form>

		</td>
	</table>
	<table bgcolor=black align=center width=10% height=2%>
		<tr>
			<th><a href=#top style="text-decoration: none"><font
					color=white>Back to top</font></a></th>
		</tr>
	</table>
	<br>
	</table>
	<br>
	<table bgcolor=#c7c7c7 align=left height=20%>
		<tr>
			<td><font size=3 color=teal>About developer</font> <br> <font
				size=2>
					<p align=left>
						The developers of 'TRAVELBUD' are final year students studying BCT
						at KEC, Dhapakhel. <br>This site is originally created as an
						academic fulfillment for Final Year Major Project. <br>As
						travel lovers, they decided to develop a website to give
						onestopshop platform for travellers. <br>On this site, you
						can create travel groups, post videos/photos and write blogs
						related to your <br>travel for sharing your experience with
						ease.
					</p>
			</font></td>
		</tr>
	</table>
	<table bgcolor=#c7c7c7 align=left>
		<tr>
			<td></td>
		</tr>
	</table>
	<table bgcolor=#c7c7c7 align=right>
		<tr>
			<td><font size=4 color=teal>Sections:</font> <font size=3>
					<br>
				<br>Create Group <br>Post <br>Write blogs <br>About
					Us <br>Signup <br>
				<br>
			</font></td>
		</tr>
	</table>
	<table bgcolor=#c7c7c7 align=center width=40% height=5%>
		<tr>
			<td></td>
		</tr>
	</table>
	<br>
	<table bgcolor=#c7c7c7 align=center width=40% height=5%>
		<tr>
			<td></td>
		</tr>
	</table>
	<br>
	<table bgcolor=#c7c7c7 align=center width=40% height=5%>
		<tr>
			<td><p align=center>@ Copyright 2018 Travelbud : All Rights
					Reserved !!!</p></td>
		</tr>
	</table>
	<br>
	<br>
	<table align="center" bgcolor=black width="100%">
		<td>
			<p align=center text=white>
				<font color=white>Not until we are lost do we begin to
					understand ourselves - Henry David Thoreau</font>
			</p>
		</td>
	</table>
</body>

</html>