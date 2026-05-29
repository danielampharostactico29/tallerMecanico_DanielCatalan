package org.danielcatalan.model.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    private static final String URL = "jdbc:mysql://localhost:3306/tallermecanicodb_in4cm?serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "danielm29110";

    public static Connection conectar() throws SQLException{
        Connection conexion = null;
        try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conexion = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            System.err.print("ERROR: no hay driver");
        } catch (SQLException e) {
            System.err.println("ERROR: no se pudo conectar: " + e.getMessage());
        }
        return conexion;
    }
}