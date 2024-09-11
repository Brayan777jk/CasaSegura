<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Lista de Solicitudes de Inmuebles</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Lista de Solicitudes de Inmuebles</h1>
        
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Referencia</th>
                    <th>Alias</th>
                    <th>Nombre Cliente</th>
                    <th>Email Cliente</th>
                    <th>Direccion Cliente</th>
                    <th>Ciudad Cliente</th>
                    <th>Fecha Solicitud</th>
                    <th>Descripcion</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
            <%
                String jdbcURL = "jdbc:mysql://localhost:3307/CasaSegura";
                String jdbcUsername = "root";
                String jdbcPassword = "";

                int usuarioId = (int) session.getAttribute("userId");
                Connection connection = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

                    String sql = "SELECT * FROM solicitudes_inmuebles WHERE usuario_id = ?";
                    PreparedStatement statement = connection.prepareStatement(sql);
                    statement.setInt(1, usuarioId);

                    ResultSet resultSet = statement.executeQuery();

                    while (resultSet.next()) {
                        int id = resultSet.getInt("id");
                        String referencia = resultSet.getString("numero_referencia");
                        String alias = resultSet.getString("alias_casa");
                        String nombreCliente = resultSet.getString("nombre_cliente");
                        String emailCliente = resultSet.getString("email_cliente");
                        String direccionCliente = resultSet.getString("direccion_cliente");
                        String ciudadCliente = resultSet.getString("ciudad_cliente");
                        String fechaSolicitud = resultSet.getString("fecha_solicitud");
                        String descripcion = resultSet.getString("comentarios");
            %>
                        <tr>
                            <td><%= id %></td>
                            <td><%= referencia %></td>
                            <td><%= alias %></td>
                            <td><%= nombreCliente %></td>
                            <td><%= emailCliente %></td>
                            <td><%= direccionCliente %></td>
                            <td><%= ciudadCliente %></td>
                            <td><%= fechaSolicitud %></td>
                            <td><%= descripcion %></td>
                            <td>
                                <a href="editarSolicitud.jsp?id=<%= id %>" class="btn btn-warning btn-sm">Editar</a>
                                <a href="eliminarSolicitud.jsp?id=<%= id %>" class="btn btn-danger btn-sm" onclick="return confirm('¿Estás seguro de eliminar esta solicitud?');">Eliminar</a>
                            </td>
                        </tr>
            <%
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
            </tbody>
        </table>
        
        <a href="solicitud_inmueble.jsp" class="btn btn-primary">Registrar Nueva Solicitud</a> <br>
        <a href="dashboard.jsp" class="btn btn-secondary mt-3">Volver</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
