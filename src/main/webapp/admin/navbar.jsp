<nav class="navbar navbar-expand-lg navbar-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"> 
			<i class="fa-solid fa-house-medical"></i> MEDI HOME
		</a>

		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">

				<li class="nav-item"><a class="nav-link active" href="view_doctors.jsp"> 
					<i class="fa-solid fa-user-md"></i> DOCTOR
				</a></li>

				<li class="nav-item"><a class="nav-link active" href="patient.jsp"> 
					<i class="fa-solid fa-user"></i> PATIENT
				</a></li>

			</ul>

			<ul class="navbar-nav ms-auto">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="adminDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false"> 
						<i class="fa-solid fa-user-shield"></i> ADMIN
					</a>
					<ul class="dropdown-menu dropdown-menu-end shadow-lg"
						aria-labelledby="adminDropdown">
						<li><a class="dropdown-item" href="../adminServlet/logout"> 
							<i class="fa-solid fa-sign-out-alt me-2"></i> Logout
						</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>

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
/* Modern Gradient Background */
.navbar {
	background: linear-gradient(135deg, #6a11cb, #2575fc);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
	padding: 10px 15px; /* Reduced padding */
	position: sticky;
	top: 0;
	width: 100%;
	z-index: 1000;
	transition: all 0.3s ease-in-out;
}

/* Navbar Brand Styling */
.navbar-brand {
	font-size: 20px; /* Reduced font size */
	font-weight: bold;
	color: white !important;
	display: flex;
	align-items: center;
	transition: all 0.3s ease-in-out;
	padding: 8px 12px; /* Reduced padding */
	border-radius: 10px;
}

.navbar-brand:hover {
	background: rgba(255, 255, 255, 0.2);
	transform: scale(1.1);
}

/* Navbar Links Styling */
.navbar-nav .nav-item {
	margin: 0 8px; /* Reduced margin */
}

.navbar-nav .nav-link {
	font-size: 16px; /* Reduced font size */
	font-weight: 500;
	color: white !important;
	padding: 8px 12px; /* Reduced padding */
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

/* Dropdown Menu Styling */
.dropdown-menu {
	background: linear-gradient(135deg, #6a11cb, #2575fc);
	border: none;
	border-radius: 10px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
}

.dropdown-item {
	color: white !important;
	font-size: 14px; /* Reduced font size */
	padding: 8px 12px; /* Reduced padding */
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
	font-size: 20px; /* Reduced icon size */
}

@media (max-width: 992px) {
	.navbar-nav {
		text-align: center;
	}
	.navbar-nav .nav-item {
		margin-bottom: 8px; /* Reduced margin */
	}
}
</style>