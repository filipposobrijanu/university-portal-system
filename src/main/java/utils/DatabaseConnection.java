package utils;
import java.sql.*;

public class DatabaseConnection {
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) { e.printStackTrace(); }
        return DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/p23137_erg2_university?useSSL=false&serverTimezone=UTC", 
            "root", "adminPass123");
    }
}