<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.edutecno.modelo.*"%>
<%
HttpSession sesion = request.getSession(false);
Usuario usuario = (Usuario)sesion.getAttribute("usuario");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Actualizar Usuario</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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

    <!-- Formulario de Actualización -->
    <div class="container mt-5">
     <% if (request.getAttribute("errorMessage") != null) { %> 
                             <div class="alert alert-danger mt-3 fs-4 text-center" id="error-message">
                                 
                                   <%= request.getAttribute("errorMessage") %> 
                                  
                             </div> 
        <% } %>    
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-info text-white">
                        <h4 class="mb-0">Actualizar Usuario</h4>
                        <small>Modifica los datos de tu cuenta.</small>
                    </div>
                    <div class="card-body">
                        <form action="actualizarUsuarioServlet" method="POST">
                        <input type="hidden" name="id" value="<%=usuario.getId()%>">
                            <div class="mb-3">
                                <label for="nombre" class="form-label">Nombre:</label>
                                <input type="text" class="form-control" id="nombre" name="nombre" required value="<%=usuario.getNombre()%>">
                            </div>
                            <div class="mb-3">
                                <label for="correo" class="form-label">Correo electrónico:</label>
                                <input type="email" class="form-control" id="email" name="email" required value="<%=usuario.getEmail()%>">
                            </div>
                            <div class="mb-3">
                                <label for="usuario" class="form-label">Nombre de usuario:</label>
                                <input type="text" class="form-control" id="username" name="username" required value="<%=usuario.getUsername()%>">
                            </div>
                            <div class="mb-3">
                                <label for="fecha" class="form-label">Fecha de Nacimiento:</label>
                                <input type="date" class="form-control" id="fecha" name="fecha_nacimiento" required value="<%=usuario.getFechaNacimiento()%>">
                            </div>
                            <div class="mb-3">
                                <label for="contrasena" class="form-label">Contraseña:</label>
                                <input type="password" class="form-control" id="contrasena" name="password" required value="<%=usuario.getPassword()%>">
                            </div>
                            <div class="mb-3">
                                <label for="repiteContrasena" class="form-label">Repite contraseña:</label>
                                <input type="password" class="form-control" id="repiteContrasena" name="password2" required value="<%=usuario.getPassword()%>">
                            </div>
                            <button type="submit" class="btn btn-info text-white w-100">Actualizar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
   

  <script>setTimeout(function() { 
    	var errorMessageDiv = document.getElementById("error-message");
    	if (errorMessageDiv) {
    		errorMessageDiv.style.transition = "opacity 1s";
    		errorMessageDiv.style.opacity = 0; 
    		setTimeout(function() { 
    			errorMessageDiv.style.display = "none";
    			}, 4000); 
    		} 
    	}, 2000);
    
  </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
