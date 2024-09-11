<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Lista de Fiadores</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Lista de Fiadores</h1>
        
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Cédula</th>
                    <th>Teléfono</th>
                    <th>Dirección</th>
                    <th>Email</th>
                    <th>Relación con Cliente</th>
                    <th>Fecha de Registro</th>
                </tr>
            </thead>
            <tbody>
            <%
                String jdbcURL = "jdbc:mysql://localhost:3307/CasaSegura";
                String jdbcUsername = "root";
                String jdbcPassword = "";

                // Obtener el ID del usuario de la sesión
                
                int usuarioId = (int) session.getAttribute("userId");

                Connection connection = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

                    String sql = "SELECT * FROM fiadores WHERE usuario_id = ?";
                    PreparedStatement statement = connection.prepareStatement(sql);
                    statement.setInt(1, usuarioId); // Filtrar por el ID del usuario
                    ResultSet resultSet = statement.executeQuery();

                    while (resultSet.next()) {
                        int id = resultSet.getInt("id");
                        String nombreFiador = resultSet.getString("nombre_fiador");
                        String cedulaFiador = resultSet.getString("cedula_fiador");
                        String telefonoFiador = resultSet.getString("telefono_fiador");
                        String direccionFiador = resultSet.getString("direccion_fiador");
                        String emailFiador = resultSet.getString("email_fiador");
                        String relacionCliente = resultSet.getString("relacion_cliente");
                        String fechaRegistro = resultSet.getString("fecha_registro");
            %>
                        <tr>
                            <td><%= id %></td>
                            <td><%= nombreFiador %></td>
                            <td><%= cedulaFiador %></td>
                            <td><%= telefonoFiador %></td>
                            <td><%= direccionFiador %></td>
                            <td><%= emailFiador %></td>
                            <td><%= relacionCliente %></td>
                            <td><%= fechaRegistro %></td>
                        </tr>
            <%
                    }

                    resultSet.close();
                    statement.close();
                } catch (ClassNotFoundException e) {
                    out.println("<div class='alert alert-danger'>Error: No se encontró el controlador JDBC.</div>");
                    e.printStackTrace();
                } catch (SQLException e) {
                    out.println("<div class='alert alert-danger'>Error de SQL: " + e.getMessage() + "</div>");
                    e.printStackTrace();
                } finally {
                    try {
                        if (connection != null && !connection.isClosed()) {
                            connection.close();
                        }
                    } catch (SQLException e) {
                        out.println("<div class='alert alert-danger'>Error al cerrar la conexión.</div>");
                        e.printStackTrace();
                    }
                }
            %>
            </tbody>
        </table>
        <a href="fiadores.jsp" class="btn btn-primary">Registrar Nuevo Fiador</a> <br>
        <a href="dashboard.jsp" class="btn btn-secondary mt-4">Volver al Inicio</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
