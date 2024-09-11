<%@ include file="../config/db.jsp" %>
<%
    // Verificar si el usuario es administrador
    String userRole = (String) session.getAttribute("role");
    if (!"admin".equals(userRole)) {
        response.sendRedirect("../login.jsp");
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Administrador</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
    <div class="container mt-5">
        <h1>Bienvenido, Administrador</h1>
        <ul>
            <li><a href="create_inmueble.jsp">Crear Inmueble</a></li>
            <li><a href="create_cliente.jsp">Crear Cliente</a></li>
            <li><a href="update_inmueble.jsp">Actualizar Inmueble</a></li>
            <li><a href="delete_inmueble.jsp">Eliminar Inmueble</a></li>
        </ul>
    </div>
</body>
</html>
