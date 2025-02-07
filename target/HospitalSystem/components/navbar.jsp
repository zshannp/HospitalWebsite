<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ include file="allcss.jsp"%>
<nav class="navbar navbar-expand-lg navbar-dark">
	<div class="container-fluid">
		<a class="navbar-brand nav-link active" href="index.jsp"> <i
			class="fa-solid fa-house-medical"></i> MEDI HOME
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">

				<c:if test="${empty userObject}">
					<li class="nav-item"><a class="nav-link active"
						href="admin_login.jsp"> <i class="fa-solid fa-user-shield"></i>
							ADMIN
					</a></li>

					<li class="nav-item"><a class="nav-link active"
						href="doctor_login.jsp"> <i class="fa-solid fa-user-md"></i>
							DOCTOR
					</a></li>

					<li class="nav-item"><a class="nav-link active"
						href="user_appointment.jsp"
						onclick="return checkLogin('<%=session.getAttribute("userObject")%>')"
						class="btn btn-primary"> <i class="fa-solid fa-calendar-check"></i>
							APPOINTMENT
					</a></li>

					<li class="nav-item"><a class="nav-link active"
						href="user_login.jsp"> <i class="fa-solid fa-user"></i> USER
					</a></li>
				</c:if>

				<c:if test="${not empty userObject}">
					<li class="nav-item"><a class="nav-link active"
						href="user_appointment.jsp"> <i
							class="fa-solid fa-calendar-check"></i> APPOINTMENT
					</a></li>

					<li class="nav-item"><a class="nav-link active"
						href="view_appointment.jsp"> <i
							class="fa-solid fa-calendar-check"></i> VIEW APPOINTMENT
					</a></li>

					<li class="nav-item dropdown active"><a
						class="nav-link dropdown-toggle d-flex align-items-center"
						href="#" id="navbarDropdown" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> <i
							class="fa-solid fa-user-large me-2"></i> <span
							class="text-truncate" style="max-width: 150px;">${userObject.fullName}</span>
					</a>
						<ul class="dropdown-menu dropdown-menu-end shadow-lg"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item"
								href="userServlet/changePassword"> <i
									class="fa-solid fa-key me-2"></i> Change Password
							</a></li>
							<li><a class="dropdown-item" href="userServlet/logout">
									<i class="fa-solid fa-sign-out-alt me-2"></i> Logout
							</a></li>
						</ul></li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>

<script>
function checkLogin(user) {
    if (user === "null" || user === "") {
        window.location.href = "user_login.jsp?message=Please sign in first!";
        return false; // Prevent default action
    }
    return true; // Allow navigation
}
</script>

<style>
/* Bounce Icon animation */
.navbar-brand i {
    margin-right: 8px;
    color: #fff;
    font-size: 20px;
}

/* Bounce on hover only */
.navbar-brand:hover i {
    animation: bounce 0.5s ease-in-out;
}

/* Bounce Animation */
@keyframes bounce {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(-8px); } /* Adjusted bounce height */
}
</style>

<style>
/* General Navbar Styling - Matches Admin Navbar */
.navbar {
	background: linear-gradient(135deg, #6a11cb, #2575fc);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
	padding: 10px 15px; /* Adjusted to match admin navbar */
	position: sticky;
	top: 0;
	width: 100%;
	z-index: 1000;
	transition: all 0.3s ease-in-out;
}

/* Navbar Brand */
.navbar-brand {
	font-size: 20px; /* Matched with admin navbar */
	font-weight: bold;
	color: white !important;
	display: flex;
	align-items: center;
	transition: all 0.3s ease-in-out;
	padding: 8px 12px;
	border-radius: 10px;
}

.navbar-brand:hover {
	background: rgba(255, 255, 255, 0.2);
	transform: scale(1.1);
}

/* Navbar Links */
.navbar-nav .nav-item {
	margin: 0 8px; /* Adjusted to match spacing */
}

.navbar-nav .nav-link {
	font-size: 16px; /* Matched with admin navbar */
	font-weight: 500;
	color: white !important;
	padding: 8px 12px;
	border-radius: 10px;
	transition: all 0.3s ease-in-out;
	display: flex;
	align-items: center;
	gap: 8px;
}

.navbar-nav .nav-link:hover {
	background: rgba(255, 255, 255, 0.2);
	transform: scale(1.1);
}

/* Dropdown Menu */
.dropdown-menu {
	background: linear-gradient(135deg, #6a11cb, #2575fc);
	border: none;
	border-radius: 10px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
}

.dropdown-item {
	color: white !important;
	font-size: 14px; /* Matched with admin navbar */
	padding: 8px 12px;
	transition: all 0.3s ease-in-out;
}

.dropdown-item:hover {
	background: rgba(255, 255, 255, 0.2);
	transform: scale(1.05);
}

/* Mobile Navbar Styling */
.navbar-toggler {
	border: none;
}

.navbar-toggler-icon {
	color: white;
	font-size: 20px; /* Matched with admin navbar */
}

@media ( max-width : 992px) {
	.navbar-nav {
		text-align: center;
	}
	.navbar-nav .nav-item {
		margin-bottom: 8px;
	}
}
</style>