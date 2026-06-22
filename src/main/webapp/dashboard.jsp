<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String user = (String) session.getAttribute("user");
    String role = (String) session.getAttribute("role"); 
    String safeRole = (role != null) ? role.toLowerCase() : "";
    String name = (session.getAttribute("name") != null) ? (String) session.getAttribute("name") : "Χρήστης";
    String initialLetter = (!name.isEmpty()) ? name.substring(0, 1).toUpperCase() : "U";
%>
<html>
<head>
    <title>Dashboard | Φοιτητολόγιο Πανεπιστημίου Πειραιώς</title>
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

        .profile-card, .actions-container-card {
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.18);
            border-radius: 30px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.4);
            animation: fadeInUp 0.8s cubic-bezier(0.25, 1, 0.5, 1);
        }

        .avatar-circle {
            width: 80px;
            height: 80px;
            background: rgba(255, 255, 255, 0.1);
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            font-weight: bold;
            color: #ffffff;
        }

        .action-link-card {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            padding: 1.25rem;
            display: flex;
            align-items: center;
            gap: 15px;
            color: #ffffff !important;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .action-link-card:hover {
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
        }

        .btn-logout {
            background: black;
            color: #ffffff !important;
            border: 1px solid black;
            font-weight: 700;
            transition: all 0.3s ease;
        }

        .btn-logout:hover {
            background: rgba(255, 255, 255, 0.24) !important;
            border-color: rgba(255, 255, 255, 0.6) !important;
            box-shadow: 0 0 12px rgba(255, 255, 255, 0.15) !important;
            transform: translateY(-2px);
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
            background: rgba(255, 255, 255, 0.08);
            border-color: rgba(255, 255, 255, 0.2);
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


    <div class="container my-4">
        <div class="row g-4 justify-content-center align-items-stretch"> 
            <div class="col-lg-4 col-md-5">
                <div class="card profile-card p-4 text-center text-white p-4 p-md-5 h-100 d-flex flex-column justify-content-between">
                    <div>
                        <div class="d-flex gap-2 mb-4 align-items-center justify-content-center">
                            <img src="${pageContext.request.contextPath}/images/unipi.png" class="img-fluid" style="width: 35px; filter: drop-shadow(0 10px 15px rgba(0,0,0,0.3));" alt="Unipi Logo">
                            <div>
                                <p class="text-white-50 fw-bold mb-0 fs-5" style="font-size: 1.2rem;">Πανεπιστήμιο Πειραιώς</p>
                            </div>
                        </div>
                        <div class="my-auto py-3">
                            <div class="d-flex justify-content-center mb-3">
                                <div class="avatar-circle"><%= initialLetter %></div>
                            </div>
                            <h4 class="mb-1"><b><%= name %></b></h4>
                            <p class="text-white-50 small mb-4">@<%= user %></p>
                            
                            <span class="badge fs-6 rounded-4 py-2 px-4 shadow-sm" style="background: rgba(255,255,255,0.12); border: 1px solid rgba(255,255,255,0.2)">
                                <i class="bi bi-person-bounding-box me-2"></i><%= role != null ? role.toUpperCase() : "" %>
                            </span>
                        </div>
                    </div>
                    <div class="mt-3">
                        <a href="LogoutServlet" class="btn btn-logout rounded-4 w-100 py-2"><b>ΑΠΟΣΥΝΔΕΣΗ</b></a>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-8 col-md-7">
                <div class="card actions-container-card p-4 p-md-5 h-100 d-flex flex-column justify-content-between">
                    <div>
                        <h3 class="mb-4 text-white d-flex align-items-center">
                            <i class="bi bi-pencil-fill me-2 text-white-50"></i><b class="mt-1">Διαθέσιμες Ενέργειες</b>
                        </h3>
                        
                        <div class="row g-3">
                            <% if ("secretary".equals(safeRole)) { %>
                                <div class="col-12">
                                    <a href="SecretaryServlet?action=viewCourses" class="action-link-card">
                                        <div class="action-icon-box"><i class="bi bi-book"></i></div>
                                        <div>
                                            <h5 class="mb-1"><b>Διαχείριση Μαθημάτων</b></h5>
                                            <p class="mb-0 small text-white-50">Προβολή όλων των ενεργών μαθημάτων και των υπεύθυνων καθηγητών.</p>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-12">
                                    <a href="SecretaryServlet?action=prepareAssign" class="action-link-card">
                                        <div class="action-icon-box"><i class="bi bi-person-plus"></i></div>
                                        <div>
                                            <h5 class="mb-1"><b>Ανάθεση Μαθήματος</b></h5>
                                            <p class="mb-0 small text-white-50">Ανάθεση και αντιστοίχιση διδακτικού προσωπικού σε διαθέσιμα μαθήματα.</p>
                                        </div>
                                    </a>
                                </div>
                                
                            <% } else if ("professor".equals(safeRole)) { %>
                                <div class="col-12">
                                    <a href="#" class="action-link-card">
                                        <div class="action-icon-box"><i class="bi bi-journal-bookmark"></i></div>
                                        <div>
                                            <h5 class="mb-1"><b>Τα Μαθήματά Μου</b></h5>
                                            <p class="mb-0 small text-white-50">Δείτε το αναλυτικό πρόγραμμα και τις πληροφορίες των μαθημάτων σας.</p>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-12">
                                    <a href="#" class="action-link-card">
                                        <div class="action-icon-box"><i class="bi bi-pencil-square"></i></div>
                                        <div>
                                            <h5 class="mb-1"><b>Βαθμολογίες</b></h5>
                                            <p class="mb-0 small text-white-50">Καταχώρηση και επεξεργασία βαθμών για τους εγγεγραμμένους φοιτητές.</p>
                                        </div>
                                    </a>
                                </div>
                                
                            <% } else if ("student".equals(safeRole)) { %>
                                <div class="col-12">
                                    <a href="#" class="action-link-card">
                                        <div class="action-icon-box"><i class="bi bi-card-checklist"></i></div>
                                        <div>
                                            <h5 class="mb-1"><b>Δήλωση Μαθημάτων</b></h5>
                                            <p class="mb-0 small text-white-50">Επιλέξτε τα μαθήματα του τρέχοντος εξαμήνου για την εγγραφή σας.</p>
                                        </div>
                                    </a>
                                </div>
                                
                            <% } else { %>
                                <div class="col-12 text-center py-5">
                                    <i class="bi bi-exclamation-triangle fs-1 text-white-50 mb-3"></i>
                                    <p class="text-white mb-0">Δεν βρέθηκαν διαθέσιμες ενέργειες για αυτόν τον λογαριασμό.</p>
                                </div>
                            <% } %>
                        </div>
                    </div>
                    
                    <div class="text-md-start text-center text-white-50 small mt-5 pt-3 border-top border-secondary border-opacity-25" style="font-size: 0.75rem;">
                        © 2025 Filippos Obrijanu. All rights reserved.
                    </div>
                    
                </div>
            </div>
        </div>
    </div>

    <div class="container mt-2" style="max-width: 1140px;">
        <div class="row g-3 text-white text-center">
            <div class="col-md-4">
                <div class="stat-card-bottom d-flex align-items-center justify-content-center gap-2">
                    <div class="action-icon-box"><i class="bi bi-book-half text-white fs-3"></i></div>
                    <div class="text-start">
                        <h5 class="mb-0 fw-bold">42</h5>
                        <p class="text-white-50 small mb-0" style="font-size: 0.75rem;">Ενεργά Μαθήματα</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stat-card-bottom d-flex align-items-center justify-content-center gap-2">
                    <div class="action-icon-box"><i class="bi bi-people text-white fs-3"></i></div>
                    <div class="text-start">
                        <h5 class="mb-0 fw-bold">1,480</h5>
                        <p class="text-white-50 small mb-0" style="font-size: 0.75rem;">Εγγεγραμμένοι Φοιτητές</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stat-card-bottom d-flex align-items-center justify-content-center gap-2">
                    <div class="action-icon-box"><i class="bi bi-person-workspace text-white fs-3"></i></div>
                    <div class="text-start">
                        <h5 class="mb-0 fw-bold">68</h5>
                        <p class="text-white-50 small mb-0" style="font-size: 0.75rem;">Διδακτικό Προσωπικό</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>