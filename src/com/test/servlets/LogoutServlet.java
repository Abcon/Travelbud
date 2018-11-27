package com.test.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LogoutServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
   
	//Redirect to doPost --- use it if a href used with /servlet-content-name in jsp else use form submit in jsp 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("activeUser");
		request.getSession().removeAttribute("activeAdmin");
		request.getSession().invalidate();
		
		request.setAttribute("delSuccess", request.getAttribute("pdelSuccess"));
		request.getRequestDispatcher("index.jsp").forward(request,response);
		System.out.println("Successful logout");
//		System.out.println(request.getContextPath());  //gives root path
		//does it help to change url path context
//		response.getWriter().append("Served at: ").append(request.getContextPath()).append("/home");
	}
	
	//	// Redirect POST request to GET request.
	//	   @Override
	//	   public void doPost(HttpServletRequest request, HttpServletResponse response)
	//	               throws IOException, ServletException {
	//	      doGet(request, response);
	//	   }
}
