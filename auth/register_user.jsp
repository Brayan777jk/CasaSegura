<%@ page import="java.sql.*" %>
<%@ include file="../config/db.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    if (username == null || email == null || password == null) {
        out.println("Datos inválidos. <a href='register.jsp'>Inténtalo de nuevo</a>.");
        return;
    }

    Connection conn = null;

    try {
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/CasaSegura", "root", "");

        String query = "INSERT INTO usuarios (username, email, password, role) VALUES (?, ?, MD5(?), 'cliente')";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, username);
        stmt.setString(2, email);
        stmt.setString(3, password);
        
        int rowsInserted = stmt.executeUpdate();
        
        if (rowsInserted > 0) {
%>
            <script>
                alert("Registro exitoso. Serás redirigido al login.");
                setTimeout(function(){
                    window.location.href = "login.jsp";
                }, 2000); // Espera 2 segundos antes de redirigir
            </script>
<%
        } else {
            out.println("Error al registrar el usuario. <a href='register.jsp'>Inténtalo de nuevo</a>.");
        }

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
