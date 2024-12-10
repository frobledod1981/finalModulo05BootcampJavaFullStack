<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.edutecno.modelo.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administración - Horóscopo Chino</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-info">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Horóscopo Chino</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="main.jsp">Inicio</a>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="logoutServlet">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Contenido de Administración -->
    <div class="container mt-5">
<%--         <% Usuario usuario = (Usuario) request.getAttribute("usuario"); %> --%>
<%--         <h3 class="text-center">¿Qué deseas hacer, <%= usuario.getNombre() %>!?</h3> --%>

<% 
HttpSession miSesion = request.getSession(false);
Usuario usuario = (Usuario) session.getAttribute("usuario"); %>
<h3 class="text-center">Bienvenido, <%= usuario.getNombre() %>!</h3>
        <div class="row mt-4">
            <div class="col text-center">
                <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#conoceAnimalModal">Conoce tu animal</button>
            </div>
            <div class="col text-center">
                <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#buscarUsuariosModal">Buscar usuarios</button>
            </div>
            <div class="col text-center">
                <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#modificarDatosModal">Modificar datos</button>
            </div>
            <div class="col text-center">
                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#eliminarCuentaModal">Eliminar cuenta</button>
            </div>
        </div>
    </div>

    <!-- Modal Conoce tu animal -->
    <div class="modal fade" id="conoceAnimalModal" tabindex="-1" aria-labelledby="conoceAnimalModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="conoceAnimalModalLabel">Conoce tu animal</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Contenido del modal -->
                    Conoce tu animal del horóscopo chino.
                </div>
                <div class="modal-footer">
<%--                     <a href="consultahoroscopo.jsp?animal=<%=usuario.getAnimal() %>" class="btn btn-primary">Acción Conoce tu animal</a> --%>
<a href="consultahoroscopo.jsp?animal=<%=usuario.getAnimal() %>" class="btn btn-primary">Conoce tu animal</a>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Buscar usuarios -->
    <div class="modal fade" id="buscarUsuariosModal" tabindex="-1" aria-labelledby="buscarUsuariosModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="buscarUsuariosModalLabel">Buscar usuarios</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Contenido del modal -->
                     Buscar usuarios registrados.
                </div>
                <div class="modal-footer">
                    <a href="buscarUsuarioServlet" class="btn btn-primary">Listar usuarios</a>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Modificar datos -->
    <div class="modal fade" id="modificarDatosModal" tabindex="-1" aria-labelledby="modificarDatosModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modificarDatosModalLabel">Modificar datos</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Contenido del modal -->
                    Modificar datos de los usuarios.
                </div>
                <div class="modal-footer">
                    <a href="modificar.jsp" class="btn btn-warning">Modificar datos</a>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Eliminar cuenta -->
    <div class="modal fade" id="eliminarCuentaModal" tabindex="-1" aria-labelledby="eliminarCuentaModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="eliminarCuentaModalLabel">Eliminar cuenta</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Contenido del modal -->
                    Eliminar cuentas de usuarios.
                </div>
                <div class="modal-footer">
                    <a href="eliminar.jsp" class="btn btn-danger">Eliminar cuentas</a>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
