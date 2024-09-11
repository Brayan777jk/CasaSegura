<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Lista de Clientes</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Lista de Clientes</h1>
        
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Apellidos</th>
                    <th>Estado Civil</th>
                    <th>Dirección</th>
                    <th>Teléfono</th>
                    <th>Email</th>
                    <th>ID Usuario</th>
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
                    Class.forName("com.mysql.jdbc.Driver"); // Usa el driver correcto
                    connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

                    String sql = "SELECT * FROM clientes";
                    PreparedStatement statement = connection.prepareStatement(sql);

                    ResultSet resultSet = statement.executeQuery();

                    while (resultSet.next()) {
                        int id = resultSet.getInt("id");
                        String nombre = resultSet.getString("nombre");
                        String apellidos = resultSet.getString("apellidos");
                        String estadoCivil = resultSet.getString("estado_civil");
                        String direccion = resultSet.getString("direccion");
                        String telefono = resultSet.getString("telefono");
                        String email = resultSet.getString("email");
                        int usuarioId = resultSet.getInt("usuario_id");
            %>
                        <tr>
                            <td><%= id %></td>
                            <td><%= nombre %></td>
                            <td><%= apellidos %></td>
                            <td><%= estadoCivil %></td>
                            <td><%= direccion %></td>
                            <td><%= telefono %></td>
                            <td><%= email %></td>
                            <td><%= usuarioId %></td>
                            <td>
                                <a href="editar_cliente.jsp?id=<%= id %>" class="btn btn-warning btn-sm">Editar</a>
                                <a href="eliminar_cliente.jsp?id=<%= id %>" class="btn btn-danger btn-sm" onclick="return confirm('¿Estás seguro de eliminar este cliente?');">Eliminar</a>
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
        
        <a href="create_cliente.jsp" class="btn btn-primary">Registrar Nuevo Cliente</a> <br>
        <a href="dashboard.jsp" class="btn btn-secondary mt-3">Volver</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
