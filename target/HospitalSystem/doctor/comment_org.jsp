<%@page import="com.entity.Appointment"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.impl.AppointmentDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Comment</title>
<%@include file="../components/allcss.jsp"%>
<style>
/* Unified styling matching user_appointment.jsp */
.appointment-container {
    padding: 2rem;
    min-height: 100vh;
    background: linear-gradient(135deg, #f8f9fa, #e9ecef);
}

.glassmorphism {
    background: rgba(255, 255, 255, 0.95);
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

.form-control {
    border-radius: 10px;
    border: 2px solid #e0e0e0;
    padding: 1rem;
    transition: all 0.3s ease;
}

.form-control:focus {
    border-color: #6a11cb;
    box-shadow: 0 0 0 3px rgba(106, 17, 203, 0.1);
}

.input-icon {
    position: relative;
    margin-bottom: 1.5rem;
}

.input-icon i {
    position: absolute;
    left: 15px;
    top: 50%;
    transform: translateY(-50%);
    color: #6a11cb;
    font-size: 1.2rem;
}

.input-icon input,
.input-icon textarea {
    padding-left: 40px;
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

textarea.form-control {
    min-height: 150px;
    resize: vertical;
}

.form-floating label {
    padding-left: 40px;
}

@media (max-width: 768px) {
    .glassmorphism {
        margin: 1rem;
        padding: 1.5rem;
    }
    
    .form-title {
        font-size: 1.8rem;
    }
    
    .input-icon i {
        left: 10px;
        font-size: 1rem;
    }
    
    .input-icon input,
    .input-icon textarea {
        padding-left: 35px;
    }
}
</style>
</head>
<body>
    <%@include file="navbar.jsp"%>
    <%@include file="logout.jsp"%>

    <div class="appointment-container">
        <div class="glassmorphism">
            <h2 class="form-title">
                <i class="fas fa-comment-medical me-3"></i>Patient Comment
            </h2>

            <% int id = Integer.parseInt(request.getParameter("id"));
               AppointmentDaoImpl dao = new AppointmentDaoImpl(DBConnect.getConnection());
               Appointment appointment = dao.getAppointmentsById(id); %>

            <!-- Success/Error Messages -->
            <c:if test="${not empty successMessage}">
                <p class="text-center text-success fs-5">${successMessage}</p>
                <c:remove var="successMessage" scope="session" />
            </c:if>
            <c:if test="${not empty errorMessage}">
                <p class="text-center text-danger fs-5">${errorMessage}</p>
                <c:remove var="errorMessage" scope="session" />
            </c:if>

            <form action="../doctorServlet/updateStatus" method="post">
                <div class="row g-4">
                    <!-- Patient Information -->
                    <div class="col-md-6">
                        <div class="input-icon">
                            <i class="fas fa-user"></i>
                            <input type="text" class="form-control" 
                                   value="<%=appointment.getFullName()%>" readonly>
                            <label>Patient Name</label>
                        </div>

                        <div class="input-icon">
                            <i class="fas fa-birthday-cake"></i>
                            <input type="text" class="form-control" 
                                   value="<%=appointment.getAge()%>" readonly>
                            <label>Age</label>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="input-icon">
                            <i class="fas fa-phone"></i>
                            <input type="text" class="form-control" 
                                   value="<%=appointment.getPhone()%>" readonly>
                            <label>Phone Number</label>
                        </div>

                        <div class="input-icon">
                            <i class="fas fa-disease"></i>
                            <input type="text" class="form-control" 
                                   value="<%=appointment.getDisease()%>" readonly>
                            <label>Disease/Symptoms</label>
                        </div>
                    </div>
                </div>

                <!-- Comment Section -->
                <div class="input-icon mt-4">
                    <i class="fas fa-comment-dots"></i>
                    <textarea name="comment" class="form-control" 
                              placeholder="Enter your professional comment"
                              required></textarea>
                    <label>Doctor's Comment</label>
                </div>

                <input type="hidden" name="id" value="<%=appointment.getId()%>">
                <input type="hidden" name="did" value="<%=appointment.getDoctorId()%>">

                <button type="submit" class="btn-submit">
                    <i class="fas fa-paper-plane me-2"></i>Submit Comment
                </button>
            </form>
        </div>
    </div>

    <%@include file="../components/footer.jsp"%>
</body>
</html>