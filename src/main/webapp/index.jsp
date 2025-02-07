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

/* Doctor Photocard section starts here */
/* Section Styling */
.team-section {
	padding: 60px 0;
	background: #f9f9f9;
	text-align: center;
}

.section-title {
	font-size: 32px;
	font-weight: bold;
	margin-bottom: 30px;
	text-transform: uppercase;
	color: #6a11cb;
}

/* Doctor Card */
.doctor-card {
	position: relative;
	overflow: hidden;
	border-radius: 15px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
	transition: transform 0.3s ease-in-out;
	background: #fff;
}

.doctor-card img {
	width: 100%;
	height: 350px;
	object-fit: cover;
	border-radius: 15px 15px 0 0;
}

.doctor-info {
	padding: 15px;
	background: linear-gradient(135deg, #6a11cb, #2575fc);
	color: white;
	border-radius: 0 0 15px 15px;
}

.doctor-info h4 {
	font-size: 20px;
	margin-bottom: 5px;
	font-weight: bold;
}

.doctor-info p {
	font-size: 16px;
	margin-bottom: 5px;
	opacity: 0.9;
}

.doctor-info span {
	font-size: 14px;
	font-weight: bold;
	opacity: 0.8;
}

/* Hover Effect */
.doctor-card:hover {
	transform: scale(1.05);
}
/* Doctor Photocard section ends here */

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
	<section class="team-section">
		<div class="container">
			<h2 class="section-title">Meet Our Expert Team</h2>
			<div class="row">

				<!-- Doctor 1 -->
				<div class="col-md-3">
					<div class="doctor-card">
						<img src="images/dr_gv_rao.jpg" alt="Dr. G. V. Rao">
						<div class="doctor-info">
							<h4>Dr. G. V. Rao</h4>
							<p>Chief of Surgical Gastroenterology</p>
							<span>Surgical Gastroenterology</span>
						</div>
					</div>
				</div>

				<!-- Doctor 2 -->
				<div class="col-md-3">
					<div class="doctor-card">
						<img src="images/dr_rupa_banerjee.jpg" alt="Dr. Rupa Banerjee">
						<div class="doctor-info">
							<h4>Dr. Rupa Banerjee</h4>
							<p>Director Inflammatory Bowel Diseases</p>
							<span>Medical Gastroenterology</span>
						</div>
					</div>
				</div>

				<!-- Doctor 3 -->
				<div class="col-md-3">
					<div class="doctor-card">
						<img src="images/dr_aniruddha_singh.jpg"
							alt="Dr. Aniruddha Pratap Singh">
						<div class="doctor-info">
							<h4>Dr. Aniruddha Pratap Singh</h4>
							<p>Senior Consultant Gastroenterologist</p>
							<span>Medical Gastroenterology</span>
						</div>
					</div>
				</div>

				<!-- Doctor 4 -->
				<div class="col-md-3">
					<div class="doctor-card">
						<img src="images/dr_goutham_reddy.jpg"
							alt="Dr. Goutham Reddy Katukuri">
						<div class="doctor-info">
							<h4>Dr. Goutham Reddy Katukuri</h4>
							<p>Consultant Gastroenterology</p>
							<span>Medical Gastroenterology</span>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>

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