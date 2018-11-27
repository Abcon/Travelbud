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
import com.test.serviceimpl.UserServiceImpl;
import com.test.services.BlogService;
import com.test.services.UserService;



/**
 * Servlet implementation class UserPhoto
 */
@WebServlet("/PhotoRetrieve")
public class PhotoRetrieve extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PhotoRetrieve() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		try (ServletOutputStream out = response.getOutputStream()) {
			
			BlogService bs = new BlogServiceImpl();
			
             if(request.getParameter("b_id")!=null){
            	 System.out.println(request.getParameter("b_id")+"bid here");
            	 
            	 Integer a = Integer.parseInt(request.getParameter("b_id"));
            	
            	 List<Blog> blist = bs.getAllBlogs();
            	 for(Blog b: blist){
            		 if(a==b.getB_id()){
            			 System.out.println("bid i matched");
            		
            		 byte[] imgData = ((Blob) b.getBimage()).getBytes(1,
          					(int) ((Blob) b.getBimage()).length());

            		 out.write(imgData);
          			out.flush();
          			out.close();
            		 }
            	 }
  
             }
             
		} catch (Exception e) {
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
