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
    <title>Registro de Fiadores</title>
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow-lg">
                    <div class="card-header bg-primary text-white text-center">
                        <h1>Registro de Fiadores</h1>
                        <p class="mb-0">Complete la información requerida para registrar a un fiador</p>
                    </div>
                    <div class="card-body">
                        <form action="guardar_fiador.jsp" method="post">
                            <div class="form-group">
                                <label for="nombreFiador">Nombre Completo del Fiador:</label>
                                <input type="text" class="form-control" id="nombreFiador" name="nombreFiador" placeholder="Ej. Juan Pérez" required>
                            </div>

                            <div class="form-group">
                                <label for="cedulaFiador">Cédula del Fiador:</label>
                                <input type="text" class="form-control" id="cedulaFiador" name="cedulaFiador" placeholder="Ej. 12345678" required>
                            </div>

                            <div class="form-group">
                                <label for="direccionFiador">Dirección:</label>
                                <input type="text" class="form-control" id="direccionFiador" name="direccionFiador" placeholder="Ej. Calle 123 #45-67" required>
                            </div>

                            <div class="form-group">
                                <label for="telefonoFiador">Teléfono de Contacto:</label>
                                <input type="text" class="form-control" id="telefonoFiador" name="telefonoFiador" placeholder="Ej. 3001234567" required>
                            </div>

                            <div class="form-group">
                                <label for="emailFiador">Email:</label>
                                <input type="email" class="form-control" id="emailFiador" name="emailFiador" placeholder="Ej. juanperez@mail.com">
                            </div>

                            <div class="form-group">
    <label for="relacionCliente">Relación con el Cliente:</label>
    <select class="form-control" id="relacionCliente" name="relacionCliente" required>
        <option value="">Seleccione la relación</option>
        <option value="Familiar">Familiar</option>
        <option value="Amigo">Amigo</option>
        <option value="Colega">Colega</option>
        <option value="Jefe">Jefe</option>
        <option value="Otro">Otro</option>
    </select>
</div>


                            <div class="form-group">
                                <label for="ocupacionFiador">Ocupación:</label>
                                <input type="text" class="form-control" id="ocupacionFiador" name="ocupacionFiador" placeholder="Ej. Ingeniero, Contador">
                            </div>

                            <div class="form-group">
                                <label for="empresaFiador">Empresa donde Labora (opcional):</label>
                                <input type="text" class="form-control" id="empresaFiador" name="empresaFiador" placeholder="Ej. XYZ S.A.">
                            </div>

                            <div class="form-group text-center">
                                <button type="submit" class="btn btn-success btn-lg mt-3">Registrar Fiador</button>
                                <button type="reset" class="btn btn-secondary btn-lg mt-3">Limpiar</button>
                            </div>
                        </form>
                    </div>
                </div>
 
                <div class="card-footer text-center mt-3">
                    <a href="mostrar_fiadores.jsp" class="btn btn-info btn-lg">Ver Fiadores Registrados</a>
                </div>
                <div class="card-footer text-center mt-2">
                    <a href="dashboard.jsp" class="btn btn-info btn-lg">Volver</a>
                </div>

                 <%-- <form action="dashboardCliente.jsp" method="get" class="d-inline">
                        <button type="submit" class="btn btn-secondary btn-lg text center">Volver</button>
                </form> --%>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
