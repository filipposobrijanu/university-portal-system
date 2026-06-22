<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="mainpackage.Courses" %>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<Courses> coursesList = (List<Courses>) request.getAttribute("coursesList");
    
    // Υπολογισμός δυναμικού συνόλου για το Top Bar
    int totalCourses = (coursesList != null) ? coursesList.size() : 0;
%>
<html>
<head>
    <title>Μαθήματα | Φοιτητολόγιο Πανεπιστημίου Πειραιώς</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/unipi.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300..700&display=swap" rel="stylesheet">
   <style>
        body {
            font-family: 'Comfortaa', sans-serif;
            background: linear-gradient(-45deg, #0A2240, #16325B, #800020, #4A0011);
            background-size: 400% 400%;
            animation: gradientAnimation 15s ease infinite;
            min-height: 100vh;
            margin: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            position: relative;
            padding: 3rem 0;
        }

        body::before {
            content: "";
            position: absolute;
            top: 0; left: 0; width: 100%; height: 100%;
            background-image: 
                linear-gradient(rgba(255, 255, 255, 0.02) 1px, transparent 1px),
                linear-gradient(90deg, rgba(255, 255, 255, 0.02) 1px, transparent 1px);
            background-size: 25px 25px;
            z-index: 1;
            pointer-events: none;
        }

        @keyframes gradientAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .container { position: relative; z-index: 2; }

        .top-bar-custom {
            background: rgba(255, 255, 255, 0.03); 
            border: 1px solid rgba(255, 255, 255, 0.08); 
            backdrop-filter: blur(10px);
            animation: fadeInUp 0.8s cubic-bezier(0.25, 1, 0.5, 1);
        }

        .card-custom {
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.18);
            border-radius: 30px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.4);
            animation: fadeInUp 0.8s cubic-bezier(0.25, 1, 0.5, 1);
            overflow: hidden;
        }

        .table {
            background: transparent !important;
            --bs-table-bg: transparent !important;
            color: #ffffff !important;
        }

        .table thead {
            background: rgba(255, 255, 255, 0.04) !important;
            border-bottom: 2px solid rgba(255, 255, 255, 0.15) !important;
        }

        .table tbody tr td, 
        .table thead tr th {
            background: transparent !important;
            color: rgba(255, 255, 255, 0.9) !important;
        }

        .table tbody tr {
            border-bottom: 1px solid rgba(255, 255, 255, 0.06) !important;
            transition: all 0.2s ease;
        }

        .table tbody tr:hover td {
            background: rgba(255, 255, 255, 0.08) !important;
            color: #ffffff !important;
        }

        .back-btn {
            background: black;
            color: #ffffff !important;
            border: 1px solid black;
            font-weight: 700;
            transition: all 0.3s ease;
        }
        
        .back-btn:hover {
            color: #ffffff;
            transform: translateY(-2px);
            background: rgba(255, 255, 255, 0.24) !important;
            border-color: rgba(255, 255, 255, 0.6) !important;
            box-shadow: 0 0 12px rgba(255, 255, 255, 0.15) !important;
        }

        /* Badges */
        .badge-ects {
            background: rgba(255, 255, 255, 0.12);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: #fff !important;
        }
        
        .badge-no-prof {
            background: rgba(255, 255, 255, 0.06);
            border: 1px solid rgba(255, 255, 255, 0.15);
            color: rgba(255, 255, 255, 0.7) !important;
        }

        .stat-card-bottom {
            background: rgba(255, 255, 255, 0.04);
            border: 1px solid rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 1.25rem;
            transition: all 0.3s ease;
            animation: fadeInUp 0.8s cubic-bezier(0.25, 1, 0.5, 1);
        }
        
        .stat-card-bottom:hover {
            background: rgba(255, 255, 255, 0.12);
            border-color: rgba(255, 255, 255, 0.3);
            transform: translateX(5px);
        }

        .action-icon-box {
            width: 50px;
            height: 50px;
            background: rgba(255, 255, 255, 0.08);
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            transition: all 0.3s ease;
        }

        .stat-card-bottom:hover .action-icon-box {
            background: rgba(255, 255, 255, 0.15);
        }

        @keyframes fadeInUp {
            0% { transform: translateY(40px); opacity: 0; }
            100% { transform: translateY(0); opacity: 1; }
        }

        ::selection {
            background-color: rgba(255, 255, 255, 0.12) !important;
            color: #ffffff;
        }
    </style>
</head>
<body>

    <div class="container mb-2" style="max-width: 1140px;">
        <div class="p-3 d-flex flex-column flex-sm-row justify-content-between align-items-center rounded-4 shadow-sm top-bar-custom">
            <div class="text-white-50 small mb-2 mb-sm-0 d-flex align-items-center gap-2">
                <i class="bi bi-info-circle text-white-50"></i> Τρέχον Ακαδημαϊκό Έτος: 2025-2026
            </div>
            <div class="text-white-50 small">
                <i class="bi bi-layers me-2 text-white-50"></i>Σύνολο στη Λίστα: <b class="text-white"><%= totalCourses %></b> Μαθήματα
            </div>
        </div>
    </div>

    <div class="container my-4">
        
        <% if ("assigned".equals(request.getParameter("success"))) { %>
            <div class="row justify-content-center mb-4">
                <div class="col-xl-9 col-lg-10">
                    <div class="alert alert-success rounded-4 text-center shadow border-0 mb-0" style="background: rgba(40, 167, 69, 0.25); color: #d4edda; backdrop-filter: blur(10px);">
                        <i class="bi bi-check-circle-fill me-2"></i>Η ανάθεση του μαθήματος έγινε με επιτυχία!
                    </div>
                </div>
            </div>
        <% } %>
        
        <div class="row justify-content-center">
            <div class="col-xl-9 col-lg-10">
                
                <div class="card card-custom p-4 p-md-5">
                    
                    <div class="d-flex flex-column flex-sm-row justify-content-between align-items-center gap-3 mb-4 pb-3 ">
                        <div class="d-flex gap-3 align-items-center justify-content-center text-center text-sm-start">
                           <div>
                                <h3 class="text-white mb-0"><i class="bi bi-bookmark-fill text-white-50 me-2"></i><b>Λίστα Μαθημάτων</b></h3>
                            </div>
                        </div>
                        <div>
                            <a href="dashboard.jsp" class="btn back-btn rounded-4 px-4 py-2 shadow-sm d-flex align-items-center gap-2">
                                <b>ΠΙΣΩ</b>
                            </a>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-hover table-borderless align-middle">
                            <thead>
                                <tr>
                                    <th class="py-3 px-4 text-white-50 small">ΚΩΔΙΚΟΣ</th>
                                    <th class="py-3 text-white-50 small">ΤΙΤΛΟΣ ΜΑΘΗΜΑΤΟΣ</th>
                                    <th class="py-3 text-white-50 small">ΜΟΝΑΔΕΣ</th>
                                    <th class="py-3 text-white-50 small">ΥΠΕΥΘΥΝΟΣ ΚΑΘΗΓΗΤΗΣ</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% if (coursesList != null && !coursesList.isEmpty()) { 
                                    for(Courses c : coursesList) { 
                                %>
                                <tr>
                                    <td class="px-4 text-white"><b><%= c.getCourseCode() %></b></td>
                                    <td class="fw-semibold"><%= c.getTitle() %></td>
                                    <td><span class="badge badge-ects rounded-pill px-3 py-2"><%= c.getCredits() %> ECTS</span></td>
                                    <td>
                                        <% if (c.getProfessor() != null) { %>
                                            <span class="fw-bold text-white"><i class="bi bi-person-badge me-2 text-white-50"></i><%= c.getProfessor().getSurname() %> <%= c.getProfessor().getName() %></span>
                                        <% } else { %>
                                            <span class="badge badge-no-prof rounded-4 px-3 py-2"><i class="bi bi-dash-circle me-1"></i>Χωρίς Ανάθεση</span>
                                        <% } %>
                                    </td>
                                </tr>
                                <%      }
                                   } else { %>
                                    <tr>
                                        <td colspan='4' class="text-center py-5 text-white-50">
                                            <i class="bi bi-folder-x fs-2 mb-2 d-block"></i>Δεν βρέθηκαν διαθέσιμα μαθήματα.
                                        </td>
                                    </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                    
                    <div class="text-md-start text-center text-white-50 small mt-4 pt-3 border-top border-secondary border-opacity-25" style="font-size: 0.75rem;">
                        © 2025 Filippos Obrijanu. All rights reserved.
                    </div>
                    
                </div> </div>
        </div>
    </div>

  

</body>
</html>