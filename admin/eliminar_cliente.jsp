<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eliminar Cliente</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Eliminar Cliente</h1>

        <%
            String jdbcURL = "jdbc:mysql://localhost:3307/CasaSegura";
            String jdbcUsername = "root";
            String jdbcPassword = "";

            int clienteId = Integer.parseInt(request.getParameter("id"));

            Connection connection = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

                String sql = "DELETE FROM clientes WHERE id = ?";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setInt(1, clienteId);

                int rowsDeleted = statement.executeUpdate();

                if (rowsDeleted > 0) {
                    out.println("<div class='alert alert-success'>El cliente ha sido eliminado exitosamente.</div>");
                } else {
                    out.println("<div class='alert alert-danger'>No se encontró el cliente.</div>");
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
