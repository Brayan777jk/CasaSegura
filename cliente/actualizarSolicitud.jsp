
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String referencia = request.getParameter("referencia");
    String alias = request.getParameter("alias");
    String nombreCliente = request.getParameter("nombreCliente");
    String emailCliente = request.getParameter("emailCliente");
    String direccionCliente = request.getParameter("direccionCliente");
    String ciudadCliente = request.getParameter("ciudadCliente");
    String fechaSolicitud = request.getParameter("fechaSolicitud");
    String descripcion = request.getParameter("descripcion");

    String jdbcURL = "jdbc:mysql://localhost:3307/CasaSegura";
    String jdbcUsername = "root";
    String jdbcPassword = "";

    Connection connection = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

        String sql = "UPDATE solicitudes_inmuebles SET numero_referencia = ?, alias_casa = ?, nombre_cliente = ?, email_cliente = ?, direccion_cliente = ?, ciudad_cliente = ?, fecha_solicitud = ?, comentarios = ? WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, referencia);
        statement.setString(2, alias);
        statement.setString(3, nombreCliente);
        statement.setString(4, emailCliente);
        statement.setString(5, direccionCliente);
        statement.setString(6, ciudadCliente);
        statement.setString(7, fechaSolicitud);
        statement.setString(8, descripcion);
        statement.setInt(9, id);

        int rowsUpdated = statement.executeUpdate();
        if (rowsUpdated > 0) {
            out.println("<script>alert('La solicitud ha sido actualizada con éxito'); window.location='mostrarSolicitudes.jsp';</script>");
        }

        statement.close();
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        out.println("<p>Error al actualizar la solicitud: " + e.getMessage() + "</p>");
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
