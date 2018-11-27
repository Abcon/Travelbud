<%@page import="com.test.models.Blog"%>
<%@page import="java.util.List"%>
<%@page import="com.test.models.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Your Blogs</title>
<style>
table {
	border-collapse: collapse;
	border: none;
}

table td {
	word-wrap: break-word;
}

pre {
	color: white;
	white-space: pre-wrap; /* Since CSS 2.1 */
	white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
	white-space: -pre-wrap; /* Opera 4-6 */
	white-space: -o-pre-wrap; /* Opera 7 */
	word-wrap: break-word;
	align: justify;
	font-family: "Helvetica"
}

label {
	background-color: cornflowerblue; /* Green background */
	border-radius: 3px;
	color: white; /* White text */
	padding: 10px 24px; /* Some padding */
	/* font-weight:bold; */
}

input {
	background-color: gray; /* Green background */
	border-radius: 3px;
	color: white; /* White text */
	padding: 10px 24px; /* Some padding */
}

.btn-group button {
	background-color: #c24641; /* Green background */
	border-width: 4px; /* Green border */
	border-color: gray;
	border-radius: 6px;
	color: white; /* White text */
	padding: 10px 24px; /* Some padding */
	cursor: pointer; /* Pointer/hand icon */
	width: 40%; /* Set a width if needed */
	display: block; /* Make the buttons appear below each other */
}

.btn-group button:not (:last-child ) {
	border-bottom: none; /* Prevent double borders */
}

.btn-group button a {
	text-decoration: none;
	color: white;
}
/* Add a background color on hover */
.btn-group button:hover {
	background-color: gray;
}
</style>
</head>
<body alink=#c24641 vlink=#c24641 link=#c24641 background=white.jpg>

	<%-- <%
	if(session.getAttribute("activeUser")==null){
	 	response.sendRedirect("login");	
	}
    %> --%>
	<%
		//not allow to go back after login for HTTP 1.1
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		User activeUser = (User) session.getAttribute("activeUser");
		if (activeUser == null) {
	%>

	response.sendRedirect("login");
	<%
		}
	%>
	<a name=top></a>
	<table align="center" bgcolor=silver width="80%">
		<td><img src=img/travelbud.png width=200 height=100></td>
		<td bgcolor="black" border=0>solidfill</td>
		<td bgcolor="black"></td>
		<td bgcolor="black"></td>
		<td bgcolor="black"></td>
		<td><a href="index.jsp" style="text-decoration: none"
			onmouseout="this.style.color='#c24641';"
			onmouseover="this.style.color='white';"><center>HOME</center></a></td>
		<td><a href="CDM.jsp" style="text-decoration: none"
			onmouseout="this.style.color='#c24641';"
			onmouseover="this.style.color='white';"><center>CREATE
					GROUP</center></td>
		<td><a href="test.jsp" style="text-decoration: none"
			onmouseout="this.style.color='#c24641';"
			onmouseover="this.style.color='white';"><center>POST</center></td>
		<td><a href="WriteBlog.jsp" style="text-decoration: none"
			onmouseout="this.style.color='#c24641';"
			onmouseover="this.style.color='white';"><center>WRITE
					BLOGS</center></td>
		<td><a href="cardistry.jsp" style="text-decoration: none"
			onmouseout="this.style.color='#c24641';"
			onmouseover="this.style.color='white';"><center>ABOUT US</center></td>


		<td bgcolor="black"></td>
		<td bgcolor="black"></td>
		<td bgcolor="black"></td>
		<td bgcolor=black border=0>solidfill1</td>
		</tr>
	</table>
	<span align=center>
		<h3 style="color: #c24641;">You
			can view and edit your blogs here!!!</h3>
	</span>
	<br>
	<!-- ***change form action
 -->
	<table align="center" bgcolor=silver width="80%">

		<tr>
			<td>
				<div class="btn-group">

					<form action="notification" method="post">
						<input type="hidden" id="n_userId" name="n_userId"
							value=<%=activeUser.getId()%>>
						<button type="submit" name="pNotify">Notifications</button>
					</form>

					<button>
						<a href="trip">Confirmed Trips</a>
					</button>
					<button>
						<a href="Profile.jsp">Profile</a>
					</button>
					<button>
						<a href="logout">Logout</a>
					</button>
				</div>
			</td>
		</tr>
		<tr>
		<tr height=10px>
		</tr>
		<tr align=center style="color:red;">${bdelNotSuccess}</tr>
	</table>

	<table align="center" width="80%" bgcolor=gray
		style="table-layout: fixed;">
		      <td align=center ><h2 style="background-color:#c24641; color:white;">${noUBlogs}</h2></td>
		<%
			List<Blog> ublist = (List<Blog>) request.getAttribute("ublist");
			// check for ulist available or not using if else
			for (Blog ub : ublist) {
		%>
		<tr style="background-color: rgba(192, 192, 192, 0.5);">
			<td width="40%"><img name="Blog pic" style="width: 450px; height: 400px; object-fit: cover;"
			 src="PhotoRetrieve?b_id=<%=ub.getB_id() %>" />
				</td>
			<td width="60%" align=left style="padding: 30px;">
				<h2 style="color: #c24641">
					|
					<%=ub.getTitle()%>
					|
					<%=ub.getAuthor()%>
					|
					<%=ub.getDate()%>
					|<br>
					<%String u= (String) ub.getBody();%>
					
				</h2> 
<!-- 				Note textarea text must be greater than 250 othewise substring line error -->
				<pre width=300px color=white><%=u.substring(0,250)%><b>...</b></pre>
				<form action="UBlogEdit" method="post">
						<input type="hidden" id="ubedit" name="ubedit" value=<%=ub.getB_id()%>>
						<button style="color: white; border: white; 
	                  border-radius: 3px; cursor: pointer; background-color: 
					 #c24641; height: 30px;">Edit</button>
					</form>
				
					 <br>
					 <br>
					 <form action="UBlogDel" method="post">
					 <input type="hidden" id="ubdel" name="ubdel" value=<%=ub.getB_id()%>>
						<button style="color: white; border: white; 
	                  border-radius: 3px; cursor: pointer; background-color: 
					 #c24641;  height: 30px;">Delete</button>
					</form>
					 
			</td>
			
		</tr>
		<%
			}
		%>
	</table>
	<br>




	<hr size=10 color=black align=center width=80%>
	<table align=center width=75% " height=7% bgcolor=silver>
		<tr bgcolor=black align=center width=10% height=2%>
			<th><a href=#top style="text-decoration: none"><font
					color=white face="Cambria">Back to top</font></a></th>
		</tr>
		<tr>
			<td>
				<center>
					<b><font face="Cambria" size=7><a href="index.jsp"
							style="text-decoration: none"
							onmouseout="this.style.color='black';"
							onmouseover="this.style.color='white';">TRAVELBUD</a></font></b> <b><font
						face="Cambria" size=5>TRAVELBUD</a></font></b> <b><font face="Cambria"
						size=3>TRAVELBUD</a></font></b> <b><font face="Cambria" size=1>TRAVELBUD</font></b>
					<b><font face="Cambria" size=3>TRAVELBUD</font></b> <b><font
						face="Cambria" size=5>TRAVELBUD</font></b> <b><font face="Cambria"
						size=7><a href="index.jsp" style="text-decoration: none"
							onmouseout="this.style.color='black';"
							onmouseover="this.style.color='white';">TRAVELBUD</a></font></b>
				</center>
			</td>
		</tr>
	</table>
	<br>
	</table>
	<br>
	<table bgcolor=#c7c7c7 align=left height=20%>
		<tr>
			<td><font size=5 color="#c24641" face="Cambria">About
					developers</font> <br> <font size=2 face="Cambria">
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
			<td><font size=5 color="#c24641" face="Cambria">Sections:</font>
				<font size=3 face=Cambria> <br> <br>Create Group <br>Post
					<br>Write blogs <br>About Us <br>Signup <br> <br>
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
			<th><font face=Cambria>@ Copyright 2018 Travelbud : All
					Rights Reserved !!!</font></th>
		</tr>
	</table>
	<br>
	<br>
	<table align="center" bgcolor=black width="100%">
		<td><font color=white face=Cambria><center>Not
					until we are lost do we begin to understand ourselves - Henry David
					Thoreau</center></font></td>
	</table>

</body>

</html>