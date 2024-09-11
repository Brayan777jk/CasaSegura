<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Actualizar Cliente</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Actualizar Cliente</h1>

        <%
            String jdbcURL = "jdbc:mysql://localhost:3307/CasaSegura";
            String jdbcUsername = "root";
            String jdbcPassword = "";

            int clienteId = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            String estadoCivil = request.getParameter("estadoCivil");
            String direccion = request.getParameter("direccion");
            String telefono = request.getParameter("telefono");
            String email = request.getParameter("email");
            int usuarioId = Integer.parseInt(request.getParameter("usuarioId"));

            Connection connection = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

                String sql = "UPDATE clientes SET nombre = ?, apellidos = ?, estado_civil = ?, direccion = ?, telefono = ?, email = ?, usuario_id = ? WHERE id = ?";
                PreparedStatement statement = connection.prepareStatement(sql);

                statement.setString(1, nombre);
                statement.setString(2, apellidos);
                statement.setString(3, estadoCivil != null && !estadoCivil.isEmpty() ? estadoCivil : null);
                statement.setString(4, direccion != null && !direccion.isEmpty() ? direccion : null);
                statement.setString(5, telefono != null && !telefono.isEmpty() ? telefono : null);
                statement.setString(6, email);
                statement.setInt(7, usuarioId);
                statement.setInt(8, clienteId);

                int rowsUpdated = statement.executeUpdate();

                if (rowsUpdated > 0) {
                    out.println("<div class='alert alert-success'>El cliente ha sido actualizado exitosamente.</div>");
                } else {
                    out.println("<div class='alert alert-danger'>Hubo un error al actualizar el cliente.</div>");
                }

                statement.close();
            } catch (ClassNotFoundException e) {
                out.println("<div class='alert alert-danger'>Error: No se encontró el controlador JDBC.</div>");
            } catch (SQLException e) {
                out.println("<div class='alert alert-danger'>Error de SQL: " + e.getMessage() + "</div>");
            } finally {
                if (connection != null) {
                    try {
                        connection.close();
                    } catch (SQLException e) {
                        out.println("<div class='alert alert-danger'>Error al cerrar la conexión.</div>");
                    }
                }
            }
        %>

        <a href="mostrar_clientes.jsp" class="btn btn-primary mt-4">Ver Clientes</a>
    </div>
</body>
</html>
