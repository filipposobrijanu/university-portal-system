<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Σύνδεση | Φοιτητολόγιο Πανεπιστημίου Πειραιώς</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/unipi.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300..700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Comfortaa', sans-serif;
            background: linear-gradient(-45deg, #0A2240, #16325B, #800020, #4A0011);
            background-size: 400% 400%;
            animation: gradientAnimation 15s ease infinite;
            min-height: 100vh;
            margin: 0;
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

        .container {
            position: relative;
            z-index: 2;
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

        .img-panel {
            background-image: url('https://img.bbmd.gr/img/900/900/90/2026/03/23/62937a64-unipioutside.jpg?t=h2Ud3sk3nBf2_6o4R5z9Cw');
            background-position: center;
            background-size: cover;
            background-repeat: no-repeat;
            border-right: 1px solid rgba(255, 255, 255, 0.1);
            min-height: 100%;
        }

        .form-glass {
            background: rgba(255, 255, 255, 0.06) !important;
            border: 1px solid rgba(255, 255, 255, 0.15) !important;
            color: #ffffff !important;
            transition: all 0.3s ease;
        }

        .form-glass::placeholder {
            color: rgba(255, 255, 255, 0.4) !important;
        }

        .form-glass:focus {
            background: rgba(255, 255, 255, 0.12) !important;
            border-color: rgba(255, 255, 255, 0.4) !important;
            box-shadow: 0 0 12px rgba(255, 255, 255, 0.15) !important;
        }

        @keyframes fadeInUp {
            0% { transform: translateY(40px); opacity: 0; }
            100% { transform: translateY(0); opacity: 1; }
        }

        #login_but {
            background: #ffffff;
            color: #0A2240;
            border: none;
            font-weight: 700;
            transition: all 0.3s ease-in-out;
            box-shadow: 0 4px 15px rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.15) !important;
        }

        #login_but:hover {
            color: #ffffff;
            transform: translateY(-2px);
            background: rgba(255, 255, 255, 0.24) !important;
            border-color: rgba(255, 255, 255, 0.6) !important;
            box-shadow: 0 0 12px rgba(255, 255, 255, 0.15) !important;
        }

        #forgot_but {
            color: rgba(255, 255, 255, 0.5);
            transition: all 0.2s ease-in-out;
        }

        #forgot_but:hover {
            color: #ffffff;
            cursor: pointer;
        }

        ::selection {
            background-color: rgba(255, 255, 255, 0.12) !important;
            color: #ffffff;
        }
    </style>
</head>
<body class="d-flex align-items-center justify-content-center">

    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-lg-9 col-md-11">
                <div class="card card-custom">
                    <div class="row g-0 align-items-stretch"> <div class="col-md-5 d-none d-md-block img-panel">
                            </div>
                        
                        <div class="col-md-7 p-5">
                        	
                            <div class="d-flex gap-2 mb-4 align-items-center">
	                      		<img src="${pageContext.request.contextPath}/images/unipi.png" class="img-fluid " style="width: 30px; filter: drop-shadow(0 10px 15px rgba(0,0,0,0.3));" alt="Unipi Logo">
	                            <div class=""><p class="text-white-50 fw-bold mb-0 fs-5" style="font-size: 1.2rem;">Πανεπιστήμιο Πειραιώς</p>
	                       </div>   </div>
                            <h2 class="mb-2 text-white text-md-start text-center"><b>Είσοδος</b></h2>
                            <p class="text-white-50 small mb-4 text-md-start text-center">Ηλεκτρονική Γραμματεία</p>
                            
                            <form action="LoginServlet" method="post">
                                <div class="mb-3">
                                    <label class="form-label fw-bold text-white">Όνομα Χρήστη</label>
                                    <input type="text" name="username" class="form-control form-glass rounded-4 py-2" required placeholder="π.χ. secaug">
                                </div>
                                <div class="mb-4">
                                    <label class="form-label fw-bold text-white">Κωδικός</label>
                                    <input type="password" name="password" class="form-control form-glass rounded-4 py-2" required placeholder="••••••••">
                                </div>
                                <button id="login_but" type="submit" class="btn rounded-4 fw-bold w-100 py-2 fs-5 mb-3"><b>ΣΥΝΔΕΣΗ</b></button>
                                
                                <p id="forgot_but" class="small mb-0 text-md-start text-center">Ξέχασες τον κωδικό σου;</p>
                            </form>

                            <% if (request.getParameter("error") != null) { %>
                                <div class="alert alert-danger mt-4 rounded-4 text-center shadow-sm" style="background: rgba(128, 0, 32, 0.3); border: 1px solid rgba(255, 255, 255, 0.2); color: #ffcccc;">
                                    <b>Λάθος στοιχεία!</b><br>Προσπάθησε ξανά.
                                </div>
                            <% } %>
                            
                            <div class="text-md-start text-center text-white-50 small mt-4 pt-3 border-top border-secondary border-opacity-25" style="font-size: 0.75rem;">
                                © 2025 Filippos Obrijanu. All rights reserved.
                            </div>
                             
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>