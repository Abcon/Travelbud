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
 * Servlet implementation class UBlogUpdateServlet
 */
@WebServlet("/UBlogUpdate")
public class UBlogUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UBlogUpdateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String author= request.getParameter("bauthorc");
			String title= request.getParameter("btitlec");
			String body=request.getParameter("bbodyc");
			String date = request.getParameter("bdatec");
			String loc= request.getParameter("blocationc");

			Integer bsid = Integer.parseInt(request.getParameter("bsBId"));
			System.out.println("Singe blog selected id: "+bsid);
			Blog b = new Blog();
			b.setB_id(bsid);           //always check set id type whether id or bsid or another id
			b.setAuthor(author);
			b.setTitle(title);
			b.setBody(body);
			b.setDate(date);
			b.setLocation(loc);
			System.out.println(author+title+body+date+loc);
			BlogService bs = new BlogServiceImpl();
			bs.updateBlog(b);
			
				request.setAttribute("bEditSuccess", "Your blog updated successfully!!!");
				request.getRequestDispatcher("Profile.jsp").forward(request, response);
				System.out.println("Blog updated successfully");

			
		}catch(Exception e){
			e.printStackTrace();
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
