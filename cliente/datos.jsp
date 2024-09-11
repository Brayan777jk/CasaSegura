<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
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
        <h1 class="text-center mb-4">Actualización de Datos Personales</h1>

        <%
            String jdbcURL = "jdbc:mysql://localhost:3307/CasaSegura";
            String jdbcUsername = "root";
            String jdbcPassword = "";

            int usuarioId = (int) session.getAttribute("userId");
            Connection connection = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

                String sql = "SELECT * FROM clientes WHERE usuario_id = ?";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setInt(1, usuarioId);
                ResultSet resultSet = statement.executeQuery();

                String nombreCliente = "";
                String emailCliente = "";
                String direccionCliente = "";
                String estadoCivil = "";

                if (resultSet.next()) {
                    nombreCliente = resultSet.getString("nombre");
                    emailCliente = resultSet.getString("email");
                    direccionCliente = resultSet.getString("direccion");
                    estadoCivil = resultSet.getString("estado_civil");
                }

                resultSet.close();
                statement.close();
        %>
        
        <form action="actualizar_datos.jsp" method="post">
            <div class="mb-3">
                <label for="nombreCliente" class="form-label">Nombre Completo</label>
                <input type="text" class="form-control" id="nombreCliente" name="nombreCliente" value="<%= nombreCliente %>" readonly>
            </div>
            <div class="mb-3">
                <label for="emailCliente" class="form-label">Correo Electrónico</label>
                <input type="email" class="form-control" id="emailCliente" name="emailCliente" value="<%= emailCliente %>">
            </div>
            <div class="mb-3">
                <label for="direccionCliente" class="form-label">Dirección</label>
                <input type="text" class="form-control" id="direccionCliente" name="direccionCliente" value="<%= direccionCliente %>">
            </div>
            <div class="mb-3">
                <label for="estadoCivil" class="form-label">Estado Civil</label>
                <select class="form-select" id="estadoCivil" name="estadoCivil">
                    <option value="Soltero" <%= estadoCivil.equals("Soltero") ? "selected" : "" %>>Soltero</option>
                    <option value="Casado" <%= estadoCivil.equals("Casado") ? "selected" : "" %>>Casado</option>
                    <option value="Divorciado" <%= estadoCivil.equals("Divorciado") ? "selected" : "" %>>Divorciado</option>
                    <option value="Viudo" <%= estadoCivil.equals("Viudo") ? "selected" : "" %>>Viudo</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Actualizar Datos</button>
        </form>

        <%
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

        <a href="dashboard.jsp" class="btn btn-secondary mt-3">Volver</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
