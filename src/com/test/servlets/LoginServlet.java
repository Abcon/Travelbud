package com.test.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.services.UserService;
import com.test.models.User;
import com.test.serviceimpl.UserServiceImpl;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	//Redirect to doPost
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//		doPost(request,response);
		String un =request.getParameter("usernamel");
		String psw=request.getParameter("passwordl");

		HttpSession session=request.getSession();

		UserService us = new UserServiceImpl();
		User activeUser = us.idSelect(un,psw);
		if(us.login(un, psw)){
						session.setAttribute("activeUser",activeUser); //globally accessible activeUser-un
			//			session.setMaxInactiveInterval(10);

			request.getRequestDispatcher("ProHome").forward(request, response);

			//						response.sendRedirect("ProfileHome.jsp");
			System.out.println("Login successful");

		}else{


			//			response.sendRedirect("login.jsp");
			//			PrintWriter out = response.getWriter();
			//			request.setAttribute("failed", "user does not exist!!");
			//			out.println("<script type=\"text/javascript\">");
			//			out.println("alert('Incorrect credentials')");
			//			out.println("location='login.jsp';");
			//			out.println("</script>");
			session.setAttribute("errorlogin", "Username or password is incorrect!!!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			System.out.println("Login Unsuccessful");

		}
		//		request.getRequestDispatcher("login.jsp").forward(request, response);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request,response);
	}
}
