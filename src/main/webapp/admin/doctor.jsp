<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.impl.DoctorDaoImpl"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.impl.SpecialistDaoImpl"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>
<%@include file="../components/allcss.jsp"%>
<style>
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

.input-icon {
	position: relative;
}

.input-icon i {
	position: absolute;
	left: 15px;
	top: 50%;
	transform: translateY(-50%);
	color: #6a11cb;
}

.input-icon input, .input-icon select {
	padding-left: 40px;
}

.btn-primary {
	background: linear-gradient(135deg, #6a11cb, #2575fc);
	border: none;
	padding: 0.75rem 2rem;
	font-weight: 600;
	border-radius: 8px;
	transition: all 0.3s ease;
	color: white;
}

.btn-primary:hover {
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(106, 17, 203, 0.3);
}

.btn-sm {
    padding: 0.25rem 0.5rem; /* Ensure same padding */
    font-size: 0.875rem; /* Ensure same text size */
    min-width: 36px; /* Set a minimum width */
    display: inline-flex;
    align-items: center;
    justify-content: center;
}

.btn-sm {
    padding: 0.4rem 0.6rem; /* Adjust padding to balance size */
    font-size: 0.875rem; /* Ensure consistent text size */
    min-width: 36px; /* Set a minimum width */
    height: 26px; /* Set a fixed height for consistency */
    display: inline-flex;
    align-items: center;
    justify-content: center;
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
.alert-message {
	padding: 1rem;
	border-radius: 8px;
	margin-bottom: 1.5rem;
	text-align: center;
}

.alert-success {
	background: #d4edda;
	color: #155724;
}

.alert-danger {
	background: #f8d7da;
	color: #721c24;
}

.toggle-password {
	position: absolute;
	right: 40px;
	top: 55%;
	transform: translateY(-50%);
	cursor: pointer;
	color: #6a11cb;
}

@media ( max-width : 768px) {
	.glass-card {
		margin: 0.5rem;
		padding: 1.5rem;
	}
	.form-title {
		font-size: 1.5rem;
	}
	.table {
		font-size: 14px;
	}
}
/* Add these styles to your existing CSS */
.table td {
	max-width: 150px; /* Adjust based on your needs */
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.table th:nth-child(7), .table td:nth-child(7) { /* Actions column */
	min-width: 120px; /* Ensure enough space for buttons */
	max-width: 120px;
	text-overflow: clip; /* Prevent ellipsis for buttons */
}

/* Specific column adjustments */
.table th:nth-child(1), /* Name */ .table td:nth-child(1) {
	max-width: 180px;
}

.table th:nth-child(5), /* Contact */ .table td:nth-child(5) {
	max-width: 120px;
}

.table th:nth-child(6), /* Email */ .table td:nth-child(6) {
	max-width: 200px;
}

/* Button container */
.action-buttons {
	display: flex;
	gap: 8px;
	flex-wrap: nowrap;
}

/* Responsive adjustments */
@media ( max-width : 1200px) {
	.table th:nth-child(2), /* Qualification */ .table td:nth-child(2) {
		display: none;
	}
}

@media ( max-width : 992px) {
	.table th:nth-child(4), /* Experience */ .table td:nth-child(4) {
		display: none;
	}
}

@media ( max-width : 768px) {
	.table th:nth-child(3), /* Specialist */ .table td:nth-child(3) {
		display: none;
	}
	.action-buttons {
		flex-direction: column;
	}
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%@include file="logout.jsp"%>

	<div class="container-fluid p-3">
		<div class="row">
			<!-- Add Doctor Form -->
			<div class="col-12 col-lg-3 mb-4">
				<div class="glass-card">
					<h3 class="form-title">
						<i class="fas fa-user-plus me-2"></i>Add Doctor
					</h3>

					<c:if test="${not empty registerErrorMessage}">
						<div class="alert-message alert-danger">${registerErrorMessage}</div>
						<c:remove var="registerErrorMessage" scope="session" />
					</c:if>
					<c:if test="${not empty registerSuccessMessage}">
						<div class="alert-message alert-success">${registerSuccessMessage}</div>
						<c:remove var="registerSuccessMessage" scope="session" />
					</c:if>

					<form action="../adminServlet/registerDoctor" method="post">
						<div class="mb-4 input-icon">
							<i class="fas fa-user"></i> <input type="text" required
								name="fullName" class="form-control" placeholder="Full Name">
						</div>

						<div class="mb-4 input-icon">
							<i class="fas fa-graduation-cap"></i> <input type="text" required
								name="qualification" class="form-control"
								placeholder="Qualification">
						</div>

						<div class="mb-4 input-icon">
							<i class="fas fa-stethoscope"></i> <select name="specialist"
								required class="form-control">
								<option value="">Select Specialist</option>
								<%
								SpecialistDaoImpl specialistDaoImpl = new SpecialistDaoImpl(DBConnect.getConnection());
								List<Specialist> specialistList = specialistDaoImpl.getAllSpecialists();
								for (Specialist specialist : specialistList) {
								%>
								<option value="<%=specialist.getSpecialistName()%>"><%=specialist.getSpecialistName()%></option>
								<%
								}
								%>
							</select>
						</div>

						<div class="mb-4 input-icon">
							<i class="fas fa-briefcase"></i> <input type="number" required
								name="experience" class="form-control"
								placeholder="Experience (Years)">
						</div>

						<div class="mb-4 input-icon">
							<i class="fas fa-phone"></i> <input type="text" required
								name="contact" class="form-control" placeholder="Contact">
						</div>

						<div class="mb-4 input-icon">
							<i class="fas fa-envelope"></i> <input type="email" required
								name="email" class="form-control" placeholder="Email">
						</div>

						<div class="mb-4 input-icon position-relative">
							<i class="fas fa-lock"></i> <input type="password" required
								name="password" id="password" class="form-control"
								placeholder="Password"> <span class="toggle-password"
								onclick="togglePassword()"> <i class="fas fa-eye"
								id="eye-icon"></i>
							</span>
						</div>

						<button type="submit" class="btn btn-primary w-100">
							<i class="fas fa-plus-circle me-2"></i>Add Doctor
						</button>
					</form>
				</div>
			</div>

			<!-- Doctor List -->
			<div class="col-12 col-lg-9">
				<div class="glass-card">
					<h3 class="form-title">
						<i class="fas fa-users-medical me-2"></i>Doctor Details
					</h3>

					<c:if test="${not empty updateErrorMessage}">
						<div class="alert-message alert-danger">${updateErrorMessage}</div>
						<c:remove var="updateErrorMessage" scope="session" />
					</c:if>
					<c:if test="${not empty updateSuccessMessage}">
						<div class="alert-message alert-success">${updateSuccessMessage}</div>
						<c:remove var="updateSuccessMessage" scope="session" />
					</c:if>

					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>Full Name</th>
									<th>Qualification</th>
									<th>Specialist</th>
									<th>Experience</th>
									<th>Contact</th>
									<th>Email</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<%
								DoctorDaoImpl doctorDaoImpl = new DoctorDaoImpl(DBConnect.getConnection());
								List<Doctor> doctorsList = doctorDaoImpl.getAllDoctors();
								if (doctorsList != null && !doctorsList.isEmpty()) {
									for (Doctor doctor : doctorsList) {
								%>
								<tr>
									<td><%=doctor.getFullName()%></td>
									<td><%=doctor.getQualification()%></td>
									<td><%=doctor.getSpecialist()%></td>
									<td><%=doctor.getExperience()%> years</td>
									<td><%=doctor.getContact()%></td>
									<td><%=doctor.getEmail()%></td>
									<td><a
										href="edit_doctor.jsp?id=<%=doctor.getId()%>&sourcePage=doctor.jsp"
										class="btn btn-primary btn-sm"> <i class="fa-solid fa-pen-to-square"></i>
									</a> <a
										href="../deleteDoctor?id=<%=doctor.getId()%>&sourcePage=doctor.jsp"
										class="btn btn-danger btn-sm"> <i class="fas fa-trash-alt"></i>
									</a></td>
								</tr>
								<%
								}
								} else {
								%>
								<tr>
									<td colspan="7" class="text-center text-muted py-4">No
										doctors found</td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../components/footer.jsp"%>

	<script>
		function togglePassword() {
			const passwordField = document.getElementById("password");
			const eyeIcon = document.getElementById("eye-icon");

			if (passwordField.type === "password") {
				passwordField.type = "text";
				eyeIcon.classList.replace("fa-eye", "fa-eye-slash");
			} else {
				passwordField.type = "password";
				eyeIcon.classList.replace("fa-eye-slash", "fa-eye");
			}
		}
	</script>
</body>
</html>