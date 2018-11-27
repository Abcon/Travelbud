package com.test.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.models.Group;
import com.test.serviceimpl.GroupServiceImpl;
import com.test.services.GroupService;

/**
 * Servlet implementation class NotificationServlet
 */
@WebServlet("/notification")
public class NotificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NotificationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Integer currentid = Integer.parseInt(request.getParameter("n_userId"));
		System.out.println("Current user id:" + currentid);
		GroupService iGs = new GroupServiceImpl();
		List<Group> uglist = iGs.getNotify(currentid);
		
		request.setAttribute("uglist", uglist);
	
		request.getRequestDispatcher("PNotify.jsp").forward(request, response);
		System.out.println("Notification servlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
