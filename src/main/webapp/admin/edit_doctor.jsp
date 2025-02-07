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
<title>Edit Doctor Details</title>
<%@include file="../components/allcss.jsp"%>
<style>
body {
	background: linear-gradient(135deg, #f8f9fa, #e9ecef);
	min-height: 100vh;
}

.glass-card {
	background: rgba(255, 255, 255, 0.95);
	backdrop-filter: blur(10px);
	border-radius: 15px;
	box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
	border: 1px solid rgba(255, 255, 255, 0.18);
	padding: 2rem;
	margin: 2rem auto;
}

.form-title {
	color: #2575fc;
	font-weight: 700;
	text-align: center;
	margin-bottom: 2rem;
	font-size: 2rem;
}

.form-label {
	font-weight: 600;
	color: #495057;
	margin-bottom: 0.5rem;
}

.form-control {
	border-radius: 8px;
	padding: 0.75rem 1rem;
	border: 2px solid #e0e0e0;
	transition: all 0.3s ease;
}

.form-control:focus {
	border-color: #6a11cb;
	box-shadow: 0 0 0 3px rgba(106, 17, 203, 0.1);
}

.btn-update {
	background: linear-gradient(135deg, #6a11cb, #2575fc);
	border: none;
	padding: 0.75rem 2rem;
	font-weight: 600;
	border-radius: 8px;
	transition: all 0.3s ease;
	width: 100%;
	color: white;
}

.btn-update:hover {
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(106, 17, 203, 0.3);
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

@media ( max-width : 768px) {
	.glass-card {
		margin: 1rem;
		padding: 1.5rem;
	}
	.form-title {
		font-size: 1.5rem;
	}
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%@include file="logout.jsp"%>

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-lg-8">
				<div class="glass-card">
					<h2 class="form-title">
						<i class="fas fa-user-md me-2"></i>Edit Doctor Details
					</h2>

					<%
					int id = Integer.parseInt(request.getParameter("id"));
					DoctorDaoImpl doctorDaoImpl = new DoctorDaoImpl(DBConnect.getConnection());
					Doctor doctor = doctorDaoImpl.getDoctorById(id);
					%>

					<form action="../adminServlet/updateDoctor" method="post">
						<input type="hidden" name="id" value="<%=doctor.getId()%>">

						<div class="mb-4 input-icon">
							<i class="fas fa-user"></i> <input type="text" required
								name="fullName" class="form-control"
								value="<%=doctor.getFullName()%>" placeholder="Full Name">
						</div>

						<div class="mb-4 input-icon">
							<i class="fas fa-graduation-cap"></i> <input type="text" required
								name="qualification" class="form-control"
								value="<%=doctor.getQualification()%>"
								placeholder="Qualification">
						</div>

						<div class="mb-4 input-icon">
							<i class="fas fa-stethoscope"></i> <select name="specialist"
								required class="form-control">
								<option value="<%=doctor.getSpecialist()%>"><%=doctor.getSpecialist()%></option>
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
								name="experience" class="form-control" min="0"
								value="<%=doctor.getExperience()%>"
								placeholder="Experience (Years)">
						</div>

						<div class="mb-4 input-icon">
							<i class="fas fa-phone"></i> <input type="text" required
								name="contact" class="form-control"
								value="<%=doctor.getContact()%>" placeholder="Contact">
						</div>

						<div class="mb-4 input-icon">
							<i class="fas fa-envelope"></i> <input type="email" required
								name="email" class="form-control" value="<%=doctor.getEmail()%>"
								placeholder="Email">
						</div>

						<div class="mb-4 input-icon">
							<i class="fas fa-lock"></i> <input type="text" required
								name="password" class="form-control"
								value="<%=doctor.getPassword()%>" placeholder="Password">
						</div>

						<button type="submit" class="btn btn-update">
							<i class="fas fa-sync-alt me-2"></i>Update Details
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../components/footer.jsp"%>
</body>
</html>