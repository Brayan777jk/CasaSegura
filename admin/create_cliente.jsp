<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <title>Registro de Cliente</title>
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Registro de Cliente</h1>

        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow-lg">
                    <div class="card-header bg-primary text-white text-center">
                        <h2>Datos del Cliente</h2>
                    </div>
                    <div class="card-body">
                        <form action="guardar_cliente.jsp" method="post">
                            <div class="form-group">
                                <label for="nombreCliente">Nombre:</label>
                                <input type="text" class="form-control" id="nombreCliente" name="nombreCliente" placeholder="Ej. Juan" required>
                            </div>

                            <div class="form-group">
                                <label for="apellidosCliente">Apellidos:</label>
                                <input type="text" class="form-control" id="apellidosCliente" name="apellidosCliente" placeholder="Ej. Pérez Gómez" required>
                            </div>

                            <div class="form-group">
                                <label for="estadoCivilCliente">Estado Civil:</label>
                                <input type="text" class="form-control" id="estadoCivilCliente" name="estadoCivilCliente" placeholder="Ej. Soltero">
                            </div>

                            <div class="form-group">
                                <label for="direccionCliente">Dirección:</label>
                                <input type="text" class="form-control" id="direccionCliente" name="direccionCliente" placeholder="Ej. Calle 123 #45-67">
                            </div>

                            <div class="form-group">
                                <label for="telefonoCliente">Teléfono:</label>
                                <input type="text" class="form-control" id="telefonoCliente" name="telefonoCliente" placeholder="Ej. 1234567890">
                            </div>

                            <div class="form-group">
                                <label for="emailCliente">Email:</label>
                                <input type="email" class="form-control" id="emailCliente" name="emailCliente" placeholder="Ej. juan.perez@example.com" required>
                            </div>

                            <div class="form-group">
                                <label for="usuarioCliente">Usuario:</label>
                                <select class="form-control" id="usuarioCliente" name="usuarioCliente">
                                    <option value="">Seleccione un usuario</option>
                                    <% 
                                        String jdbcURL = "jdbc:mysql://localhost:3307/CasaSegura";
                                        String jdbcUsername = "root";
                                        String jdbcPassword = "";

                                        Connection connection = null;

                                        try {
                                            Class.forName("com.mysql.jdbc.Driver");
                                            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

                                            String sql = "SELECT id, username FROM usuarios WHERE role = 'cliente'";
                                            PreparedStatement statement = connection.prepareStatement(sql);
                                            ResultSet resultSet = statement.executeQuery();

                                            while (resultSet.next()) {
                                                int userId = resultSet.getInt("id");
                                                String username = resultSet.getString("username");
                                    %>
                                                <option value="<%= userId %>"><%= username %> (ID: <%= userId %>)</option>
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
                                </select>
                            </div>

                            <div class="form-group text-center">
                                <button type="submit" class="btn btn-success btn-lg mt-3">Registrar Cliente</button>
                                <button type="reset" class="btn btn-secondary btn-lg mt-3">Limpiar</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="card-footer text-center mt-3">
                    <a href="mostrar_clientes.jsp" class="btn btn-info btn-lg">Ver Clientes Registrados</a>
                </div>
                <div class="card-footer text-center mt-2">
                    <a href="dashboard.jsp" class="btn btn-info btn-lg">Volver</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
