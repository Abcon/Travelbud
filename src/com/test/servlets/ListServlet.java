package com.test.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.models.User;
import com.test.serviceimpl.UserServiceImpl;
import com.test.services.UserService;

/**
 * Servlet implementation class ListServlet
 */
@WebServlet("/list")
public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//		if(request.getSession().getAttribute("activeAdmin")== null || request.getSession().getAttribute("activeuser").equals("")){
		//			
		//			request.getRequestDispatcher("index.jsp").forward(request, response);
		//		}else{
		UserService us = new UserServiceImpl();
		List<User> ulist = us.getAllUsers();
		
		request.setAttribute("ulist", ulist);
		request.getRequestDispatcher("Admin.jsp").forward(request,response);
		System.out.println("Admin Panel Opened");	
	}

	//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
