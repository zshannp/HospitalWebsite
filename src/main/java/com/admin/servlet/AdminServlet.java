package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.impl.DoctorDaoImpl;
import com.db.DBConnect;
import com.entity.Doctor;
import com.entity.User;

@WebServlet("/adminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = request.getServletPath();
		System.out.println("Path: " + path);

		try {

			// Admin Login Logic
			if (path.equals("/adminServlet/login")) {

				String email = request.getParameter("email");
				String password = request.getParameter("password");

				HttpSession session = request.getSession();

				if (email.equals("admin@gmail.com") && password.equals("12345")) {
					session.setAttribute("adminObject", new User());
					response.sendRedirect("../admin/index.jsp");
				} else {
					session.setAttribute("errorMessage", "Invalid Credentials");
					response.sendRedirect("../admin_login.jsp");
				}
			}

			// Registering a new Doctor Logic
			if (path.equals("/adminServlet/registerDoctor")) {

				String fullName = request.getParameter("fullName");
				String qualification = request.getParameter("qualification");
				String specialist = request.getParameter("specialist");
				int experience = Integer.parseInt(request.getParameter("experience"));
				String contact = request.getParameter("contact");
				String email = request.getParameter("email");
				String password = request.getParameter("password");

				Doctor doctor = new Doctor(fullName, qualification, specialist, experience, contact, email, password);

				DoctorDaoImpl doctorDaoImpl = new DoctorDaoImpl(DBConnect.getConnection());

				HttpSession session = request.getSession();

				if (doctorDaoImpl.registerDoctor(doctor)) {
					session.setAttribute("registerSuccessMessage", "Doctor Added Successfully");
					response.sendRedirect("../admin/doctor.jsp");
				} else {
					session.setAttribute("registerErrorMessage", "Something went Wrong!");
					response.sendRedirect("../admin/doctor.jsp");
				}
			}

			// Editing a Doctor's details Logic
			if (path.equals("/adminServlet/updateDoctor")) {

				DoctorDaoImpl doctorDaoImpl = new DoctorDaoImpl(DBConnect.getConnection());

				int id = Integer.parseInt(request.getParameter("id"));
				String fullName = request.getParameter("fullName");
				String qualification = request.getParameter("qualification");
				String specialist = request.getParameter("specialist");
				int experience = Integer.parseInt(request.getParameter("experience"));
				String contact = request.getParameter("contact");
				String email = request.getParameter("email");
				String password = request.getParameter("password");

				Doctor doctor = new Doctor(id, fullName, qualification, specialist, experience, contact, email,
						password);
				boolean isUpdated = doctorDaoImpl.updateDoctor(doctor);

				HttpSession session = request.getSession();
				String sourcePage = request.getParameter("sourcePage");

				if (isUpdated) {
					session.setAttribute("updateSuccessMessage", "Doctor Details Updated Successfully");
					response.sendRedirect("../admin" + sourcePage);
				} else {
					session.setAttribute("updateErrorMessage", "Something went Wrong");
					response.sendRedirect("../admin" + sourcePage);
				}

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

		// Admin Logout Logic
		if (path.equals("/adminServlet/logout")) {
			HttpSession session = request.getSession();
			session.removeAttribute("adminObject");
			session.setAttribute("successMessage", "Admin Log out Successful");
			response.sendRedirect("../admin_login.jsp");
		}

		// Deleting a doctor record logic
		if (path.equals("/adminServlet/deleteDoctor")) {
			int id = Integer.parseInt(request.getParameter("id"));

			DoctorDaoImpl doctorDaoImpl = new DoctorDaoImpl(DBConnect.getConnection());

			HttpSession session = request.getSession();
			String sourcePage = request.getParameter("sourcePage");

			if (doctorDaoImpl.deleteDoctor(id)) {
				session.setAttribute("deleteSuccessMessage", "Doctor Deleted Successfully");
				response.sendRedirect("admin/" + sourcePage);
			} else {
				session.setAttribute("deleteErrorMessage", "Something went Wrong");
				response.sendRedirect("admin/" + sourcePage);
			}

		}
	}

}
