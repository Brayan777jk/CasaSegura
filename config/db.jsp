<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException" %>
<%@ page import="java.sql.*" %>
<%
    String jdbcURL = "jdbc:mysql://localhost:3307/CasaSegura"; // Cambia la URL si es necesario
    String jdbcUsername = "root"; // Cambia al nombre de usuario de la BD
    String jdbcPassword = ""; // Cambia a la contraseña de la BD
    Connection connection = null;
    PreparedStatement statement = null;

    try {
        // Establecer la conexión
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

        // Aquí deberías agregar la consulta SQL y el PreparedStatement
        String sql = "INSERT INTO usuarios (nombre, correo, contrasena) VALUES (?, ?, ?)"; // Ejemplo
        statement = connection.prepareStatement(sql);
        // Configurar los parámetros del PreparedStatement
        // statement.setString(1, "valor1");
        // statement.setString(2, "valor2");
        // statement.setString(3, "valor3");
        
        int rowsInserted = statement.executeUpdate();

        if (rowsInserted > 0) {
            out.println("<p class='text-success'>El usuario ha sido registrado exitosamente.</p>");
        } else {
            out.println("<p class='text-danger'>Error al registrar el usuario.</p>");
        }
    } catch (ClassNotFoundException e) {
        out.println("<p class='text-danger'>Error: No se encontró el controlador JDBC.</p>");
        e.printStackTrace();
    } catch (SQLException e) {
        out.println("<p class='text-danger'>Error de SQL: " + e.getMessage() + "</p>");
        e.printStackTrace();
    } finally {
        try {
            if (statement != null) {
                statement.close();
            }
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            out.println("<p class='text-danger'>Error al cerrar la conexión.</p>");
            e.printStackTrace();
        }
    }
%>
