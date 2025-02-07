package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.impl.AppointmentDaoImpl;
import com.dao.impl.DoctorDaoImpl;
import com.db.DBConnect;
import com.entity.Doctor;

@WebServlet("/doctorServlet")
public class DoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = request.getServletPath();
		System.out.println("Path: " + path);
		try {
			// Doctor Login Logic
			if (path.equals("/doctorServlet/login")) {

				String email = request.getParameter("email");
				String password = request.getParameter("password");

				DoctorDaoImpl doctorDaoImpl = new DoctorDaoImpl(DBConnect.getConnection());
				Doctor doctor = doctorDaoImpl.doctorLogin(email, password);

				HttpSession session = request.getSession();

				if (doctor == null) {
					// Email not found
					session.setAttribute("errorMessage", "You are not Registered!");
					response.sendRedirect("../doctor_login.jsp");
				} else if (!password.equals(doctor.getPassword())) {
					// Email found but the corresponding password with that email in database does
					// not matches with password coming in request object
					session.setAttribute("errorMessage", "Incorrect Password!");
					response.sendRedirect("../doctor_login.jsp");
				} else {
					// Both email and password matched correctly
					session.setAttribute("doctorObject", doctor);
					response.sendRedirect("../doctor/index.jsp");
				}
			}
			
			// Patient Status Update Logic
			if (path.equals("/doctorServlet/updateStatus")) {
				int id = Integer.parseInt(request.getParameter("id"));
				int did = Integer.parseInt(request.getParameter("did"));
				String comment = request.getParameter("comment");
				
				AppointmentDaoImpl appointmentDaoImpl = new AppointmentDaoImpl(DBConnect.getConnection());
				
				HttpSession session = request.getSession();
				
				boolean commented = appointmentDaoImpl.updateCommentStatus(id, did, comment);
				
				if (commented) {
					session.setAttribute("successMessage", "Comment Updated");
					response.sendRedirect("../doctor/patient.jsp");
				} else {					
					session.setAttribute("errorMessage", "Something went Wrong!");
					response.sendRedirect("../doctor/patient.jsp");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String path = request.getServletPath();
		System.out.println("Path: " + path);
		
		// Doctor Logout Logic
		if (path.equals("/doctorServlet/logout")) {
			HttpSession session = request.getSession();
			session.removeAttribute("doctorObject");
			session.setAttribute("successMessage", "Logout Successfull");
			response.sendRedirect("../doctor_login.jsp");
		}
	}

}
