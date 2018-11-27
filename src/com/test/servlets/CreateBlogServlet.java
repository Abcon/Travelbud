package com.test.servlets;

import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


import com.test.db.DBConnection;
import com.test.models.Blog;

import com.test.serviceimpl.UserServiceImpl;
import com.test.services.UserService;

/**
 * Servlet implementation class CreateBlogServlet
 */
@WebServlet("/CreateBlog")
@MultipartConfig(maxFileSize = 16177216) //1.5MB
public class CreateBlogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateBlogServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/** 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int result = 0;
//		Part part = request.getPart("bimage");
////		Blob bblob = (Blob)request.getPart("bimage");
//		
//		if(part!=null){
//		//part check	
//		}
		String author= request.getParameter("authorc");
		String title= request.getParameter("titlec");
		String body=request.getParameter("bodyc");
		String date= request.getParameter("datec");
		String loc = request.getParameter("locationc");
		Integer id = Integer.parseInt(request.getParameter("userId"));
		
		Blog b = new Blog();
		b.setAuthor(author);
		b.setTitle(title);
		b.setBody(body);
		b.setDate(date);
		b.setLocation(loc);
		b.setId(id);
//		b.setBimage(part);
//		b.setBimage(bblob);
		UserService b_us = new UserServiceImpl();
		b_us.insertBlog(b);
		request.setAttribute("createdBlog", "Blog created successfully");
		System.out.println("New blog added to db - blog table with userId" + id);
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
