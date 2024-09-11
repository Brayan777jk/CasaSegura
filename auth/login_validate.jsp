<%@ page import="java.sql.*" %>
<%@ include file="../config/db.jsp" %> <!-- Asegúrate de que el archivo db.jsp está configurando 'conn' -->
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username == null || password == null) {
        out.println("Credenciales inválidas. <a href='login.jsp'>Inténtalo de nuevo</a>.");
        return;
    }

    Connection conn = null;

    try {
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/CasaSegura", "root", "");

        String query = "SELECT * FROM usuarios WHERE username = ? AND password = MD5(?)";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, username);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            String role = rs.getString("role");
            int userId = rs.getInt("id"); // Obtener el ID del usuario
            session.setAttribute("username", username);
            session.setAttribute("role", role);
            session.setAttribute("userId", userId); // Guardar el ID del usuario en la sesión

            if ("admin".equals(role)) {
                response.sendRedirect("../admin/dashboard.jsp");
            } else if ("cliente".equals(role)) {
                response.sendRedirect("../cliente/dashboard.jsp");
            }
        } else {
            out.println("Credenciales incorrectas. <a href='login.jsp'>Inténtalo de nuevo</a>.");
        }

        rs.close();
        stmt.close();
    } catch (SQLException e) {
        out.println("<p class='text-danger'>Error de SQL: " + e.getMessage() + "</p>");
        e.printStackTrace();
    } finally {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                out.println("<p class='text-danger'>Error al cerrar la conexión.</p>");
                e.printStackTrace();
            }
        }
    }
%>
