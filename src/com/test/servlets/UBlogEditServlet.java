package com.test.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.models.Blog;
import com.test.serviceimpl.BlogServiceImpl;
import com.test.services.BlogService;

/**
 * Servlet implementation class UBlogEditServlet
 */
@WebServlet("/UBlogEdit")
public class UBlogEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UBlogEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer ub_id=Integer.parseInt(request.getParameter("ubedit"));
		BlogService bs = new BlogServiceImpl();
		Blog singleBlog = bs.getsingleBlogs(ub_id);
		System.out.println("Individual blog id: "+ub_id);
	    request.setAttribute("bsingle", singleBlog);
		request.getRequestDispatcher("UBlogEdit.jsp").forward(request, response);
		System.out.println("UBlogEdit crossed");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
