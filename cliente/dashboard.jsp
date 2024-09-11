<%@ page session="true" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    // Verificar si el usuario es un cliente
    String role = (String) session.getAttribute("role"); // Usar consistentemente "role"
    if (role == null || !"cliente".equals(role)) { // Verifica que el usuario sea un cliente
        response.sendRedirect("../login.jsp"); // Redirige si no es un cliente
        return; // Asegúrate de no continuar ejecutando el código
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
        <a class="navbar-brand" href="dashboard.jsp">CasaSegura Cliente</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <%-- <li class="nav-item">
                    <a class="nav-link" href="dashboard.jsp">Dashboard</a>
                </li> --%>
                <li class="nav-item">
                    <a class="nav-link" href="../auth/logout.jsp">Cerrar Sesión</a>
                </li>
            </ul>
        </div>
    </nav>
    
    <div class="container mt-5">
        <h1 class="text-center">Bienvenido, Cliente</h1>
        <p class="text-center">Aquí puedes gestionar tus solicitudes de inmuebles, llenar el formulario de fiadores y actualizar tus datos personales.</p>
        
        <div class="row mt-4">
            <!-- CRUD de solicitudes de inmuebles -->
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Solicitudes de Inmuebles</h5>
                        <p class="card-text">Gestiona tus solicitudes de inmuebles: crea, lee, actualiza o elimina tus solicitudes.</p>
                        <a href="solicitud_inmueble.jsp" class="btn btn-primary">Gestionar Solicitudes</a>
                    </div>
                </div>
            </div>
            
            <!-- Formulario de fiadores -->
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Formulario de Fiadores</h5>
                        <p class="card-text">Llena el formulario con los datos de tus fiadores para la solicitud de inmuebles.</p>
                        <a href="fiadores.jsp" class="btn btn-primary">Llenar Formulario</a>
                    </div>
                </div>
            </div>
            
            <!-- Actualización de datos personales -->
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Actualizar Datos Personales</h5>
                        <p class="card-text">Actualiza tus datos personales, como estado civil, dirección, correo, etc.</p>
                        <a href="datos.jsp" class="btn btn-warning">Actualizar Datos</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
