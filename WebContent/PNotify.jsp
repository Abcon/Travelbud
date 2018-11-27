<%@page import="com.test.serviceimpl.GroupServiceImpl"%>
<%@page import="com.test.services.GroupService"%>
<%@page import="com.test.models.User"%>
<%@page import="com.test.models.Group"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Your Notifications</title>
<style>
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
	background-color: cornflowerblue; /* Green background */
	border-width: 4px; /* Green border */
	border-color: gray;
	border-radius: 6px;
	color: white; /* White text */
	padding: 10px 24px; /* Some padding */
	cursor: pointer; /* Pointer/hand icon */
	width: 40%; /* Set a width if needed */
	display: block; /* Make the buttons appear below each other */
}

.btn-group button:not(:last-child)
{
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
<body alink=black vlink=black link=black background=white.jpg>

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
			onmouseout="this.style.color='black';"
			onmouseover="this.style.color='white';"><center>HOME</center></a></td>
		<td><a href="CDM.jsp" style="text-decoration: none"
			onmouseout="this.style.color='black';"
			onmouseover="this.style.color='white';"><center>CREATE
					GROUP</center></td>
		<td><a href="test.jsp" style="text-decoration: none"
			onmouseout="this.style.color='black';"
			onmouseover="this.style.color='white';"><center>POST</center></td>
		<td><a href="WriteBlog.jsp" style="text-decoration: none"
			onmouseout="this.style.color='black';"
			onmouseover="this.style.color='white';"><center>WRITE
					BLOGS</center></td>
		<td><a href="cardistry.jsp" style="text-decoration: none"
			onmouseout="this.style.color='black';"
			onmouseover="this.style.color='white';"><center>ABOUT US</center></td>


		<td bgcolor="black"></td>
		<td bgcolor="black"></td>
		<td bgcolor="black"></td>
		<td bgcolor=black border=0>solidfill1</td>
		</tr>
	</table>
	<span align=center>
		<h3 style="color: #c24641">Get notification of newly created groups here!!!</h3>
	</span>
	<br>
	<!-- ***change form action
 -->
	<table align="center" bgcolor=silver width="80%">

		<tr>
			<td>
				<div class="btn-group">

						<button>
							<a href="Profile.jsp">Profile</a>
						</button>

					<button>
						<a href="trip">Confirmed Trips</a>
					</button>
					<form action="iBlog" method="post">
						<input type="hidden" id="b_userId" name="b_userId"
							value=<%=activeUser.getId()%>>
					<button>
						Your Blogs
					</button>
					</form>
					<button>
						<a href="logout">Logout</a>
					</button>
				</div>
			</td>
		</tr>
		<tr>
		<tr height=10px>
		</tr>
<tr align=center>
		<td>
		
					<tr bgcolor=cornflowerblue>
					<td>Date</td>
					<td>Group name</td>
					<td>Destination</td>
					<td>Creator</td>
					<!-- <td>Confirm</td>
					<td>Decline</td> -->
				</tr>
				<%
				/* GroupService gs=new GroupServiceImpl();
				   List <Group> gulist=gs.getNotify(activeUser.getId()); */
					List<Group> uglist = (List<Group>) request.getAttribute("uglist"); 
					// check for gulist available or not using if else
					for (Group gu : uglist) {%>
				<tr style="background-color: rgba(192, 192, 192, 0.5);">
				<td><%=gu.getDate()%></td>
					<td><%=gu.getGname() %></td>
					<td><%=gu.getDestination()%></td>
					<td><%=gu.getId()%></td>
					<!-- <td><button>Confirm</button></td> change to input form if required
					<td><button>Decline</button></td> -->
				</tr>
				<%
					}
				%>
				
		
	</table>




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
			<td><font size=4 color="teal" face="Cambria">About
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
			<td><font size=4 color="#008080" face="Cambria">Sections:</font>
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