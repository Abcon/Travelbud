package com.test.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.models.User;
import com.test.serviceimpl.UserServiceImpl;
import com.test.services.UserService;

/**
 * Servlet implementation class UEditServlet
 */
@WebServlet("/uEdit")
public class UEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UEditServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String fn= request.getParameter("fnamep");
			String ln= request.getParameter("lnamep");
			String adr=request.getParameter("addressp");
			String pno = request.getParameter("phonep");
			String un= request.getParameter("usernamep");
			String psw= request.getParameter("passwordp");
			Integer id = Integer.parseInt(request.getParameter("userId"));
			
			User u= new User();
			u.setFname(fn);
			u.setLname(ln);
			u.setAddress(adr);
			u.setPhoneno(pno);
			u.setUsername(un);
			u.setPassword(psw);
			u.setId(id);

			UserService us = new UserServiceImpl();
			User activeUser=us.updateUser(u);
			if(activeUser!=null){
				HttpSession session  =  request.getSession();

				//		List<Upload> uploadedList=fd.uploadedList(validatedUser.getId());
				//		validatedUser.setUploadedList(uploadedList);
				System.out.println("User updated successfully");
				session.setAttribute("activeUser", activeUser);
				request.setAttribute("editSuccess", "Updated Successfully!!!");
				request.getRequestDispatcher("Profile.jsp").forward(request, response);
			}
			else{

				response.sendRedirect("Profile.jsp");
			}


		}catch(Exception e){
			e.printStackTrace();
		}


		//	 request.getRequestDispatcher("Profile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
