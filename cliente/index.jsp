<%@ include file="../config/db.jsp" %>
<%@ page session="true" %>
<%
    String rol = (String) session.getAttribute("rol");
    if (rol == null || !rol.equals("usuario")) {
        response.sendRedirect("../login.jsp");
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Cliente - CasaSegura</title>
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="dashboard.jsp">CasaSegura</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="dashboard.jsp">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../logout.jsp">Cerrar Sesión</a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="container mt-5">
        <h1 class="text-center">Bienvenido, Usuario</h1>
        <div class="row mt-4">
            <div class="col-md-4">
                <a href="solicitud_inmueble.jsp" class="btn btn-primary btn-block">Solicitar Inmueble</a>
            </div>
            <div class="col-md-4">
                <a href="update_profile.jsp" class="btn btn-secondary btn-block">Actualizar Datos Personales</a>
            </div>
            <div class="col-md-4">
                <a href="update_fiador.jsp" class="btn btn-info btn-block">Formulario de Fiadores</a>
            </div>
        </div>
    </div>
</body>
</html>
