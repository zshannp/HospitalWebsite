<%@page import="com.entity.User"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.impl.DoctorDaoImpl"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.impl.AppointmentDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Appointments</title>
<style>
/* Reuse existing styles from view_doctor.jsp */
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
	background: rgba(255, 255, 255, 0.9);
	border-radius: 10px;
	overflow: hidden;
}

.table thead {
	background: linear-gradient(135deg, #6a11cb, #2575fc);
	color: white;
}

.table th, .table td {
	padding: 12px 15px;
	vertical-align: middle;
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

.status-pending {
	background: linear-gradient(135deg, #ffc107, #ff9800);
	color: white;
	border-radius: 20px;
	padding: 0.25rem 1rem;
	text-align: center;
	display: inline-block;
	transition: all 0.3s ease;
}

.status-pending:hover {
	transform: translateY(-2px);
	box-shadow: 0 3px 8px rgba(255, 152, 0, 0.3);
}

/* Text truncation */
.table td {
	max-width: 200px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

/* Responsive adjustments */
@media ( max-width : 992px) {
	.table th:nth-child(2), /* Gender */ .table td:nth-child(2) {
		display: none;
	}
}

@media ( max-width : 768px) {
	.table th:nth-child(3), /* Age */ .table td:nth-child(3) {
		display: none;
	}
	.glass-card {
		margin: 0.5rem;
		padding: 1.5rem;
	}
	.form-title {
		font-size: 1.5rem;
	}
}
</style>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<c:if test="${empty userObject}">
		<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>

	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-12">
				<div class="glass-card">
					<h3 class="form-title">
						<i class="fas fa-calendar-check me-2"></i>My Appointments
					</h3>

					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th><i class="fas fa-user me-2"></i>Full Name</th>
									<th><i class="fas fa-venus-mars me-2"></i>Gender</th>
									<th><i class="fas fa-birthday-cake me-2"></i>Age</th>
									<th><i class="fas fa-calendar-day me-2"></i>Appointment</th>
									<th><i class="fas fa-disease me-2"></i>Disease</th>
									<th><i class="fas fa-user-md me-2"></i>Doctor</th>
									<th><i class="fas fa-info-circle me-2"></i>Status</th>
								</tr>
							</thead>
							<tbody>
								<%
								User user = (User) session.getAttribute("userObject");
								AppointmentDaoImpl appointmentDaoImpl = new AppointmentDaoImpl(DBConnect.getConnection());
								DoctorDaoImpl doctorDaoImpl = new DoctorDaoImpl(DBConnect.getConnection());
								List<Appointment> appointmentsList = appointmentDaoImpl.getAllAppointmentsByLoginUser(user.getId());

								if (appointmentsList.isEmpty()) {
								%>
								<tr>
									<td colspan="7" class="text-center text-muted py-4">No
										appointments found</td>
								</tr>
								<%
								} else {
								for (Appointment appointment : appointmentsList) {
									Doctor doctor = doctorDaoImpl.getDoctorById(appointment.getDoctorId());
								%>
								<tr>
									<td><%=appointment.getFullName()%></td>
									<td><%=appointment.getGender()%></td>
									<td><%=appointment.getAge()%></td>
									<td><%=appointment.getAppointmentDate()%></td>
									<td><%=appointment.getDisease()%></td>
									<td><%=doctor.getFullName()%></td>
									<td>
										<%
										String status = appointment.getStatus();
										String badgeColor = "bg-secondary";
										String icon = "fas fa-info-circle"; // Default icon

										switch (status) {
										case "Prescribed Medication":
											badgeColor = "bg-primary";
											icon = "fas fa-pills";
											break;
										case "Needs Further Tests":
											badgeColor = "bg-primary";
											icon = "fas fa-vial";
											break;
										case "Referred to Specialist":
											badgeColor = "bg-primary";
											icon = "fas fa-user-md";
											break;
										case "Follow-up Appointment Required":
											badgeColor = "bg-warning";
											icon = "fas fa-calendar-alt";
											break;
										case "Discharged":
											badgeColor = "bg-success";
											icon = "fas fa-check-circle";
											break;
										case "Under Observation":
											badgeColor = "bg-warning";
											icon = "fas fa-eye";
											break;
										case "Surgery Recommended":
											badgeColor = "bg-danger";
											icon = "fas fa-hospital";
											break;
										case "Patient Needs Counseling":
											badgeColor = "bg-orange";
											icon = "fas fa-comments";
											break;
										default:
											badgeColor = "bg-secondary";
											icon = "fas fa-info-circle";
										}
										%> <span class="badge <%=badgeColor%>"> <i
											class="<%=icon%> me-2"></i> <%=status%>
									</span>
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

	<%@include file="components/footer.jsp"%>
</body>
</html>