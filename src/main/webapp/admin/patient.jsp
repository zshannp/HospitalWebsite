<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.impl.DoctorDaoImpl"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.impl.AppointmentDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin | Patient Management</title>
<%@include file="../components/allcss.jsp"%>
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
    max-width: 1400px;
}

.form-title {
    color: #2575fc;
    font-weight: 700;
    text-align: center;
    margin-bottom: 2rem;
    font-size: 2rem;
}

.table {
    border-collapse: collapse;
    width: 100%;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    background: rgba(255, 255, 255, 0.9);
    border-radius: 10px;
    overflow: hidden;
}

.table thead {
    background: linear-gradient(135deg, #6a11cb, #2575fc);
    color: white;
}

.table th, .table td {
    padding: 12px 15px;
    vertical-align: middle;
    border-bottom: 1px solid rgba(0, 0, 0, 0.05);
}

.table tbody tr {
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

.table tbody tr:nth-child(even) {
    background-color: #f8f9fa;
}

.table tbody tr:hover {
    background-color: #e9ecef;
    transform: translateX(4px);
}

.status-badge {
    border-radius: 20px;
    padding: 0.35rem 1.25rem;
    font-size: 0.85rem;
    font-weight: 500;
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
}

.status-pending {
    background: linear-gradient(135deg, #ffc107, #ff9800);
    color: white;
}

.status-completed {
    background: linear-gradient(135deg, #28a745, #218838);
    color: white;
}

/* Text truncation */
.table td {
    max-width: 220px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

/* Responsive adjustments */
@media (max-width: 1600px) {
    .table th:nth-child(5),
    .table td:nth-child(5) { /* Email */
        display: none;
    }
}

@media (max-width: 1200px) {
    .table th:nth-child(6),
    .table td:nth-child(6) { /* Phone */
        display: none;
    }
}

@media (max-width: 992px) {
    .table th:nth-child(3),
    .table td:nth-child(3), /* Age */
    .table th:nth-child(9),
    .table td:nth-child(9) { /* Address */
        display: none;
    }
}

@media (max-width: 768px) {
    .table th:nth-child(4),
    .table td:nth-child(4), /* Appointment Date */
    .table th:nth-child(7),
    .table td:nth-child(7) { /* Disease */
        display: none;
    }
    
    .table th, .table td {
        padding: 0.75rem 1rem;
    }
}

@media (max-width: 576px) {
    .table th:nth-child(8),
    .table td:nth-child(8) { /* Doctor Name */
        display: none;
    }
}
</style>
</head>
<body>
    <%@include file="navbar.jsp"%>
    <%@include file="logout.jsp"%>

    <div class="container-fluid p-3">
        <div class="glass-card">
            <h2 class="form-title">
                <i class="fas fa-user-injured me-2"></i>Patient List
            </h2>

            <c:if test="${not empty successMessage}">
                <div class="alert alert-success alert-message">
                    ${successMessage}
                </div>
                <c:remove var="successMessage" scope="session"/>
            </c:if>
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger alert-message">
                    ${errorMessage}
                </div>
                <c:remove var="errorMessage" scope="session"/>
            </c:if>

            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th><i class="fas fa-user me-2"></i>Full Name</th>
                            <th><i class="fas fa-venus-mars me-2"></i>Gender</th>
                            <th><i class="fas fa-birthday-cake me-2"></i>Age</th>
                            <th><i class="fas fa-calendar-day me-2"></i>Appointment</th>
                            <th><i class="fas fa-envelope me-2"></i>Email</th>
                            <th><i class="fas fa-phone me-2"></i>Phone</th>
                            <th><i class="fas fa-disease me-2"></i>Disease</th>
                            <th><i class="fas fa-user-md me-2"></i>Doctor</th>
                            <th><i class="fas fa-map-marker-alt me-2"></i>Address</th>
                            <th><i class="fas fa-info-circle me-2"></i>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        AppointmentDaoImpl appointmentDaoImpl = new AppointmentDaoImpl(DBConnect.getConnection());
                        DoctorDaoImpl doctorDaoImpl = new DoctorDaoImpl(DBConnect.getConnection());
                        List<Appointment> appointmentsList = appointmentDaoImpl.getAllAppointments();
                        
                        if (appointmentsList.isEmpty()) {
                        %>
                        <tr>
                            <td colspan="10" class="text-center text-muted py-4">
                                No patient records found
                            </td>
                        </tr>
                        <%
                        } else {
                            for (Appointment appointment : appointmentsList) {
                                Doctor doctor = doctorDaoImpl.getDoctorById(appointment.getDoctorId());
                        %>
                        <tr>
                            <td><%=appointment.getFullName()%></td>
                            <td><%=appointment.getGender()%></td>
                            <td><%=appointment.getAge()%></td>
                            <td><%=appointment.getAppointmentDate()%></td>
                            <td><%=appointment.getEmail()%></td>
                            <td><%=appointment.getPhone()%></td>
                            <td><%=appointment.getDisease()%></td>
                            <td><%=doctor.getFullName()%></td>
                            <td><%=appointment.getAddress()%></td>
                            <td>
                                <span class="status-badge <%= appointment.getStatus().equalsIgnoreCase("Pending") ? "status-pending" : "status-completed"%>">
                                    <%=appointment.getStatus()%>
                                </span>
                            </td>
                        </tr>
                        <%
                            }
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <%@include file="../components/footer.jsp"%>
</body>
</html>