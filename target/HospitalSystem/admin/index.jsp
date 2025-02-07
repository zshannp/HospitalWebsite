<%@page import="com.dao.impl.SpecialistDaoImpl"%>
<%@page import="com.dao.impl.AppointmentDaoImpl"%>
<%@page import="com.dao.impl.UserDaoImpl"%>
<%@page import="com.dao.impl.DoctorDaoImpl"%>
<%@page import="com.db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!-- Admin/index.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
/* Modal Style */
/* Gradient Header */
.modal-header {
	background: linear-gradient(135deg, #6a11cb, #2575fc);
	color: white;
	border-top-left-radius: 8px;
	border-top-right-radius: 8px;
}

/* Button Styling */
.btn-primary {
	background-color: #00b0ff; /* Lighter blue */
	border: none;
	color: white;
	transition: background-color 0.3s ease-in-out;
}

.btn-primary:hover {
	background-color: #6a11cb; /* Darker blue on hover */
}

.btn-secondary {
	background-color: #6c757d; /* Greyish color */
	border: none;
	color: white;
	transition: background-color 0.3s ease-in-out;
}

.btn-secondary:hover {
	background-color: #5a6268; /* Darker grey on hover */
}

/* Input Styling */
.form-control {
	border: 2px solid #6a11cb;
	border-radius: 5px;
	padding: 10px;
	transition: all 0.3s ease-in-out;
}

.form-control:focus {
	border-color: #00d4ff;
	box-shadow: 0 0 10px rgba(0, 212, 255, 0.3);
}

/* Modal Styling */
.modal-content {
	border-radius: 10px;
	box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.2);
}
</style>


<style>
body {
	background: #f4f6f9;
}

h2.text-center {
	font-size: 40px;
	font-weight: bold;
	color: #6a11cb;
}

.dashboard-container {
	padding: 50px;
}

.card {
	border: 2px solid transparent;
	border-radius: 12px;
	box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out,
		border 0.3s;
	background: #fff;
}

.card:hover {
	transform: scale(1.06);
	box-shadow: 0px 6px 15px rgba(0, 123, 255, 0.3);
	border: 2px solid #6a11cb;
}

.card i {
	font-size: 44px;
	color: #6a11cb;
	text-shadow: 2px 2px 10px rgba(0, 123, 255, 0.2);
}

.card-title {
	font-size: 22px;
	font-weight: bold;
	color: #0056b3;
}

.card-text {
	font-size: 24px;
	font-weight: bold;
	color: #333;
}
</style>

<title>Admin Dashboard</title>

<%@include file="../components/allcss.jsp"%>
</head>
<body>

	<%@include file="navbar.jsp"%>
	<%@include file="logout.jsp"%>

	<div class="container dashboard-container">
		<h2 class="text-center mb-4">Admin Dashboard</h2>

		<c:if test="${not empty errorMessage}">
			<p class="fs-3 text-center text-danger">${errorMessage}</p>
			<c:remove var="errorMessage" scope="session" />
		</c:if>

		<c:if test="${not empty successMessage}">
			<p class="fs-3 text-center text-success" role="alert">${successMessage}</p>
			<c:remove var="successMessage" scope="session" />
		</c:if>

		<div class="row g-4">

			<%
			DoctorDaoImpl doctorDaoImpl = new DoctorDaoImpl(DBConnect.getConnection());
			UserDaoImpl userDaoImpl = new UserDaoImpl(DBConnect.getConnection());
			AppointmentDaoImpl appointmentDaoImpl = new AppointmentDaoImpl(DBConnect.getConnection());
			SpecialistDaoImpl specialistDaoImpl = new SpecialistDaoImpl(DBConnect.getConnection());
			%>

			<!-- Doctors Card -->
			<a href="doctor.jsp"
				class="col-md-3 text-decoration-none text-dark d-block">
				<div class="card text-center p-4">
					<i class="fa-solid fa-user-md"></i>
					<div class="card-body">
						<h5 class="card-title">Add Doctors</h5>
						<p class="card-text"><%=doctorDaoImpl.countDoctor() %></p>
					</div>
				</div>
			</a>

			<!-- Users Card -->
			<a href="#" class="col-md-3 text-decoration-none text-dark d-block">
				<div class="card text-center p-4">
					<i class="fa-solid fa-users"></i>
					<div class="card-body">
						<h5 class="card-title">Users</h5>
						<p class="card-text"><%=userDaoImpl.countUser() %></p>
					</div>
				</div>
			</a>

			<!-- Total Appointments Card -->
			<a href="#" class="col-md-3 text-decoration-none text-dark d-block">
				<div class="card text-center p-4">
					<i class="fa-solid fa-calendar-check"></i>
					<div class="card-body">
						<h5 class="card-title">Appointments</h5>
						<p class="card-text"><%=appointmentDaoImpl.countAppointment() %></p>
					</div>
				</div>
			</a>

			<!-- Specialists Card (Still Opens Modal) -->
			<div class="col-md-3" data-bs-toggle="modal"
				data-bs-target="#exampleModal" style="cursor: pointer;">
				<div class="card text-center p-4">
					<i class="fa-solid fa-user-tie"></i>
					<div class="card-body">
						<h5 class="card-title">Add Specialists</h5>
						<p class="card-text"><%=specialistDaoImpl.countSpecialist() %></p>
					</div>
				</div>
			</div>

		</div>


	</div>


	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content shadow-lg rounded-3 border-0">
				<div class="modal-header bg-primary text-white">
					<h5 class="modal-title" id="exampleModalLabel">Add Specialist</h5>
					<button type="button" class="btn-close btn-close-white"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body p-4">
					<form action="../specialistServlet/add" method=post>
						<div class="mb-3">
							<label class="form-label fw-semibold">Enter Specialist
								Name</label> <input type="text" name="specialistName"
								class="form-control border-2 shadow-sm"
								placeholder="Specialist Name" required>
						</div>
						<div class="text-center">
							<button type="submit"
								class="btn btn-primary px-4 py-2 fw-semibold">Add</button>
						</div>
					</form>
				</div>
				<div class="modal-footer d-flex justify-content-between">
					<button type="button" class="btn btn-secondary px-4 py-2"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary px-4 py-2">Save
						changes</button>
				</div>
			</div>
		</div>
	</div>


	<%@include file="../components/footer.jsp"%>
</body>
</html>