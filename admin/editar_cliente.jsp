<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Editar Cliente</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Editar Cliente</h1>

        <%
            String jdbcURL = "jdbc:mysql://localhost:3307/CasaSegura";
            String jdbcUsername = "root";
            String jdbcPassword = "";

            int clienteId = Integer.parseInt(request.getParameter("id"));

            Connection connection = null;
            String nombre = "";
            String apellidos = "";
            String estadoCivil = "";
            String direccion = "";
            String telefono = "";
            String email = "";
            int usuarioId = 0;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

                String sql = "SELECT * FROM clientes WHERE id = ?";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setInt(1, clienteId);

                ResultSet resultSet = statement.executeQuery();

                if (resultSet.next()) {
                    nombre = resultSet.getString("nombre");
                    apellidos = resultSet.getString("apellidos");
                    estadoCivil = resultSet.getString("estado_civil");
                    direccion = resultSet.getString("direccion");
                    telefono = resultSet.getString("telefono");
                    email = resultSet.getString("email");
                    usuarioId = resultSet.getInt("usuario_id");
                }

                resultSet.close();
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

        <form action="actualizar_cliente.jsp" method="post">
            <input type="hidden" name="id" value="<%= clienteId %>">
            
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre:</label>
                <input type="text" class="form-control" id="nombre" name="nombre" value="<%= nombre %>" required>
            </div>
            
            <div class="mb-3">
                <label for="apellidos" class="form-label">Apellidos:</label>
                <input type="text" class="form-control" id="apellidos" name="apellidos" value="<%= apellidos %>" required>
            </div>
            
            <div class="mb-3">
                <label for="estadoCivil" class="form-label">Estado Civil:</label>
                <input type="text" class="form-control" id="estadoCivil" name="estadoCivil" value="<%= estadoCivil %>">
            </div>
            
            <div class="mb-3">
                <label for="direccion" class="form-label">Dirección:</label>
                <input type="text" class="form-control" id="direccion" name="direccion" value="<%= direccion %>">
            </div>
            
            <div class="mb-3">
                <label for="telefono" class="form-label">Teléfono:</label>
                <input type="text" class="form-control" id="telefono" name="telefono" value="<%= telefono %>">
            </div>
            
            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" class="form-control" id="email" name="email" value="<%= email %>" required>
            </div>
            
            <div class="mb-3">
                <label for="usuarioId" class="form-label">ID Usuario:</label>
                <input type="number" class="form-control" id="usuarioId" name="usuarioId" value="<%= usuarioId %>">
            </div>

            <button type="submit" class="btn btn-primary">Guardar Cambios</button>
            <a href="mostrar_clientes.jsp" class="btn btn-secondary">Volver</a>
        </form>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
