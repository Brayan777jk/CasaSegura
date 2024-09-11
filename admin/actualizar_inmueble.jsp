<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Actualizar Inmueble</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Actualización de Inmueble</h1>

        <%
            String jdbcURL = "jdbc:mysql://localhost:3307/CasaSegura";
            String jdbcUsername = "root";
            String jdbcPassword = "";

            int id = Integer.parseInt(request.getParameter("idInmueble"));
            String direccion = request.getParameter("direccionInmueble");
            String ciudad = request.getParameter("ciudadInmueble");
            String precio = request.getParameter("precioInmueble");
            String descripcion = request.getParameter("descripcionInmueble");

            Connection connection = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

                String sql = "UPDATE inmuebles SET direccion = ?, ciudad = ?, precio = ?, descripcion = ? WHERE id = ?";
                PreparedStatement statement = connection.prepareStatement(sql);

                statement.setString(1, direccion);
                statement.setString(2, ciudad != null && !ciudad.isEmpty() ? ciudad : null);
                statement.setString(3, precio);
                statement.setString(4, descripcion != null && !descripcion.isEmpty() ? descripcion : null);
                statement.setInt(5, id);

                int rowsUpdated = statement.executeUpdate();

                if (rowsUpdated > 0) {
                    out.println("<div class='alert alert-success'>El inmueble ha sido actualizado exitosamente.</div>");
                } else {
                    out.println("<div class='alert alert-danger'>Hubo un error al actualizar el inmueble.</div>");
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

        <a href="mostrar_inmuebles.jsp" class="btn btn-primary mt-4">Ver Inmuebles</a>
    </div>
</body>
</html>
