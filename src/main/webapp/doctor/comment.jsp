<%@page import="com.entity.Appointment"%>
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
<title>Patient Comment</title>
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
	margin: 2rem auto;
	max-width: 800px;
}

.form-title {
	color: #2575fc;
	font-weight: 700;
	text-align: center;
	margin-bottom: 2rem;
	font-size: 2rem;
}

.form-control {
	border-radius: 10px;
	border: 2px solid #e0e0e0;
	padding: 0.75rem 1rem;
	transition: all 0.3s ease;
}

.form-control:focus {
	border-color: #6a11cb;
	box-shadow: 0 0 0 3px rgba(106, 17, 203, 0.1);
}

.input-icon {
	position: relative;
}

.input-icon i {
	position: absolute;
	left: 10px; /* Adjust as needed */
	top: 30%;
	transform: translateY(-50%);
	color: #6a11cb;
	font-size: 18px;
}

.input-icon input, .input-icon select {
	padding-left: 35px;
	/* Add padding so text doesn't overlap with the icon */
}

.btn-submit {
	background: linear-gradient(135deg, #6a11cb, #2575fc);
	border: none;
	color: white;
	padding: 0.75rem 2rem;
	border-radius: 10px;
	font-weight: 600;
	transition: all 0.3s ease;
	width: 100%;
	max-width: 300px;
}

.btn-submit:hover {
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(106, 17, 203, 0.3);
}

textarea.form-control {
	min-height: 150px;
	resize: vertical;
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
		<div class="glass-card">
			<h2 class="form-title">
				<i class="fas fa-comment-medical me-2"></i>Patient Comment
			</h2>

			<%
			int id = Integer.parseInt(request.getParameter("id"));
			AppointmentDaoImpl appointmentDaoImpl = new AppointmentDaoImpl(DBConnect.getConnection());
			Appointment appointment = appointmentDaoImpl.getAppointmentsById(id);
			%>

			<form action="../doctorServlet/updateStatus" method="post">
				<div class="row g-4">
					<!-- Left Column -->
					<div class="col-md-6">

						<div class="input-icon">
							<i class="fas fa-user"></i> <input type="text" readonly
								class="form-control" value="<%=appointment.getFullName()%>">
							<label class="form-label">Patient Name</label>
						</div>

						<div class="input-icon">
							<i class="fas fa-birthday-cake"></i> <input type="text" readonly
								class="form-control" value="<%=appointment.getAge()%>">
							<label class="form-label">Age</label>
						</div>
					</div>

					<!-- Right Column -->
					<div class="col-md-6">
						<div class="input-icon">
							<i class="fas fa-phone"></i> <input type="text" readonly
								class="form-control" value="<%=appointment.getPhone()%>">
							<label class="form-label">Phone</label>
						</div>

						<div class="input-icon">
							<i class="fas fa-disease"></i> <input type="text" readonly
								class="form-control" value="<%=appointment.getDisease()%>">
							<label class="form-label">Disease</label>
						</div>
					</div>
				</div>

				<div class="mt-4 input-icon">
					<i class="fas fa-list"></i> <select name="comment"
						class="form-control">
						<option value="">-- Select an option --</option>
						<option value="Prescribed Medication">Prescribed
							Medication</option>
						<option value="Needs Further Tests">Needs Further Tests</option>
						<option value="Referred to Specialist">Referred to
							Specialist</option>
						<option value="Follow-up Appointment Required">Follow-up
							Appointment Required</option>
						<option value="Discharged">Discharged</option>
						<option value="Under Observation">Under Observation</option>
						<option value="Surgery Recommended">Surgery Recommended</option>
						<option value="Patient Needs Counseling">Patient Needs
							Counseling</option>
					</select> <label class="form-label">Doctor's Comment</label>
				</div>


				<input type="hidden" name="id" value="<%=appointment.getId()%>">
				<input type="hidden" name="did"
					value="<%=appointment.getDoctorId()%>">

				<div class="text-center mt-4">
					<button type="submit" class="btn-submit">
						<i class="fas fa-paper-plane me-2"></i>Submit Comment
					</button>
				</div>
			</form>
		</div>
	</div>

	<%@include file="../components/footer.jsp"%>
</body>
</html>