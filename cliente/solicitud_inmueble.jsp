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
    <title>Solicitud de Inmueble</title>
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header bg-primary text-white text-center">
                        <h1>Formulario de Solicitud de Inmueble</h1>
                    </div>
                    <div class="card-body">
                        <!-- Formulario JSP para Solicitud de Inmueble -->
                        <form action="guardar_solicitud.jsp" method="post">
                            <div class="form-group row">
                                <label for="referencia" class="col-sm-4 col-form-label text-right">Número de Referencia:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="referencia" name="referencia" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="alias" class="col-sm-4 col-form-label text-right">Alias de la Casa:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="alias" name="alias" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="nombreCliente" class="col-sm-4 col-form-label text-right">Nombre del Cliente:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="nombreCliente" name="nombreCliente" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="emailCliente" class="col-sm-4 col-form-label text-right">Email del Cliente:</label>
                                <div class="col-sm-8">
                                    <input type="email" class="form-control" id="emailCliente" name="emailCliente" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="direccionCliente" class="col-sm-4 col-form-label text-right">Dirección del Cliente:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="direccionCliente" name="direccionCliente" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="ciudadCliente" class="col-sm-4 col-form-label text-right">Ciudad del Cliente:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="ciudadCliente" name="ciudadCliente" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="descripcion" class="col-sm-4 col-form-label text-right">Descripción del Inmueble:</label>
                                <div class="col-sm-8">
                                    <textarea class="form-control" id="descripcion" name="descripcion" rows="3" placeholder="Ej. número de habitaciones, baños, características especiales..."></textarea>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="preferenciaUbicacion" class="col-sm-4 col-form-label text-right">Preferencia de Ubicación:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="preferenciaUbicacion" name="preferenciaUbicacion" placeholder="Ej. cerca del centro, barrio seguro..." required>
                                </div>
                            </div>
                            <div class="form-group text-center">
                                <button type="submit" class="btn btn-primary btn-lg mr-2">Enviar Solicitud</button>
                                <button type="reset" class="btn btn-secondary btn-lg">Resetear</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="card-footer text-center mt-3">
                    <form action="dashboard.jsp" method="get" class="d-inline">
                        <button type="submit" class="btn btn-secondary btn-lg mr-2">Volver</button>
                    </form>
                    <form action="mostrarSolicitudes.jsp" method="get" class="d-inline">
                        <button type="submit" class="btn btn-secondary btn-lg">Ver Solicitudes</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
