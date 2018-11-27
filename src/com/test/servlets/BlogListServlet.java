package com.test.servlets;

import java.io.IOException;
import java.sql.Blob;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.models.Blog;
import com.test.serviceimpl.BlogServiceImpl;
import com.test.services.BlogService;

/**
 * Servlet implementation class BlogListServlet
 */
@WebServlet("/BlogList")
public class BlogListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BlogListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		try (ServletOutputStream out = response.getOutputStream()) {
//
//			BlogService bs = new BlogServiceImpl();
//
//			if(request.getParameter("b_id")!=null){
//
//
//				List<Blog> blist = bs.getAllBlogs();
//				for(Blog b: blist){
//					byte[] imgData = ((Blob) b.getBimage()).getBytes(1,
//							(int) ((Blob) b.getBimage()).length());
//
//					out.write(imgData);
//					out.flush();
//					out.close();
//				}
//
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		BlogService bs = new BlogServiceImpl();
		List<Blog> blist = bs.getAllBlogs();

		request.setAttribute("blist", blist);

		request.getRequestDispatcher("maincards.jsp").forward(request, response);;
		System.out.println("List on Home blogs section has been displayed + passed to writeblog jsp");	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}


////forwarding blist to maincards and writeblog jsp at once 
//		RequestDispatcher dispatcher1 =  request.getRequestDispatcher("maincards.jsp");
//		dispatcher1.forward(request, response);
//		RequestDispatcher dispatcher2 = request.getRequestDispatcher("WriteBlog.jsp"); 
//		dispatcher2.forward(request, response);
//		
//		//dispatcher.include(req,res) upon calling showed both jsp pages in the same page
//		//dispatcher.forward forwards but unknown error - nullpointer 