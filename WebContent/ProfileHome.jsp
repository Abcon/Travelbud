<%@page import="com.test.models.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Travelbud Profile Home</title>
</head>
<body alink=black vlink=black link=black background=white.jpg>

<!-- commenting html tags ctrl shift / and \ -->
	<%
	//not allow to go back after login for HTTP 1.1
	response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
	//
	/* if(session.getAttribute("activeUser")==null){
	 	response.sendRedirect("login");	
	} */
	User activeUser=(User)session.getAttribute("activeUser");
    
    if(activeUser==null){ 
    	response.sendRedirect("login");
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
		
		<!-- <td> -->
		    
		<td>
		<a href="Profile.jsp" style="text-decoration: none; text-transform: uppercase;"	
			onmouseout="this.style.color='black';"
			onmouseover="this.style.color='white';"><%=activeUser.getUsername() %></a>
        </td>
        
              
		<td><a href="logout" style="text-decoration: none"
			onmouseout="this.style.color='black';"
			onmouseover="this.style.color='white';"><center>LOGOUT</center></a></td>
		
					<!-- <form action="logout" method="post">
					 <input type="submit" value="LOGOUT"
					    style="text-decoration: none; border:none; 
					    color:black;
					    font-size: 17px;
					    font-family: serif;
					    background-color:silver;"
						onmouseout="this.style.color='black';"
						onmouseover="this.style.color='white';">
					</form> -->
	   </td>
		
		<td bgcolor="black"></td>
		<td bgcolor="black"></td>
		<td bgcolor="black"></td>
		<td bgcolor=black border=0>solidfill1</td>
		</tr>
	</table>
	<table align="center" bgcolor="black" width="80%" height="5%">
		<tr></tr>
	</table>
	<br>
	<h3 align=center style="color:teal;">${createdBlog}</h3>
	<br>
	<table width="80%" align="center" cellpadding=20 bgcolor=#c9c9c9
		border=10 bordercolor=grey>
		<tr>
			<td background=img/bd.png><marquee behavior="scroll"
					direction="up">
					<img src="img/logo2.png" width=70 height=70><br> <br>
					<img src="img/logo1.png" width=70 height=70><br> <Br>
					<img src="img/logo3.png" width=70 height=70><br> <br>
				</marquee> <marquee behavior="scroll" direction="up">
					<img src="img/logo4.png" width=70 height=70><br> <br>
					<img src="img/logo2.png" width=70 height=70><br> <br>
					<img src="img/logo3.png" width=70 height=70><br> <br>
				</marquee> <marquee behavior="scroll" direction="up">
					<img src="img/logo1.png" width=70 height=70><br> <br>
					<img src="img/logo4.png" width=70 height=70><br> <br>
					<img src="img/logo3.png" width=70 height=70><br> <br>
				</marquee></td>
			<td>
				<hr> <font face="Rosewood Std Regular" size=10 color=#008080><center>WELCOME
						TO TRAVELBUD</center></font>
				<hr> <script>
					var image1 = new Image()
					image1.src = "img/1.jpg"
					var image2 = new Image()
					image2.src = "img/2.jpg"
					var image3 = new Image()
					image3.src = "img/3.jpg"
					var image4 = new Image()
					image4.src = "img/4.jpg"
					var image5 = new Image()
					image5.src = "img/5.jpg"
					var image6 = new Image()
					image6.src = "img/6.jpg"
				</script>
				<center>
					<img src="img/1.jpg" name="slide" width="800" height="480">
				</center> <script>
					var step = 1
					function slideit() {
						document.images.slide.src = eval("image" + step
								+ ".src")
						if (step < 8)
							step++
						else
							step = 1
							//call function "slideit()" 
						setTimeout("slideit()", 3000)
					}
					slideit()
				</script>
				<hr> <marquee behavior="scroll" direction="left"
					onmouseover="this.stop()" onmouseout="this.start()">
					<font face="Cambria" size=3 color="teal"> POPULAR
						DESTINATIONS --------- </font> <font face="Cambria" size=3> |
						JAMUNKHADI - Nepal | &nbsp;&nbsp;&nbsp;&nbsp; | MANANG |
						&nbsp;&nbsp;&nbsp;&nbsp; | ANNAPURNA CIRCUIT TREK |
						&nbsp;&nbsp;&nbsp;&nbsp; | SHAHID-SMARAK |
						&nbsp;&nbsp;&nbsp;&nbsp; | RUPSE FALL - MUSTANG |
						&nbsp;&nbsp;&nbsp;&nbsp; | GOSAIKUNDA LAKE |
						&nbsp;&nbsp;&nbsp;&nbsp; <a
						href="https://www.facebook.com/alish.bhomi"
						style="text-decoration: none"
						onmouseover="this.style.color='white'"
						onmouseout="this.style.color='black'"> Contact Us at facebook
					</a>
					</font>
					<marquee>
						<hr>
			</td>
			<td background=img/bd.png><marquee behavior="scroll"
					direction="up">
					<img src="img/logo2.png" width=70 height=70><br> <br>
					<img src="img/logo1.png" width=70 height=70><br> <br>
					<img src="img/logo3.png" width=70 height=70><br> <br>
				</marquee> <marquee behavior="scroll" direction="up">
					<img src="img/logo4.png" width=70 height=70><br> <br>
					<img src="img/logo2.png" width=70 height=70><br> <br>
					<img src="img/logo3.png" width=70 height=70><br> <br>
				</marquee> <marquee behavior="scroll" direction="up">
					<img src="img/logo1.png" width=70 height=70><br> <br>
					<img src="img/logo4.png" width=70 height=70><br> <br>
					<img src="img/logo3.png" width=70 height=70><br> <br>
				</marquee></td>
		</tr>
	</table>
	<br>
	<br>
	<table width="75%" align=center bgcolor=white bordercolor=#c7c7c7
		cellspacing=10>
		<tr>
			<td><font face="Cambria"> <b>This webpage is a
						onestopshop platform, travel photo and blogging hub for
						travellers.</b>
			</font></td>
			<td><font face="Cambria"> <font color="c24641">CREATE
						GROUP----></font><br> <br> Join a group, fix a date &
					destination, enjoy your travel.
			</font></td>
			<td><font face="Cambria"> <font color="c24641">POST----></font><br>
					<br> Upload thrilling, exciting and amazing videos & photos of
					your travel journey.
			</font></td>
			<td><font face="Cambria"> <font color="c24641">WRITE
						BLOGS----></font><br> <br> Share your travel experience with
					your words.
			</font></td>
			<td><font face="Cambria"> <font color="c24641">ABOUT
						US----></font><br> <br> Know what's Travelbud and the motto
					behind its creation.
			</font></td>
		</tr>
	</table>
	<br>
	<br>
	<table width="60%" height=45% align=center border=10 bordercolor=black
		bgcolor=white>
		<tr>
			<td><img src=img/7.jpg>
		</tr>
	</table>
	<hr>
	<!-- <table bgcolor=black align=center width=10% height=2%>
		<tr>
			<th><a href=#top style="text-decoration: none"><font
					color=white face="Cambria">Back to top</font></a></th>
		</tr>
	</table> -->
	
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