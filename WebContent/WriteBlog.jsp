<%@page import="com.test.models.Blog"%>
<%@page import="java.util.List"%>
<%@page import="com.test.models.User"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Random"%>
<%-- <%@page contentType="text/html" pageEncoding="UTF-8">
 --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Write a blog</title>
</head>
<body alink=teal vlink=teal link=teal>

	<script src="js/btntoggle.js"></script>
	<%
		//not allow to go back after login for HTTP 1.1
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		//
		/* if(session.getAttribute("activeUser")==null){
		 	response.sendRedirect("login");	
		} */
		User activeUser = (User) session.getAttribute("activeUser");

		if (activeUser == null) {
			response.sendRedirect("login");
		}
	%>
	
	<a name=top></a>
	<table align="center" bgcolor="#c9c9c9" width="80%" height="13%">
		<td><b><font color=#C9C9C9>123456</font><font face="Georgia"
				size=10><a href="index.jsp" style="text-decoration: none"
					onmouseout="this.style.color='teal';"
					onmouseover="this.style.color='#c0c0c0';">WRITE BLOGS</a></font></b></td>
		<tr align=right>
			<td>
				<button style="background-color: #c0c0c0; width: 120; height: 25">
					<a href="CDM.jsp" style="text-decoration: none"><p
							onmouseout="this.style.color='teal';"
							onmouseover="this.style.color='#c24641';">GROUP</p></a>
				</button>
				<button style="background-color: #c0c0c0; width: 80; height: 25">
					<a href="test.jsp" style="text-decoration: none"><p
							onmouseout="this.style.color='teal';"
							onmouseover="this.style.color='#c24641';">POST</p></a>
				</button>
				<button style="background-color: #c0c0c0; width: 110; height: 25">
					<a href="cardistry.jsp" style="text-decoration: none"><p
							onmouseout="this.style.color='teal';"
							onmouseover="this.style.color='#c24641';">ABOUT US</p></a>
				</button>
			</td>
		</tr>
	</table>
	<br>
	<table align="center" bgcolor="black" width="80%" height="5%">
		<tr>
			<td><font color=black>12345</font><font color=white>Write
					travel blogs </font> <font color=#c24641>»»»»»»»»»<font color=white>»»»»»»»»»»<font
						color=#c24641>»»»»»»»»»</font><font color=white> Share <font
							color=#c24641>your <font color=white>experience </font> <font
								color=#c24641>»»»»»»»»»»»»»»»»»»<font color=white>»»»»»»»»»»»»»»»»»»»<font
										color=#c24641>»»»»»»»»»»»»»»»»»»</font></td>
		</tr>
		<table bgcolor=black align=center width=10% height=2%>
			<tr>
				<th><a href="index.jsp" style="text-decoration: none"><font
						color=white>Home</font></a></th>
			</tr>
		</table>
	</table>
	
	
	<hr>
	<table align=center>
		<tr>
			<td>
				<button style="font-face: 'Comic Sans MS'; 
				color: white; border: white; border-radius: 3px; 
				background-color: cornflowerblue; height: 30px; cursor: pointer;">
				<a href="BlogList" style="text-decoration:none; color:white;">View all Blogs</a>
				</button>
			</td></tr>
			
	</table>
	<hr>
	<h3 align=center style="color:#c24641;">
	||||||||||||Please type at least 250 words/characters inside body text||||||||||||
	</h3>
	<hr>
	
	
	<div id="wblogDiv">
		<form action="CreateBlog" method="post" id="blogform">
		<!-- 
			enctype="multipart/form-data" -->

			<!-- activeUser id adding to userId for adding to other webtravelbud tables sql -->
			<input type="hidden" id="userId" name="userId"
				value=<%=activeUser.getId()%>>
				

			<table align="center" cellpadding="3px;" width=100%>
				<tr bgcolor=cornflowerblue>
					<td><b>Title</b></td>
					<td><input type="text" name="titlec" required="required"
						style="border-color: cornflowerblue;"></td>
				</tr>
				<tr bgcolor=cornflowerblue>
					<td><b>Location</b></td>
					<td><input type="text" name="locationc" required="required"
						style="border-color: cornflowerblue;"></td>
				</tr>

				<tr style="background-color: rgba(192, 192, 192, 0.5);">
					<td><b>Body text</b></td>
					<td><pre><textarea rows="50" cols="50" name="bodyc" form="blogform"
							required="required" maxlength="10000"
							style="border-color: cornflowerblue; width: 800px; height: 400px;"
							placeholder="Enter your thoughts and experience here!!! Upto 1000 characters only">
							</textarea></pre></td>
				</tr>

				<tr bgcolor=cornflowerblue>
					<td><b>Author</b></td>
					<td><input type="text" name="authorc" required="required"
						style="border-color: cornflowerblue;"></td>
				</tr>
				<tr bgcolor=cornflowerblue>
					<td><b>Date(DD-MM-YYYY)</b></td>
					<td><input type="text" name="datec" required="required"
						style="border-color: cornflowerblue;"></td>
				</tr>

				<!-- <tr bgcolor=cornflowerblue>
					<td><b>Image</b></td>
					<td><input type="file" name="bimage"
						style="border-color: cornflowerblue;" required>
						</td>
				</tr> -->

				<tr>
					<th>
					<th align=center><input type="submit" value="Post Blog"
						id="createB" 
						style="cursor:pointer; font-face: 'Comic Sans MS'; color: white; border: white; border-radius: 3px; background-color: cornflowerblue; height: 30px;">
					</th>
					</th>
				</tr>
			</table>
		</form>
	</div>
	<hr>
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
					<br> <br>Create Group <br>Post <br>Write blogs
					<br>About Us <br>Signup <br> <br>
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
				<font color=white>Practice doesn't make you perfect, but
					practice makes permanent.</font>
			</p>
		</td>
	</table>
</body>
</html>