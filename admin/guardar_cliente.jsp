<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guardar Cliente</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Guardar Cliente</h1>

        <%
            String jdbcURL = "jdbc:mysql://localhost:3307/CasaSegura";
            String jdbcUsername = "root";
            String jdbcPassword = "";

            // Obtener los datos del formulario
            String nombre = request.getParameter("nombreCliente");
            String apellidos = request.getParameter("apellidosCliente");
            String estadoCivil = request.getParameter("estadoCivilCliente");
            String direccion = request.getParameter("direccionCliente");
            String telefono = request.getParameter("telefonoCliente");
            String email = request.getParameter("emailCliente");
            String usuarioIdStr = request.getParameter("usuarioCliente");
            Integer usuarioId = (usuarioIdStr != null && !usuarioIdStr.isEmpty()) ? Integer.parseInt(usuarioIdStr) : null;

            Connection connection = null;

            // Verificar que los campos obligatorios no estén vacíos
            if (nombre == null || nombre.isEmpty() || email == null || email.isEmpty()) {
                out.println("<div class='alert alert-danger'>Error: Los campos 'Nombre' y 'Email' son obligatorios.</div>");
            } else {
                try {
                    Class.forName("com.mysql.jdbc.Driver"); // Asegúrate de usar el driver correcto
                    connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

                    String sql = "INSERT INTO clientes (nombre, apellidos, estado_civil, direccion, telefono, email, usuario_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement statement = connection.prepareStatement(sql);

                    statement.setString(1, nombre);
                    statement.setString(2, apellidos);
                    statement.setString(3, estadoCivil != null && !estadoCivil.isEmpty() ? estadoCivil : null);
                    statement.setString(4, direccion != null && !direccion.isEmpty() ? direccion : null);
                    statement.setString(5, telefono != null && !telefono.isEmpty() ? telefono : null);
                    statement.setString(6, email);
                    statement.setObject(7, usuarioId); // Usa setObject para manejar NULL

                    int rowsInserted = statement.executeUpdate();

                    if (rowsInserted > 0) {
                        out.println("<div class='alert alert-success'>El cliente ha sido registrado exitosamente.</div>");
                    } else {
                        out.println("<div class='alert alert-danger'>Hubo un error al registrar el cliente.</div>");
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
            }
        %>

        <a href="mostrar_clientes.jsp" class="btn btn-primary mt-4">Ver Clientes</a>
    </div>
</body>
</html>
