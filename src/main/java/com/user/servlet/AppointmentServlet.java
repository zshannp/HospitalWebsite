package com.user.servlet;

import java.io.IOException;
import java.nio.file.Path;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.impl.AppointmentDaoImpl;
import com.db.DBConnect;
import com.entity.Appointment;

/**
 * Servlet implementation class AppointmentServlet
 */
@WebServlet("/appointmentServlet")
public class AppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = request.getServletPath();
		System.out.println(path);
		
		// Add Appointment Logic
		if (path.equals("/appointmentServlet/addAppointment")) {
			
			System.out.println(request.getParameter("userObject"));
			int userId = Integer.parseInt(request.getParameter("userId"));
			String fullName = request.getParameter("fullName");
			String gender = request.getParameter("gender");
			String age = request.getParameter("age");
			String appointmentDate = request.getParameter("appointmentDate");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String disease = request.getParameter("disease");
			int doctorId = Integer.parseInt(request.getParameter("doctorId"));
			String address = request.getParameter("address");

			Appointment appointment = new Appointment(userId, fullName, gender, age, appointmentDate, email, phone,
					disease, doctorId, address, "pending");

			AppointmentDaoImpl appointmentDaoImpl = new AppointmentDaoImpl(DBConnect.getConnection());

			HttpSession session = request.getSession();

			if (appointmentDaoImpl.addAppointment(appointment)) {
				session.setAttribute("successMessage", "Appointment Successfull");
				response.sendRedirect("../user_appointment.jsp");
			} else {
				session.setAttribute("errorMessage", "Something went Wrong!");
				response.sendRedirect("../user_appointment.jsp");
			}
		}
	}

}
