package com.test.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.serviceimpl.BlogServiceImpl;
import com.test.serviceimpl.UserServiceImpl;
import com.test.services.BlogService;
import com.test.services.UserService;

/**
 * Servlet implementation class UBlogDeleteServlet
 */
@WebServlet("/UBlogDel")
public class UBlogDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UBlogDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer bid= Integer.parseInt(request.getParameter("ubdel"));
		System.out.println("Blog Delservlet: " + bid);
		BlogService bs = new BlogServiceImpl(); 
		if(bs.deleteBlog(bid)){
			System.out.println("Deleted blog: " + bid);
			request.setAttribute("bsdelSuccess", "Blog deleted successfully");
			request.getRequestDispatcher("Profile.jsp").forward(request, response);
		}else{
			System.out.println("Blog not deleted: " + bid);
			request.setAttribute("bdelNotSuccess", "Blog deletion unsuccessfully. Try again!!!");
			request.getRequestDispatcher("iBlog.jsp").forward(request, response);
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
