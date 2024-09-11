<%@ page session="true" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String role = (String) session.getAttribute("role");
    if (role == null || !"admin".equals(role)) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Admin - CasaSegura</title>
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card-header {
            background-color: #007bff;
            color: white;
        }
        .card-body {
            padding: 2rem;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }
        .card-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
            background-color: #e9ecef;
        }
        .text-center {
            color: #343a40;
        }
        .container {
            margin-top: 2rem;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="dashboard.jsp">CasaSegura Admin</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="dashboard.jsp">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../auth/logout.jsp">Cerrar Sesión</a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="container">
        <h1 class="text-center">Bienvenido, Administrador</h1>
        <div class="row mt-4">
            <div class="col-md-6 mb-4">
                <div class="card">
                    <img src="../images/inmueble.jpg" alt="Crear Inmueble" class="card-image">
                    <div class="card-header">
                        <h4 class="card-title">Crear Inmueble</h4>
                    </div>
                    <div class="card-body text-center">
                        <p>Administra la información de los inmuebles, añadiendo nuevos registros según sea necesario.</p>
                        <a href="create_inmueble.jsp" class="btn btn-primary">Crear Inmueble</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 mb-4">
                <div class="card">
                    <img src="../images/cliente.jpg" alt="Crear Cliente" class="card-image">
                    <div class="card-header">
                        <h4 class="card-title">Crear Cliente</h4>
                    </div>
                    <div class="card-body text-center">
                        <p>Administra la información de los clientes, añadiendo nuevos registros según sea necesario.</p>
                        <a href="create_cliente.jsp" class="btn btn-primary">Crear Cliente</a>
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
