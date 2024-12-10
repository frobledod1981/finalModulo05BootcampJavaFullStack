<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
   
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
   rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-info">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Horóscopo Chino</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="registro.jsp">Registrarse</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Login Form -->
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="text-center">Inicia sesión</h2>
                <p class="text-center">Es necesario que inicies sesión para revisar tu horóscopo chino. Si todavía no tienes cuenta, haz <a href="registro.jsp">click aquí</a>.</p>
                <form action="loginServlet" method="POST">
                    <div class="mb-3">
                        <label for="username" class="form-label">Nombre de usuario:</label>
                        <input type="text" class="form-control" id="username" name="username" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Contraseña:</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <button type="submit" class="btn btn-info w-100">Ingresar</button>
                </form>
                <div class="text-danger mt-3"> 
                
                 <div class="text-danger fs-3 mt-3 text-center" id="error-message">
                 
                  <% 
                  String errorMessage = (String) request.getAttribute("errorMessage");
                  
                  if (errorMessage != null) {
                	  out.println(errorMessage); 
                	  request.removeAttribute("errorMessage"); 
                  } 
                    
                 %> 
                
                </div>
                
                 
            </div>
        </div>
    </div>
    

    
    <script>
    
    
     <script>setTimeout(function() { 
    	var errorMessageDiv = document.getElementById("error-message");
    	if (errorMessageDiv) {
    		errorMessageDiv.style.transition = "opacity 1s";
    		errorMessageDiv.style.opacity = 0; 
    		setTimeout(function() { 
    			errorMessageDiv.style.display = "none";
    			}, 1000); 
    		} 
    	}, 2000);
    
    </script>
   


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
     integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
    </script>
    
   
</body>
</html>
