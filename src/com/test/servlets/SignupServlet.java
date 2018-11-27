package com.test.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.models.User;
import com.test.serviceimpl.UserServiceImpl;
import com.test.services.UserService;

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    //when a href 'signup' text clicked, get calls so opens signup.jsp
    //if doPost(req,res) written in doGet directs to doPost and opens login.jsp
    //if no doGet, a href calls via get and error occurs url not support GET
    //Post more secure but slow as client/browser fetches jsp from disk via servlet processing
    //Get less secure but fast as done on client Eg: ?t1=2&t2=4 values displayed on url
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("signup.jsp").forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fn= request.getParameter("fname");
		String ln= request.getParameter("lname");
		String adr=request.getParameter("address");
		String pno= request.getParameter("phoneno");
		String un= request.getParameter("username");
		String psw= request.getParameter("password");
		String cpsw = request.getParameter("cpassword");
		
		User u= new User();
		
		if(psw.equals(cpsw)){
		u.setFname(fn);
		u.setLname(ln);
		u.setAddress(adr);
		u.setPhoneno(pno);
		u.setUsername(un);
		u.setPassword(psw);
		
		UserService us = new UserServiceImpl();
		us.signup(u);
		
		request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		else{
			request.setAttribute("errorPsw", "Password didn't matchup. Please enter carefully again!!!");
			request.getRequestDispatcher("signup.jsp").forward(request, response);
		}
	}

}
