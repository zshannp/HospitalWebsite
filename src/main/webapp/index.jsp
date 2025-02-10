<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Home Page</title>

<style>
/* Parallax Section starts here */
.parallax-slider {
	position: relative;
	width: 100%;
	height: 500px;
	background-size: cover;
	background-position: center;
	background-attachment: fixed;
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
	color: white;
	transition: background-image 1s ease-in-out;
}

/* Overlay for better text visibility */
.parallax-slider::before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.4);
}

/* Content Styling */
.parallax-content {
	position: relative;
	z-index: 1;
}

.parallax-content h1 {
	font-size: 40px;
	margin-bottom: 10px;
}

.parallax-content p {
	font-size: 18px;
	margin-bottom: 20px;
}

.parallax-content .btn {
	background: #6a11cb;
	color: white;
	padding: 12px 24px;
	border-radius: 5px;
	text-decoration: none;
	font-size: 18px;
	transition: background 0.3s ease, color 0.3s ease;
	/* Smooth transition */
}

.parallax-content .btn:hover {
	background: #2575fc;
	color: white;
	transition: background 0.3s ease, color 0.3s ease;
	/* Smooth transition */
}

/* Parallax Section ends here */



/* Feature Section starts here */
/* Card Styles */
.feature-card {
	height: 100%;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: center;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
	border-radius: 10px;
	transition: transform 0.3s ease-in-out;
}

.feature-card:hover {
	transform: translateY(-5px);
}

.feature-icon {
	font-size: 40px;
	color: #6a11cb;
}

.feature-section {
	margin-bottom: 40px; /* Adjust spacing as needed */
}
/* Feature Section ends here */
</style>

</head>

<body>

	<%@include file="components/navbar.jsp"%>


	<!-- Parallax Section -->
	<div class="parallax-slider">
		<div class="parallax-content">
			<h1>World-Class Medical Care</h1>
			<p>Advanced Healthcare with Compassion</p>
			<a href="#" class="btn">Explore Services</a>
		</div>
	</div>

	<!-- Doctor's Team Section -->
	<%@include file="components/doctor_section.jsp" %>

	<hr>
	
	<!-- Features Section -->
	<div class="container feature-section">
		<div class="container mt-5">
			<h2 class="text-center mb-4">Why Choose Our Hospital?</h2>
			<div class="row g-4">
				<div class="col-md-3">
					<div class="card feature-card text-center p-4">
						<i class="fa-solid fa-truck-medical feature-icon"></i>
						<h5 class="mt-3">24/7 Emergency</h5>
						<p>Immediate response with top-notch emergency services around
							the clock.</p>
					</div>
				</div>

				<div class="col-md-3">
					<div class="card feature-card text-center p-4">
						<i class="fa-solid fa-stethoscope feature-icon"></i>
						<h5 class="mt-3">Expert Doctors</h5>
						<p>Highly experienced doctors specializing in various fields
							of medicine.</p>
					</div>
				</div>

				<div class="col-md-3">
					<div class="card feature-card text-center p-4">
						<i class="fa-solid fa-heartbeat feature-icon"></i>
						<h5 class="mt-3">Advanced Equipment</h5>
						<p>State-of-the-art medical equipment ensuring top-quality
							treatment.</p>
					</div>
				</div>

				<div class="col-md-3">
					<div class="card feature-card text-center p-4">
						<i class="fa-solid fa-user-nurse feature-icon"></i>
						<h5 class="mt-3">Patient-Centered Care</h5>
						<p>We prioritize patient well-being with compassionate
							healthcare services.</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Script for the parallax -->
	<script>
		// Array of image URLs (Replace with your hospital images)
		const images = [ 'images/hos1.jpg', 'images/hos2.jpg',
				'images/hos3.jpg' ];

		let currentIndex = 0;

		function changeBackground() {
			document.querySelector(".parallax-slider").style.backgroundImage = `url(\${images[currentIndex]})`;
			currentIndex = (currentIndex + 1) % images.length;
		}

		// Initial call and automatic change every 5 seconds
		changeBackground();
		setInterval(changeBackground, 3000);
	</script>

	<%@include file="components/footer.jsp"%>
</body>

</html>