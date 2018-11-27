<%@page import="java.sql.Blob"%>
<%@page import="com.test.models.Blog"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Blog Posts</title>
<style>
img {
	width: 450px;
	height: 400px;
	object-fit: cover;
}
table{
border-collapse: collapse;
	border: none;
	
}
table td{
	word-wrap: break-word;
}

pre {
color: white;
white-space: pre-wrap;       /* Since CSS 2.1 */
    white-space: -moz-pre-wrap;  /* Mozilla, since 1999 */
    white-space: -pre-wrap;      /* Opera 4-6 */
    white-space: -o-pre-wrap;    /* Opera 7 */
	word-wrap: break-word;
	align:justify;
	font-family:"Helvetica"
}
</style>
</head>
<body alink=teal vlink=teal link=teal>

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

	<!-- <table align="center" bgcolor="white" width="80%" height="80%">
<td><img src="img\UC.jpg"></td>
<br>
</table> -->

	<hr width=80% align=center>

	<!-- align to a position and add action to forward to login if not logged in, add session management-->
	<h1 align=center style="background-color:teal; color:white;">Write blogs</h1>
	<!-- <form action="WriteBlog.jsp" method="post" width=80% align=center>
		<input type="submit" value="Write Blogs"
			style="cursor: pointer; font-face: 'Comic Sans MS'; color: white; border: white; border-radius: 3px; background-color: teal; height: 30px;">
	</form> -->
	<hr width=80% align=center>

	<table align="center" width="80%" bgcolor=gray
		style="table-layout: fixed;">
		<%
				List<Blog> blist = (List<Blog>) request.getAttribute("blist");
				// check for ulist available or not using if else
				for (Blog b : blist) {%>
		<tr style="background-color: rgba(192, 192, 192, 0.5);">
			<td width="40%">
<%-- 			<td><h3><%=b.getB_id() %></h3></td>  <!-- for checking if B_id present or not --> --%>
                 <%-- <% 
                 byte[] imgData = ((Blob) b.getBimage()).getBytes(1,
 						(int) ((Blob) b.getBimage()).length());

 				out.write(imgData);
 					out.flush();
 				out.close();

                 %>		 --%>
            
                 	<img name="Blog pic" src="PhotoRetrieve?b_id=<%=b.getB_id() %>" />
			
			</td>
			<td width="60%" align=left style="padding: 30px;">
			<h2 style="color:#c24641">| <%=b.getTitle()%> | <%=b.getAuthor()%>
				| <%=b.getDate()%> |<br></h2> 
				<pre width=300px color=white><%=b.getBody()%></pre>
			</td>
		</tr>

		<%
				}
			%>
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