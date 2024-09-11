<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guardar Fiador</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Registro de Fiador</h1>

        <%
            String jdbcURL = "jdbc:mysql://localhost:3307/CasaSegura";
            String jdbcUsername = "root";
            String jdbcPassword = "";

            // Obtener los datos del formulario
            String nombreFiador = request.getParameter("nombreFiador");
            String cedulaFiador = request.getParameter("cedulaFiador");
            String telefonoFiador = request.getParameter("telefonoFiador");
            String direccionFiador = request.getParameter("direccionFiador");
            String emailFiador = request.getParameter("emailFiador");
            String relacionCliente = request.getParameter("relacionCliente");

            // Fecha de registro actual
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String fechaRegistro = formatter.format(new Date());

            // Obtener el ID del usuario de la sesión
            
            int usuarioId = (int) session.getAttribute("userId");

            Connection connection = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

                String sql = "INSERT INTO fiadores (nombre_fiador, cedula_fiador, telefono_fiador, direccion_fiador, email_fiador, relacion_cliente, fecha_registro, usuario_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement statement = connection.prepareStatement(sql);

                statement.setString(1, nombreFiador);
                statement.setString(2, cedulaFiador);
                statement.setString(3, telefonoFiador);
                statement.setString(4, direccionFiador);
                statement.setString(5, emailFiador);
                statement.setString(6, relacionCliente);
                statement.setString(7, fechaRegistro);
                statement.setInt(8, usuarioId); // Asignar el ID del usuario

                int rowsInserted = statement.executeUpdate();

                if (rowsInserted > 0) {
                    out.println("<div class='alert alert-success'>El fiador ha sido registrado exitosamente.</div>");
                } else {
                    out.println("<div class='alert alert-danger'>Hubo un error al registrar al fiador.</div>");
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

        <a href="mostrar_fiadores.jsp" class="btn btn-primary mt-4">Ver Fiadores</a>
    </div>
</body>
</html>
