<%@page import="com.entity.User"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.impl.DoctorDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>User Appointments</title>

<style>
.appointment-container {
	padding: 2rem;
	min-height: 100vh;
	background: linear-gradient(135deg, #f8f9fa, #e9ecef);
}

.glassmorphism {
	background: rgba(255, 255, 255, 0.9);
	backdrop-filter: blur(10px);
	border-radius: 20px;
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
	font-size: 2.2rem;
}

.appointment-form .form-floating {
	margin-bottom: 1.5rem;
}

.appointment-form .form-control {
	border-radius: 10px;
	border: 2px solid #e0e0e0;
	transition: all 0.3s ease;
	padding: 1rem;
}

.appointment-form .form-control:focus {
	border-color: #6a11cb;
	box-shadow: 0 0 0 3px rgba(106, 17, 203, 0.1);
}

#address {
	min-height: 10 0px; /* Double the default height */
	height: auto; /* Allow vertical expansion */
	resize: vertical; /* Allow user to resize vertically */
}

/* Adjust the label position for the taller field */
.form-floating.full-width textarea.form-control {
	padding-top: 1.5rem;
	line-height: 1.5;
}

.form-floating.full-width label {
	align-items: flex-start;
	padding-top: 1rem;
}

.gender-options {
	display: flex;
	align-items: center;
	gap: 1rem;
	padding: 1rem;
	background: white;
	border: 2px solid #e0e0e0;
	border-radius: 10px;
	transition: all 0.3s ease;
}

.gender-options:hover {
	border-color: #6a11cb;
	box-shadow: 0 0 0 3px rgba(106, 17, 203, 0.1);
}

.form-check-input:checked {
	background-color: #2575fc;
	border-color: #2575fc;
}

.btn-submit {
	width: 100%;
	padding: 1rem;
	border: none;
	border-radius: 10px;
	background: linear-gradient(135deg, #6a11cb, #2575fc);
	color: white;
	font-weight: 600;
	transition: all 0.3s ease;
	margin-top: 1rem;
}

.btn-submit:hover {
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(106, 17, 203, 0.3);
}

@media ( max-width : 768px) {
	.glassmorphism {
		margin: 1rem;
		padding: 1.5rem;
	}
	.form-title {
		font-size: 1.8rem;
	}
	.gender-options {
		flex-direction: column;
		gap: 0.5rem;
	}
}
</style>

</head>

<body>

	<%@include file="components/navbar.jsp"%>

	<div class="container appointment-container">
		<div class="form-wrapper glassmorphism">
			<h2 class="form-title">
				<i class="fa-regular fa-calendar-check me-3"></i>Book Your
				Appointment
			</h2>

			<!-- For appointment success message -->
			<c:if test="${not empty successMessage}">
				<p class="text-center text-success fs-5">${successMessage}</p>
				<c:remove var="successMessage" scope="session" />
			</c:if>

			<!-- For appointment failure message -->
			<c:if test="${ not empty errorMessage}">
				<p class="text-center text-danger fs-5">${errorMessage}</p>
				<c:remove var="errorMessage" scope="session" />
			</c:if>
			
			<form class="appointment-form"
				action="appointmentServlet/addAppointment" method="POST">
				<%
				User user = (User)session.getAttribute("userObject");
				%>
				<input type="hidden" name="userId" value="${userObject.id}">
				<div class="row g-4">


					<div class="col-md-6">
						<div class="form-floating">
							<input type="text" class="form-control" id="fullName"
								name="fullName" placeholder="Full Name" value="<%=user.getFullName()%>" required
								pattern="[A-Za-z ]{3,}"> <label for="fullName"><i
								class="fa-regular fa-user me-2"></i>Full Name</label>
						</div>

						<div class="form-floating">

							<div class="gender-options d-flex align-items-center">
								<label class="me-3"><i class="fas fa-venus-mars me-2"></i>Gender</label>
								<div class="form-check me-3">
									<input class="form-check-input" type="radio" name="gender"
										id="male" value="male" required> <label
										class="form-check-label" for="male">Male</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="gender"
										id="female" value="female"> <label
										class="form-check-label" for="female">Female</label>
								</div>
							</div>
						</div>


						<div class="form-floating">
							<input type="number" class="form-control" id="age" name="age"
								placeholder="Age" min="1" max="120" required> <label
								for="age"><i class="fa-regular fa-heart me-2"></i>Age</label>
						</div>

						<div class="form-floating">
							<input type="date" class="form-control" id="appointmentDate"
								name="appointmentDate" min="<%=java.time.LocalDate.now()%>"
								required> <label for="appointmentDate"><i
								class="fa-regular fa-calendar-days me-2"></i>Appointment Date</label>
						</div>
					</div>

					<!-- Right Column -->
					<div class="col-md-6">
						<div class="form-floating">
							<input type="email" class="form-control" id="email" name="email"
								placeholder="Email" value="<%=user.getEmail()%>" required> <label for="email"><i
								class="fa-regular fa-envelope me-2"></i>Email</label>
						</div>

						<div class="form-floating">
							<input type="tel" class="form-control" id="phone" name="phone"
								placeholder="Phone Number" pattern="[0-9]{10}" required>
							<label for="phone"><i class="fas fa-mobile-alt me-2"></i>Phone
								Number</label>
						</div>

						<div class="form-floating">
							<select class="form-select" id="doctor" name="doctorId" required>
								<option value="">Select Doctor</option>
								<%
								DoctorDaoImpl doctorDaoImpl = new DoctorDaoImpl(DBConnect.getConnection());
								List<Doctor> doctorsList = doctorDaoImpl.getAllDoctors();
								for (Doctor doctor : doctorsList) {
								%>
								<option value="<%=doctor.getId()%>"><%=doctor.getFullName()%>
									(<%=doctor.getSpecialist()%>)
								</option>
								<%
								}
								%> %>
							</select> <label for="doctor"><i class="fas fa-user-md me-2"></i>Select
								Doctor</label>
						</div>

						<div class="form-floating">
							<input type="text" class="form-control" id="disease"
								name="disease" placeholder="Disease/Symptoms" required>
							<label for="disease"><i class="fas fa-allergies me-2"></i>Disease/Symptoms</label>
						</div>
					</div>
				</div>

				<div class="form-floating full-width">
					<textarea class="form-control" id="address" name="address"
						placeholder="Full Address" rows="3" required></textarea>
					<label for="address"><i class="fas fa-map-marker-alt me-2"></i>Full
						Address</label>
				</div>

				<c:if test="${empty userObject}">
					<a href="user_login.jsp"
						class="btn-submit d-block text-center text-white text-decoration-none">
						<i class="fa-regular fa-paper-plane me-2"></i>Book Appointment
					</a>
				</c:if>

				<c:if test="${not empty userObject}">
					<button type="submit" class="btn-submit">
						<i class="fa-regular fa-paper-plane me-2"></i>Book Appointment
					</button>
				</c:if>

			</form>
		</div>
	</div>

	<%@include file="components/footer.jsp"%>

</body>

</html>