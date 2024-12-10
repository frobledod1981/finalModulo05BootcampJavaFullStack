<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Usuario</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
   rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
         <div class="text-success fs-3 mt-3 text-center" id="success-message">
                 
                  <% 
                  String SuccessMessage = (String) request.getAttribute("successMessage");

                  if (SuccessMessage != null) {
                  	  out.println(SuccessMessage); 
                  	  request.removeAttribute("successMessage"); 
                  } 
                    
                 %> 
                
        </div>
             
    <!-- Formulario de Registro -->
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
                        <h4 class="mb-0">Horóscopo Chino</h4>
                        <small>Tu Horóscopo Chino</small>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Regístrate</h5>
                        <form action="crearUsuarioServlet" method="POST">
                        
                            <div class="mb-3">
                                <label for="nombre" class="form-label">Nombre:</label>
                                <input type="text" class="form-control" id="nombre" name="nombre" required value="<%= request.getAttribute("nombre") != null ? request.getAttribute("nombre") : "" %>">
                            </div>
                            <div class="mb-3">
                                <label for="correo" class="form-label">Correo electrónico:</label>
                                <input type="email" class="form-control" id="correo" name="email" required value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>">
                            </div>
                            <div class="mb-3">
                                <label for="usuario" class="form-label">Nombre de usuario:</label>
                                <input type="text" class="form-control" id="usuario" name="username" required value="<%= request.getAttribute("username") != null ? request.getAttribute("username") : "" %>">
                            </div>
                            <div class="mb-3">
                                <label for="fecha" class="form-label">Fecha de Nacimiento:</label>
                                <input type="date" class="form-control" id="fecha" name="fecha_nacimiento" required value="<%= request.getAttribute("fecha_nacimiento") != null ? request.getAttribute("fecha_nacimiento") : "" %>">
                            </div>
                            <div class="mb-3">
                                <label for="contrasena" class="form-label">Contraseña:</label>
                                <input type="password" class="form-control" id="contrasena" name="password" required>
                            </div>
                            <div class="mb-3">
                                <label for="repiteContrasena" class="form-label">Repite contraseña:</label>
                                <input type="password" class="form-control" id="password2" name="password2" required>
                            </div>
                            <button type="submit" class="btn btn-info text-white w-100">Registrarse</button>
                        </form>
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
  </div>


 <script>setTimeout(function() { 
    	var successMessageDiv = document.getElementById("success-message");
    	if (successMessageDiv) {
    		successMessageDiv.style.transition = "opacity 1s";
    		successMessageDiv.style.opacity = 0; 
    		setTimeout(function() { 
    			successMessageDiv.style.display = "none";
    			}, 4000); 
    		} 
    	}, 2000);
    
  </script>
  
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
    



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
     integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
</script>
</body>
</html>
