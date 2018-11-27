package com.test.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.models.Blog;

import com.test.serviceimpl.BlogServiceImpl;
import com.test.services.BlogService;

/**
 * Servlet implementation class iBlogListServlet
 */
@WebServlet("/iBlog")
public class iBlogListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public iBlogListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer currentid = Integer.parseInt(request.getParameter("b_userId"));
		System.out.println("Blog Current user id:" + currentid);
		BlogService ibs = new BlogServiceImpl();
		List<Blog> ublist = ibs.getiBlogs(currentid);
		
		request.setAttribute("ublist", ublist);
	    if(ublist.isEmpty() || ublist==null){
	        request.setAttribute("noUBlogs", "You have yet to write a blog!!!");
	    }
	    
		request.getRequestDispatcher("iblog.jsp").forward(request, response);
		System.out.println("Blog servlet crossed");
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
