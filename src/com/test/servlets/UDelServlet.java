package com.test.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.serviceimpl.UserServiceImpl;
import com.test.services.UserService;

/**
 * Servlet implementation class UDelServlet
 */
@WebServlet("/uDel")
public class UDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UDelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer uid= Integer.parseInt(request.getParameter("duserId"));
		System.out.println("Delservlet: " + uid);
		UserService us = new UserServiceImpl();
		if(us.deleteUser(uid)){
			System.out.println("Deleted user: " + uid);
			request.setAttribute("pdelSuccess", "Profile deleted successfully");
			request.getRequestDispatcher("logout").forward(request, response);
		}else{
			System.out.println("User not deleted: " + uid);
			request.setAttribute("delNotSuccess", "Profile deletion unsuccessfully. Try again!!!");
			request.getRequestDispatcher("Profile.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
