<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Lista de Inmuebles</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Lista de Inmuebles</h1>
        
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Dirección</th>
                    <th>Ciudad</th>
                    <th>Precio</th>
                    <th>Descripción</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
            <%
                String jdbcURL = "jdbc:mysql://localhost:3307/CasaSegura";
                String jdbcUsername = "root";
                String jdbcPassword = "";

                Connection connection = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

                    String sql = "SELECT * FROM inmuebles";
                    PreparedStatement statement = connection.prepareStatement(sql);

                    ResultSet resultSet = statement.executeQuery();

                    while (resultSet.next()) {
                        int id = resultSet.getInt("id");
                        String direccion = resultSet.getString("direccion");
                        String ciudad = resultSet.getString("ciudad");
                        String precio = resultSet.getString("precio");
                        String descripcion = resultSet.getString("descripcion");
            %>
                        <tr>
                            <td><%= id %></td>
                            <td><%= direccion %></td>
                            <td><%= ciudad %></td>
                            <td><%= precio %></td>
                            <td><%= descripcion %></td>
                            <td>
                                <a href="editar_inmueble.jsp?id=<%= id %>" class="btn btn-warning btn-sm">Editar</a>
                                <a href="eliminar_inmueble.jsp?id=<%= id %>" class="btn btn-danger btn-sm" onclick="return confirm('¿Estás seguro de eliminar este inmueble?');">Eliminar</a>
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
        
        <a href="create_inmueble.jsp" class="btn btn-primary">Registrar Nuevo Inmueble</a> <br>
        <a href="dashboard.jsp" class="btn btn-secondary mt-3">Volver</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
