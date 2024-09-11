<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="hoja.css">
    <title>Registro de Inmueble</title>
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow-lg">
                    <div class="card-header bg-primary text-white text-center">
                        <h1>Registro de Inmueble</h1>
                        <p class="mb-0">Complete la información requerida para registrar un inmueble</p>
                    </div>
                    <div class="card-body">
                        <form action="guardar_inmueble.jsp" method="post">
                            <div class="form-group">
                                <label for="direccionInmueble">Dirección del Inmueble:</label>
                                <input type="text" class="form-control" id="direccionInmueble" name="direccionInmueble" placeholder="Ej. Calle 123 #45-67" required>
                            </div>

                            <div class="form-group">
                                <label for="ciudadInmueble">Ciudad:</label>
                                <input type="text" class="form-control" id="ciudadInmueble" name="ciudadInmueble" placeholder="Ej. Bucaramanga" required>
                            </div>

                            <div class="form-group">
                                <label for="precioInmueble">Precio:</label>
                                <input type="number" step="0.01" class="form-control" id="precioInmueble" name="precioInmueble" placeholder="Ej. 1500000.00" required>
                            </div>

                            <div class="form-group">
                                <label for="descripcionInmueble">Descripción del Inmueble:</label>
                                <textarea class="form-control" id="descripcionInmueble" name="descripcionInmueble" rows="3" placeholder="Ej. Casa de dos pisos con jardín"></textarea>
                            </div>

                            <%-- Si decides mantener el campo propietario_id, descomenta esta sección --%>
                            <%-- 
                            <div class="form-group">
                                <label for="propietarioInmueble">ID del Propietario (opcional):</label>
                                <input type="number" class="form-control" id="propietarioInmueble" name="propietarioInmueble" placeholder="Ej. 1">
                            </div>
                            --%>

                            <div class="form-group text-center">
                                <button type="submit" class="btn btn-success btn-lg mt-3">Registrar Inmueble</button>
                                <button type="reset" class="btn btn-secondary btn-lg mt-3">Limpiar</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="card-footer text-center mt-3">
                    <a href="mostrar_inmuebles.jsp" class="btn btn-info btn-lg">Ver Inmuebles Registrados</a>
                </div>
                <div class="card-footer text-center mt-2">
                    <a href="dashboard.jsp" class="btn btn-info btn-lg">Volver</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
