package com.test.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.models.Group;
import com.test.serviceimpl.GroupServiceImpl;
import com.test.services.GroupService;


/**
 * Servlet implementation class CreateGroupServlet
 */
@WebServlet("/CreateGroup")
public class CreateGroupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateGroupServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String gname= request.getParameter("gname");
		String dest= request.getParameter("gdestination");
		String gdate =request.getParameter("gdate");
		Integer id = Integer.parseInt(request.getParameter("userId"));
		
		Group g = new Group();
		g.setGname(gname);
		g.setDestination(dest);
		g.setDate(gdate);
		g.setId(id);
		
		GroupService gs = new GroupServiceImpl();
		gs.insertGroup(g);
		System.out.println("Activeuser - " + id);
		System.out.println("Group " + gname +" created");
		
		request.getRequestDispatcher("ProfileHome.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
