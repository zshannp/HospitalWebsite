<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.impl.DoctorDaoImpl"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.impl.AppointmentDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../components/allcss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%@include file="logout.jsp"%>

	<div>

		<p>Patient Details</p>
		<table>
			<thead>
				<tr>
					<th><i class="fas fa-user me-2"></i>Full Name</th>
					<th><i class="fas fa-venus-mars me-2"></i>Gender</th>
					<th><i class="fas fa-birthday-cake me-2"></i>Age</th>
					<th><i class="fas fa-calendar-day me-2"></i>Appointment</th>
					<th><i class="fas fa-envelope me-2"></i>Email</th>
					<th><i class="fas fa-phone me-2"></i>Phone</th>
					<th><i class="fas fa-disease me-2"></i>Disease</th>
					<th><i class=""></i>Doctor Name</th>
					<th><i class=""></i>Address</th>
					<th><i class="fas fa-info-circle me-2"></i>Status</th>
				</tr>
			</thead>
			<tbody>
					<%
				AppointmentDaoImpl appointmentDaoImpl = new AppointmentDaoImpl(DBConnect.getConnection());

				DoctorDaoImpl doctorDaoImpl = new DoctorDaoImpl(DBConnect.getConnection());

				List<Appointment> appointmentsList = appointmentDaoImpl.getAllAppointments();
				for (Appointment appointment : appointmentsList) {
					Doctor doctor = doctorDaoImpl.getDoctorById(appointment.getDoctorId());
				%>
				<tr>
					<td><%=appointment.getFullName()%></td>
					<td><%=appointment.getGender()%></td>
					<td><%=appointment.getAge()%></td>
					<td><%=appointment.getAppointmentDate()%></td>
					<td><%=appointment.getEmail()%></td>
					<td><%=appointment.getPhone()%></td>
					<td><%=appointment.getDisease()%></td>
					<td><%=doctor.getFullName()%></td>
					<td><%=appointment.getAddress()%></td>
					<td><%=appointment.getStatus()%></td>
					<%
				}
				%>
				</tr>
			</tbody>
		</table>

	</div>

	<%@include file="../components/footer.jsp"%>
</body>
</html>