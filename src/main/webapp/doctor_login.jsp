<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>

/* Doctor Login Form Styling */
.login-container {
	background: rgba(255, 255, 255, 0.9);
	padding: 40px;
	border-radius: 8px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
	width: 400px;
	max-width: 100%;
	margin: 0 auto;
	text-align: center;
}

.login-container h2 {
	font-size: 30px;
	margin-bottom: 20px;
	color: #6a11cb;
}

.input-group {
	margin-bottom: 15px;
}

.input-group input {
	width: 100%;
	padding: 12px;
	font-size: 16px;
	border: 1px solid #ddd;
	border-radius: 4px;
	box-sizing: border-box;
}

.input-group label {
	font-size: 16px;
	color: #555;
}

.input-group .toggle-password {
	position: absolute;
	right: 10px;
	top: 65%;
	transform: translateY(-50%);
	cursor: pointer;
	color: #888;
}

.login-btn {
	width: 100%;
	padding: 12px 24px;
	background-color: #6a11cb;
	color: white;
	border: none;
	border-radius: 4px;
	font-size: 18px;
	cursor: pointer;
	transition: 0.3s;
}

.login-btn:hover {
	background-color: #0056b3;
}
</style>

<title>Doctor Login</title>

<%@include file="components/allcss.jsp"%>

</head>
<body>

	<%@include file="components/navbar.jsp"%>

	<!-- Doctor Login Form Section -->
	<section class="login-section">
		<div class="container p-5">
		
			<div class="login-container">
			
				<h2>Doctor Login</h2>

				<!-- For logout success message -->
				<c:if test="${not empty successMessage}">
					<p class="text-center text-success fs-5">${successMessage}</p>
					<c:remove var="successMessage" scope="session" />
				</c:if>

				<!-- For login failure message -->
				<c:if test="${ not empty errorMessage}">
					<p class="text-center text-danger fs-5">${errorMessage}</p>
					<c:remove var="errorMessage" scope="session" />
				</c:if>
				
				<form action="doctorServlet/login" method="POST">
					<div class="input-group">
						<label for="email">Email Address</label> <input type="email"
							id="email" name="email" required>
					</div>
					<div class="input-group">
						<label for="password">Password</label> <input type="password"
							id="password" name="password" required><span
							class="toggle-password" onclick="togglePassword()"> <i
							class="fa fa-eye" id="eye-icon"></i>
						</span>
					</div>
					<button type="submit" class="login-btn">Login</button>
				</form>
			</div>
		</div>
	</section>

	<%@include file="components/footer.jsp"%>

	<!-- Script for eye toggle -->
	<script>
		function togglePassword() {
			const passwordField = document.getElementById("password");
			const eyeIcon = document.getElementById("eye-icon");
			if (passwordField.type === "password") {
				passwordField.type = "text";
				eyeIcon.classList.remove("fa-eye");
				eyeIcon.classList.add("fa-eye-slash");
			} else {
				passwordField.type = "password";
				eyeIcon.classList.remove("fa-eye-slash");
				eyeIcon.classList.add("fa-eye");
			}
		}
	</script>

</body>
</html>
