<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));

    String jdbcURL = "jdbc:mysql://localhost:3307/CasaSegura";
    String jdbcUsername = "root";
    String jdbcPassword = "";

    Connection connection = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

        String sql = "DELETE FROM solicitudes_inmuebles WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);

        int rowsDeleted = statement.executeUpdate();
        if (rowsDeleted > 0) {
            out.println("<script>alert('La solicitud ha sido eliminada con éxito'); window.location='mostrarSolicitudes.jsp';</script>");
        }

        statement.close();
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        out.println("<p>Error al eliminar la solicitud: " + e.getMessage() + "</p>");
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
