package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.impl.UserDaoImpl;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/userServlet")
public class UserServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = request.getServletPath();
		System.out.println("Path: " + path);

		try {

			// User Login Logic
			if (path.equals("/userServlet/login")) {
				String email = request.getParameter("email");
				String password = request.getParameter("password");

				UserDaoImpl userDaoImpl = new UserDaoImpl(DBConnect.getConnection());

				User user = userDaoImpl.userLogin(email, password);
				HttpSession session = request.getSession();
				
				if (user == null) {
					// Email not found
					session.setAttribute("errorMessage", "User Not Found!");
					response.sendRedirect("../user_login.jsp");
				} else if (!password.equals(user.getPassword())) {
					// Email found but the corresponding password with that email in database does
					// not matches with password coming in request object
					session.setAttribute("errorMessage", "Incorrect Password!");
					response.sendRedirect("../user_login.jsp");
				} else {
					// Both email and password matched correctly
					session.setAttribute("userObject", user);
					response.sendRedirect("../index.jsp");
				}
				
			}

			// User Registration Logic
			if (path.equals("/userServlet/register")) {
				UserDaoImpl userDaoImpl = new UserDaoImpl(DBConnect.getConnection());

				User user = new User(request.getParameter("fullName"), request.getParameter("email"),
						request.getParameter("password"));
				boolean gotRegistered = userDaoImpl.userRegister(user);

				HttpSession session = request.getSession();
				if (gotRegistered) {
					System.out.println("User Registered Successfully!");
					session.setAttribute("successMessage", "Registration successful! Please log in.");
					response.sendRedirect("../user_register.jsp");
				} else {
					System.out.println("User Registration Failed!");
					session.setAttribute("errorMessage", "Email already registered! Try logging in.");
					response.sendRedirect("../user_register.jsp");
				}
			}
			
			// User Password Change Logic
			if (path.equals("/userServlet/changePassword")) {
				UserDaoImpl userDaoImpl = new UserDaoImpl(DBConnect.getConnection());
				
				
				
			}
			
			// User Appointment with Doctor Logic
			if (path.endsWith("/userServlet/appointment")) {
				
			}
			
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = request.getServletPath();
		System.out.println("Path: " + path);
		
		// User Logout Logic
		if (path.equals("/userServlet/logout")) {
			System.out.println(path);
			HttpSession session = request.getSession();
			session.removeAttribute("userObject");
			session.setAttribute("successMessage", "Logout Successful!");
			response.sendRedirect("../user_login.jsp");
		}
	}

}
