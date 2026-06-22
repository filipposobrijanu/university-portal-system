package servlets;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;
import mainpackage.Courses;
import mainpackage.Professors;
import utils.DatabaseConnection;

@WebServlet("/SecretaryServlet")
public class SecretaryServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "viewCourses";
        
        try (Connection conn = DatabaseConnection.getConnection()) {
            
            if ("viewCourses".equals(action)) {
                String sql = "SELECT c.courseCode AS course_code, c.title, c.credits, u.name, u.surname " +
                             "FROM courses c LEFT JOIN users u ON c.professor_username = u.username";
                             
                try (Statement stmt = conn.createStatement();
                     ResultSet rs = stmt.executeQuery(sql)) {
                    
                    List<Courses> coursesList = new ArrayList<>();
                    while (rs.next()) {
                        Courses course = new Courses(rs.getString("course_code"), rs.getString("title"), rs.getInt("credits"));
                        
                        if (rs.getString("name") != null) {
                            Professors prof = new Professors("", "", rs.getString("name"), rs.getString("surname"), "", "");
                            course.setProfessor(prof);
                        }
                        coursesList.add(course);
                    }
                    request.setAttribute("coursesList", coursesList);
                    request.getRequestDispatcher("courses.jsp").forward(request, response);
                }
            }
            
            else if ("prepareAssign".equals(action)) {
                List<Map<String, String>> courses = new ArrayList<>();
                List<Map<String, String>> profs = new ArrayList<>();
                
                String sqlCourses = "SELECT courseCode AS course_code, title FROM courses";
                try (Statement stmt = conn.createStatement();
                     ResultSet rsCourses = stmt.executeQuery(sqlCourses)) {
                    while (rsCourses.next()) {
                        Map<String, String> c = new HashMap<>();
                        c.put("code", rsCourses.getString("course_code"));
                        c.put("title", rsCourses.getString("title"));
                        courses.add(c);
                    }
                }
                
                String sqlProfs = "SELECT username, name, surname FROM users WHERE role='PROFESSOR'";
                try (Statement stmt = conn.createStatement();
                     ResultSet rsProfs = stmt.executeQuery(sqlProfs)) {
                    while (rsProfs.next()) {
                        Map<String, String> p = new HashMap<>();
                        p.put("id", rsProfs.getString("username"));
                        p.put("fullname", rsProfs.getString("name") + " " + rsProfs.getString("surname"));
                        profs.add(p);
                    }
                }
                
                request.setAttribute("courses", courses);
                request.setAttribute("professors", profs);
                request.getRequestDispatcher("assignCourse.jsp").forward(request, response);
            }
            
        } catch (SQLException e) { 
            e.printStackTrace(); 
            response.sendRedirect("dashboard.jsp?error=db");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try (Connection conn = DatabaseConnection.getConnection()) {
            
            if ("assign".equals(action)) {
                String code = request.getParameter("courseCode");
                String profUsername = request.getParameter("profId");
                
                String sql = "UPDATE courses SET professor_username = ? WHERE courseCode = ?";
                
                try (PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setString(1, profUsername);
                    ps.setString(2, code);
                    ps.executeUpdate();
                }
                
                response.sendRedirect("SecretaryServlet?action=viewCourses&success=assigned");
            }
            
        } catch (SQLException e) { 
            e.printStackTrace(); 
            response.sendRedirect("dashboard.jsp?error=db");
        }
    }
}