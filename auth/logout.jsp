<%@ page session="true" %>
<%
    // Invalida la sesión actual
    session.invalidate();

    // Redirige a la página de inicio de sesión
    response.sendRedirect("login.jsp");
%>
