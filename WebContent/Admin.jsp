<%@page import="com.test.models.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADMIN PANEL</title>
</head>
<body>
	<%-- <%
		//not allow to go back after login for HTTP 1.1
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

		if (session.getAttribute("activeAdmin") == null) {
			response.sendRedirect("login");
		}
	%> --%>
	Welcome: ${activeAdmin} ---> Please logout before closing
	<!-- Add alert message and redirect to this page
	when back button clicked -->
	<hr>

	<script type="text/javascript">
	//make a single js folder and call them here js/file.js
	
		//on back button presse
		window.onbeforeunload = function() {
			return "Please click cancel to logout before going back!!!";
		}
		
		function toggletable(){
			var x = document.getElementById("hiddenTable");
			var y = document.getElementById("pending");
		    if (x.style.display === "none") {
		    	y.style.display = "none";
		        x.style.display = "block";
		    } else {
		        x.style.display = "none";
		    }
		}
		function pendingPost(){
			var x = document.getElementById("hiddenTable");
			var y = document.getElementById("pending");
			if (x.style.display === "block" || y.style.display === "none") {
				x.style.display = "none"
				y.style.display = "block";
		    } else {
		        y.style.display = "none";
		    }
		}
	</script>

	<!-- use horizontal buttons css -->
	<button onclick="toggletable()">View Users</button>
	<button onclick="pendingPost()">Pending posts</button>
	<!-- <input type="button" value="LOGOUT" onclick="location.href='/logout'"></input> -->
	<form action="logout" method="post">
		<input type="submit" value="LOGOUT">
	</form>

	<div id="pending" style="display: none;">No Pending posts...</div>
	<div id="hiddenTable" style="display: none;">
		<table align="center" cellpadding="3px;" width=100%>
			<tr bgcolor=cornflowerblue>
				<td>First name</td>
				<td>Last name</td>
				<td>Address</td>
				<td>Phone No.</td>
				<td>UserName</td>
			</tr>
			<%
				List<User> ulist = (List<User>) request.getAttribute("ulist");
				// check for ulist available or not using if else
				for (User u : ulist) {
			%>
			<tr style="background-color: rgba(192, 192, 192, 0.5);">
				<td><%=u.getFname()%></td>
				<td><%=u.getLname()%></td>
				<td><%=u.getAddress()%></td>
				<td><%=u.getPhoneno()%></td>
				<td><%=u.getUsername()%></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>