<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Inmueble</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Editar Inmueble</h1>

        <%
            String jdbcURL = "jdbc:mysql://localhost:3307/CasaSegura";
            String jdbcUsername = "root";
            String jdbcPassword = "";
            int id = Integer.parseInt(request.getParameter("id"));
            Connection connection = null;
            String direccion = "", ciudad = "", precio = "", descripcion = "";

            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

                // Obtener los datos del inmueble
                String sql = "SELECT * FROM inmuebles WHERE id = ?";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setInt(1, id);
                ResultSet resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    direccion = resultSet.getString("direccion");
                    ciudad = resultSet.getString("ciudad");
                    precio = resultSet.getString("precio");
                    descripcion = resultSet.getString("descripcion");
                }

                resultSet.close();
                statement.close();
            } catch (ClassNotFoundException e) {
                out.println("<p>Error: No se encontró el controlador JDBC.</p>");
            } catch (SQLException e) {
                out.println("<p>Error de SQL: " + e.getMessage() + "</p>");
            } finally {
                if (connection != null) {
                    try {
                        connection.close();
                    } catch (SQLException e) {
                        out.println("<p>Error al cerrar la conexión.</p>");
                    }
                }
            }
        %>

        <form action="actualizar_inmueble.jsp" method="post">
            <input type="hidden" name="idInmueble" value="<%= id %>">
            <div class="form-group">
                <label for="direccionInmueble">Dirección del Inmueble:</label>
                <input type="text" class="form-control" id="direccionInmueble" name="direccionInmueble" value="<%= direccion %>" required>
            </div>

            <div class="form-group">
                <label for="ciudadInmueble">Ciudad:</label>
                <input type="text" class="form-control" id="ciudadInmueble" name="ciudadInmueble" value="<%= ciudad %>">
            </div>

            <div class="form-group">
                <label for="precioInmueble">Precio:</label>
                <input type="number" step="0.01" class="form-control" id="precioInmueble" name="precioInmueble" value="<%= precio %>" required>
            </div>

            <div class="form-group">
                <label for="descripcionInmueble">Descripción:</label>
                <textarea class="form-control" id="descripcionInmueble" name="descripcionInmueble" rows="3"><%= descripcion %></textarea>
            </div>

            <div class="form-group text-center">
                <button type="submit" class="btn btn-success btn-lg mt-3">Actualizar Inmueble</button>
                <a href="mostrar_inmuebles.jsp" class="btn btn-secondary btn-lg mt-3">Cancelar</a>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
