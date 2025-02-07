<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.impl.AppointmentDaoImpl"%>
<%@page import="com.entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Appointments</title>
<style>
/* Reuse existing styles */
body {
	background: linear-gradient(135deg, #f8f9fa, #e9ecef);
	min-height: 100vh;
	font-family: 'Arial', sans-serif;
}

.glass-card {
	background: rgba(255, 255, 255, 0.95);
	backdrop-filter: blur(10px);
	border-radius: 15px;
	box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
	border: 1px solid rgba(255, 255, 255, 0.18);
	padding: 2rem;
	margin: 1rem 0;
}

.form-title {
	color: #2575fc;
	font-weight: 700;
	text-align: center;
	margin-bottom: 2rem;
	font-size: 1.8rem;
}

.table {
    border-collapse: collapse;
    width: 100%;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    background: rgba(255, 255, 255, 0.95);
    border-radius: 10px;
    overflow: hidden;
    margin: 1.5rem 0;
}

.table thead {
    background: linear-gradient(135deg, #6a11cb, #2575fc);
    color: white;
}

.table th {
    font-weight: 600;
    letter-spacing: 0.5px;
    text-transform: uppercase;
    font-size: 0.9rem;
}

.table th, .table td {
    padding: 1rem 1.5rem;
    vertical-align: middle;
    border-bottom: 1px solid rgba(0, 0, 0, 0.05);
}

.table tbody tr {
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

.table tbody tr:nth-child(even) {
    background-color: #f8f9fa;
}

.table tbody tr:hover {
    background-color: #e9ecef;
    transform: translateX(4px);
}

.status-badge {
    border-radius: 20px;
    padding: 0.35rem 1.25rem;
    font-size: 0.85rem;
    font-weight: 500;
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
}

.status-pending {
    background: linear-gradient(135deg, #ffc107, #ff9800);
    color: white;
}

.status-completed {
    background: linear-gradient(135deg, #28a745, #218838);
    color: white;
}

.btn-comment {
    background: linear-gradient(135deg, #6a11cb, #2575fc);
    color: white !important;
    padding: 0.4rem 1.2rem;
    border-radius: 20px;
    font-size: 0.9rem;
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    text-decoration: none !important;
}

.btn-comment:hover {
    transform: translateY(-2px);
    box-shadow: 0 3px 12px rgba(106, 17, 203, 0.25);
}

.btn-comment.disabled {
    background: linear-gradient(135deg, #adb5bd, #6c757d);
    pointer-events: none;
    opacity: 0.8;
}

/* Improved text truncation */
.table td {
    max-width: 220px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

/* Enhanced responsive handling */
@media (max-width: 1200px) {
    .table th:nth-child(5),
    .table td:nth-child(5) { /* Email */
        display: none;
    }
}

@media (max-width: 992px) {
    .table th:nth-child(2),
    .table td:nth-child(2), /* Gender */
    .table th:nth-child(6),
    .table td:nth-child(6) { /* Phone */
        display: none;
    }
}

@media (max-width: 768px) {
    .table th:nth-child(3),
    .table td:nth-child(3), /* Age */
    .table th:nth-child(7),
    .table td:nth-child(7) { /* Disease */
        display: none;
    }
    
    .table th, .table td {
        padding: 0.75rem 1rem;
    }
    
    .btn-comment {
        padding: 0.3rem 1rem;
        font-size: 0.8rem;
    }
}

@media (max-width: 576px) {
    .table th:nth-child(4),
    .table td:nth-child(4) { /* Appointment Date */
        display: none;
    }
    
    .status-badge {
        padding: 0.25rem 1rem;
        font-size: 0.8rem;
    }
}

.btn-comment.disabled {
	pointer-events: none;
	opacity: 0.7;
}
</style>
</head>
<body>
	<%@include file="logout.jsp"%>
	<%@include file="navbar.jsp"%>

	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-12">
				<div class="glass-card">
					<h3 class="form-title">
						<i class="fas fa-user-injured me-2"></i>Patient Appointments
					</h3>

					<c:if test="${not empty errorMessage}">
						<div class="alert alert-danger alert-message">
							${errorMessage}</div>
						<c:remove var="errorMessage" scope="session" />
					</c:if>

					<c:if test="${not empty successMessage}">
						<div class="alert alert-success alert-message">
							${successMessage}</div>
						<c:remove var="successMessage" scope="session" />
					</c:if>

					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th><i class="fas fa-user me-2"></i>Full Name</th>
									<th><i class="fas fa-venus-mars me-2"></i>Gender</th>
									<th><i class="fas fa-birthday-cake me-2"></i>Age</th>
									<th><i class="fas fa-calendar-day me-2"></i>Appointment</th>
									<th><i class="fas fa-envelope me-2"></i>Email</th>
									<th><i class="fas fa-phone me-2"></i>Phone</th>
									<th><i class="fas fa-disease me-2"></i>Disease</th>
									<th><i class="fas fa-info-circle me-2"></i>Status</th>
									<th><i class="fas fa-comment-medical me-2"></i>Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								Doctor doctor = (Doctor) session.getAttribute("doctorObject");
								AppointmentDaoImpl appointmentDaoImpl = new AppointmentDaoImpl(DBConnect.getConnection());
								List<Appointment> appointmentsList = appointmentDaoImpl.getAllAppointmentsByDoctorLogin(doctor.getId());

								if (appointmentsList.isEmpty()) {
								%>
								<tr>
									<td colspan="9" class="text-center text-muted py-4">No
										appointments found</td>
								</tr>
								<%
								} else {
								for (Appointment appointment : appointmentsList) {
								%>
								<tr>
									<td><%=appointment.getFullName()%></td>
									<td><%=appointment.getGender()%></td>
									<td><%=appointment.getAge()%></td>
									<td><%=appointment.getAppointmentDate()%></td>
									<td><%=appointment.getEmail()%></td>
									<td><%=appointment.getPhone()%></td>
									<td><%=appointment.getDisease()%></td>
									<td><span
										class="status-badge <%=appointment.getStatus().equalsIgnoreCase("Pending") ? "status-pending" : "status-completed"%>">
											<%=appointment.getStatus()%>
									</span></td>
									<td>
										<%
										if ("Pending".equalsIgnoreCase(appointment.getStatus())) {
										%> <a href="comment.jsp?id=<%=appointment.getId()%>"
										class="btn-comment"> <i
											class="fas fa-comment-medical me-2"></i>Comment
									</a> <%
 } else {
 %> <a href="#" class="btn-comment disabled"
										.btn-comment.disabled {
    pointer-events:none;
    opacity: 0.5;
}
									 	>
											<i class="fas fa-comment-medical me-2"></i>Comment
									</a> <%
 }
 %>
									</td>
								</tr>
								<%
								}
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>