<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Guardar Solicitud</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Guardando Solicitud de Inmueble</h1>

        <%
            // Datos de conexión
            String jdbcURL = "jdbc:mysql://localhost:3307/CasaSegura";
            String jdbcUsername = "root";
            String jdbcPassword = "";
            

            // Obtener datos del formulario
            String referencia = request.getParameter("referencia");
            String alias = request.getParameter("alias");
            String nombreCliente = request.getParameter("nombreCliente");
            String emailCliente = request.getParameter("emailCliente");
            String direccionCliente = request.getParameter("direccionCliente");
            String ciudadCliente = request.getParameter("ciudadCliente");
            String preferenciaUbicacion = request.getParameter("preferenciaUbicacion");
            String descripcion = request.getParameter("descripcion");

            // Obtener fecha actual para la solicitud
            String fechaSolicitudStr = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

            int usuarioId = (int) session.getAttribute("userId");
            Connection connection = null;

            try {
                // Cargar controlador MySQL JDBC
                Class.forName("com.mysql.jdbc.Driver");

                // Establecer conexión
                connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

                // Insertar datos en la tabla
                String sql = "INSERT INTO solicitudes_inmuebles (numero_referencia, alias_casa, nombre_cliente, email_cliente, direccion_cliente, ciudad_cliente, fecha_solicitud, comentarios, usuario_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement statement = connection.prepareStatement(sql);

                // Asignar valores a la consulta
                statement.setString(1, referencia);
                statement.setString(2, alias);
                statement.setString(3, nombreCliente);
                statement.setString(4, emailCliente);
                statement.setString(5, direccionCliente);
                statement.setString(6, ciudadCliente);
                statement.setString(7, fechaSolicitudStr);
                statement.setString(8, descripcion);
                statement.setInt(9, usuarioId); // Asignar el ID del usuario

                // Ejecutar la inserción
                int rowsInserted = statement.executeUpdate();

                if (rowsInserted > 0) {
                    out.println("<div class='alert alert-success'>La solicitud ha sido registrada exitosamente.</div>");
                } else {
                    out.println("<div class='alert alert-danger'>Hubo un error al registrar la solicitud.</div>");
                }

                // Cerrar la conexión
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

        <div class="text-center mt-4">
            <a href="mostrarSolicitudes.jsp" class="btn btn-secondary">Ver Solicitudes</a>
            <a href="solicitud_inmueble.jsp" class="btn btn-primary">Volver al Formulario</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
