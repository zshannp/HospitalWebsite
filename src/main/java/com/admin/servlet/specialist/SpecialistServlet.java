package com.admin.servlet.specialist;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.impl.SpecialistDaoImpl;
import com.db.DBConnect;

@WebServlet("/specialistServlet")
public class SpecialistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = request.getServletPath();
		System.out.println("Path: " + path);
		
		try {

			// Adding an specialist
			if (path.equals("/specialistServlet/add")) {
				String specialistName = request.getParameter("specialistName");
				SpecialistDaoImpl specialistDaoImpl = new SpecialistDaoImpl(DBConnect.getConnection());
				
				boolean isAdded = specialistDaoImpl.addSpecialist(specialistName);
				
				HttpSession session = request.getSession();
				
				if (isAdded) {
					session.setAttribute("successMessage", "Specialist Added");
					response.sendRedirect("../admin/index.jsp");
				} else {
					session.setAttribute("errorMessage", "Something Went Wrong");
					response.sendRedirect("../admin/index.jsp");
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
