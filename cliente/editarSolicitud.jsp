<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<%
    // Parámetro de la solicitud
    int id = Integer.parseInt(request.getParameter("id"));
    String jdbcURL = "jdbc:mysql://localhost:3307/CasaSegura";
    String jdbcUsername = "root";
    String jdbcPassword = "";
    Connection connection = null;
    String referencia = "", alias = "", nombreCliente = "", emailCliente = "", direccionCliente = "", ciudadCliente = "", fechaSolicitud = "", descripcion = "";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        String sql = "SELECT * FROM solicitudes_inmuebles WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            referencia = resultSet.getString("numero_referencia");
            alias = resultSet.getString("alias_casa");
            nombreCliente = resultSet.getString("nombre_cliente");
            emailCliente = resultSet.getString("email_cliente");
            direccionCliente = resultSet.getString("direccion_cliente");
            ciudadCliente = resultSet.getString("ciudad_cliente");
            fechaSolicitud = resultSet.getString("fecha_solicitud");
            descripcion = resultSet.getString("comentarios");
        }

        resultSet.close();
        statement.close();
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    } finally {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Editar Solicitud</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Editar Solicitud</h1>
        <form action="actualizarSolicitud.jsp" method="post">
            <input type="hidden" name="id" value="<%= id %>">
            <div class="mb-3">
                <label for="referencia" class="form-label">Referencia</label>
                <input type="text" class="form-control" id="referencia" name="referencia" value="<%= referencia %>" required>
            </div>
            <div class="mb-3">
                <label for="alias" class="form-label">Alias</label>
                <input type="text" class="form-control" id="alias" name="alias" value="<%= alias %>" required>
            </div>
            <div class="mb-3">
                <label for="nombreCliente" class="form-label">Nombre del Cliente</label>
                <input type="text" class="form-control" id="nombreCliente" name="nombreCliente" value="<%= nombreCliente %>" required>
            </div>
            <div class="mb-3">
                <label for="emailCliente" class="form-label">Email del Cliente</label>
                <input type="email" class="form-control" id="emailCliente" name="emailCliente" value="<%= emailCliente %>" required>
            </div>
            <div class="mb-3">
                <label for="direccionCliente" class="form-label">Dirección del Cliente</label>
                <input type="text" class="form-control" id="direccionCliente" name="direccionCliente" value="<%= direccionCliente %>" required>
            </div>
            <div class="mb-3">
                <label for="ciudadCliente" class="form-label">Ciudad del Cliente</label>
                <input type="text" class="form-control" id="ciudadCliente" name="ciudadCliente" value="<%= ciudadCliente %>" required>
            </div>
            <div class="mb-3">
                <label for="fechaSolicitud" class="form-label">Fecha de Solicitud</label>
                <input type="date" class="form-control" id="fechaSolicitud" name="fechaSolicitud" value="<%= fechaSolicitud %>" required>
            </div>
            <div class="mb-3">
                <label for="descripcion" class="form-label">Descripción</label>
                <textarea class="form-control" id="descripcion" name="descripcion" required><%= descripcion %></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Actualizar Solicitud</button>
        </form>
        <a href="mostrarSolicitudes.jsp" class="btn btn-secondary mt-3">Volver</a>
    </div>
</body>
</html>
