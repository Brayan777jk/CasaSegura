<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Actualización de Datos Personales</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Actualizar Datos Personales</h1>

        <%
            String jdbcURL = "jdbc:mysql://localhost:3307/CasaSegura";
            String jdbcUsername = "root";
            String jdbcPassword = "";

           
            int usuarioId = (int) session.getAttribute("userId");

            Connection connection = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

                String nombreCliente = request.getParameter("nombreCliente");
                String emailCliente = request.getParameter("emailCliente");
                String direccionCliente = request.getParameter("direccionCliente");
                String estadoCivil = request.getParameter("estadoCivil");

                String sql = "UPDATE clientes SET email = ?, direccion = ?, estado_civil = ? WHERE  usuario_id = ?";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, emailCliente);
                statement.setString(2, direccionCliente);
                statement.setString(3, estadoCivil);
                statement.setInt(4, usuarioId);

                int rowsUpdated = statement.executeUpdate();
                
                if (rowsUpdated > 0) {
                    out.println("<p class='alert alert-success'>Datos actualizados correctamente.</p>");
                } else {
                    out.println("<p class='alert alert-warning'>No se actualizaron datos.</p>");
                }

                statement.close();
            } catch (ClassNotFoundException e) {
                out.println("<p>Error: No se encontró el controlador JDBC.</p>");
                e.printStackTrace();
            } catch (SQLException e) {
                out.println("<p>Error de SQL: " + e.getMessage() + "</p>");
                e.printStackTrace();
            } finally {
                try {
                    if (connection != null && !connection.isClosed()) {
                        connection.close();
                    }
                } catch (SQLException e) {
                    out.println("<p>Error al cerrar la conexión.</p>");
                    e.printStackTrace();
                }
            }
        %>

        <a href="datos.jsp" class="btn btn-secondary mt-3">Volver</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
