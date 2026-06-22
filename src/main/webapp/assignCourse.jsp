<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<Map<String, String>> courses = (List<Map<String, String>>) request.getAttribute("courses");
    List<Map<String, String>> professors = (List<Map<String, String>>) request.getAttribute("professors");
%>
<html>
<head>
    <title>Ανάθεση Μαθήματος | Φοιτητολόγιο Πανεπιστημίου Πειραιώς</title>
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
            align-items: center;
            justify-content: center;
            position: relative;
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

        .form-select-glass {
            background-color: rgba(255, 255, 255, 0.06) !important;
            border: 1px solid rgba(255, 255, 255, 0.15) !important;
            color: #ffffff !important;
            transition: all 0.3s ease;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23ffffff' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='m2 5 6 6 6-6'/%3e%3c/svg%3e") !important;
        }

        .form-select-glass option {
            background-color: #16325B !important;
            color: #ffffff !important;
        }

        .form-select-glass:focus {
            background-color: rgba(255, 255, 255, 0.12) !important;
            border-color: rgba(255, 255, 255, 0.4) !important;
            box-shadow: 0 0 12px rgba(255, 255, 255, 0.15) !important;
        }

        .btn-submit-dark {
            background: black;
            color: #ffffff !important;
            border: 1px solid black;
            font-weight: 700;
            transition: all 0.3s ease;
        }

        .btn-submit-dark:hover {
            color: #ffffff;
            transform: translateY(-2px);
            background: rgba(255, 255, 255, 0.24) !important;
            border-color: rgba(255, 255, 255, 0.6) !important;
            box-shadow: 0 0 12px rgba(255, 255, 255, 0.15) !important;
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
    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-xl-6 col-lg-7 col-md-9">
                
                <div class="card card-custom p-4 p-md-5">
                    
                    <div class="d-flex flex-column flex-sm-row justify-content-between align-items-center gap-3 mb-4 pb-3 border-bottom border-secondary border-opacity-25">
                        <div class="d-flex gap-3 align-items-center justify-content-center text-center text-sm-start">
                           <div>
                                <h3 class="text-white mb-0"><i class="bi bi-pencil-square text-white-50 me-2"></i><b>Ανάθεση Μαθήματος</b></h3>
                            </div>
                        </div>
                        <div>
                            <a href="dashboard.jsp" class="btn back-btn rounded-4 px-4 py-2 shadow-sm d-flex align-items-center gap-2">
                                <b>ΑΚΥΡΟ</b>
                            </a>
                        </div>
                    </div>
                    
                    <form action="SecretaryServlet" method="post" class="mb-0">
                        <input type="hidden" name="action" value="assign">
                        
                        <div class="mb-4">
                            <label class="form-label fw-bold text-white-50 small"><i class="bi bi-book mt-1 me-2"></i>ΕΠΙΛΟΓΗ ΜΑΘΗΜΑΤΟΣ</label>
                            <select name="courseCode" class="form-select form-select-glass rounded-4 py-2.5" required>
                                <% if (courses != null) { 
                                    for(Map<String, String> c : courses) { %>
                                        <option value="<%= c.get("code") %>"><%= c.get("title") %></option>
                                <%  } } %>
                            </select>
                        </div>
                        
                        <div class="mb-5">
                            <label class="form-label fw-bold text-white-50 small"><i class="bi bi-person-badge mt-1 me-2"></i>ΕΠΙΛΟΓΗ ΚΑΘΗΓΗΤΗ</label>
                            <select name="profId" class="form-select form-select-glass rounded-4 py-2.5" required>
                                <% if (professors != null) { 
                                    for(Map<String, String> p : professors) { %>
                                        <option value="<%= p.get("id") %>"><%= p.get("fullname") %></option>
                                <%  } } %>
                            </select>
                        </div>
                        
                        <button type="submit" class="btn btn-submit-dark w-100 py-2 fs-5 rounded-4">
                            <b>ΟΛΟΚΛΗΡΩΣΗ ΑΝΑΘΕΣΗΣ</b>
                        </button>
                    </form>
                    
                    <div class="text-md-start text-center text-white-50 small mt-4 pt-3 border-top border-secondary border-opacity-25" style="font-size: 0.75rem;">
                        © 2025 Filippos Obrijanu. All rights reserved.
                    </div>
                </div>
                
            </div>
        </div>
    </div>
</body>
</html>