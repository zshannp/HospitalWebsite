<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Meet Our Expert Team</title>
<!-- Make sure Bootstrap CSS is included -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css">
<style>
/* Doctor Photocard Section */
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

.doctor-card:hover {
	transform: scale(1.05);
}
</style>
</head>
<body>
	<section class="team-section">
		<div class="container">
			<h2 class="section-title">Meet Our Expert Team</h2>
			<div class="row g-4">
				<!-- g-4 adds uniform gap between columns -->
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

				<!-- Doctor 5 -->
				<div class="col-md-3">
					<div class="doctor-card">
						<img src="images/dr_sundeep_lakhtakia.jpg"
							alt="Dr. Goutham Reddy Katukuri">
						<div class="doctor-info">
							<h4>Dr. Sundeep Lakhtakia</h4>
							<p>Director Endoscopy & EUS</p>
							<span>Medical Gastroenterology</span>
						</div>
					</div>
				</div>

				<!-- Doctor 6 -->
				<div class="col-md-3">
					<div class="doctor-card">
						<img src="images/dr_d_nageshwar_reddy.jpg"
							alt="Dr. D Nageshwar Reddy">
						<div class="doctor-info">
							<h4>Dr. Goutham Reddy Katukuri</h4>
							<p>Consultant Gastroenterology</p>
							<span>Medical Gastroenterology</span>
						</div>
					</div>
				</div>

				<!-- Doctor 7 -->
				<div class="col-md-3">
					<div class="doctor-card">
						<img src="images/dr_harshad_jawalkar.jpg"
							alt="Dr. Goutham Reddy Katukuri">
						<div class="doctor-info">
							<h4>Dr. Goutham Reddy Katukuri</h4>
							<p>Consultant Gastroenterology</p>
							<span>Medical Gastroenterology</span>
						</div>
					</div>
				</div>

				<!-- Doctor 8 -->
				<div class="col-md-3">
					<div class="doctor-card">
						<img src="images/dr_mandava_venkata_sravani.jpg"
							alt="Dr. Goutham Reddy Katukuri">
						<div class="doctor-info">
							<h4>Dr. Goutham Reddy Katukuri</h4>
							<p>Consultant Gastroenterology</p>
							<span>Medical Gastroenterology</span>
						</div>
					</div>
				</div>
				<!-- Additional doctor cards as needed -->
			</div>
		</div>
	</section>
</body>
</html>
