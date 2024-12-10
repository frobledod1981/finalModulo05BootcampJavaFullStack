<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.edutecno.modelo.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Usuarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
    
        <div class="text-danger fs-3 mt-3 text-center" id="delete-message">
                 
                 <%  
                  String deleteMessage = (String) request.getAttribute("deleteMessage");

                  if (deleteMessage != null) { 
                  	  out.println(deleteMessage);  
                   	  request.removeAttribute("successMessage");  
                  }  
                    
               %>
                
    </div>
    
    <div class="container mt-5">
        <h2 class="text-center">Lista de Usuarios</h2>
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Fecha de Nacimiento</th>
                    <th>Animal</th>
                    <th>Eliminar</th>
                </tr>
            </thead>
            <tbody id="usuariosTableBody">
                <% 
                HttpSession miSesion = request.getSession(false);
                List<Usuario> usuarios = (List<Usuario>) session.getAttribute("usuarios");
                for (Usuario usuario : usuarios) { %>
                <tr id="usuarioRow<%= usuario.getId() %>">
                    <td><%= usuario.getId() %></td>
                    <td><%= usuario.getNombre() %></td>
                    <td><%= usuario.getUsername() %></td>
                    <td><%= usuario.getEmail() %></td>
                    <td><%= usuario.getFechaNacimiento() %></td>
                    <td><%= usuario.getAnimal() %></td>
                    <td>
                        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#eliminarModal<%= usuario.getId() %>">
                            Eliminar
                        </button>

                        <!-- Modal de Confirmación -->
                        <div class="modal fade" id="eliminarModal<%= usuario.getId() %>" tabindex="-1" aria-labelledby="eliminarModalLabel<%= usuario.getId() %>" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="eliminarModalLabel<%= usuario.getId() %>">Confirmar Eliminación</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        ¿Estás seguro de que quieres eliminar el registro de <strong><%= usuario.getNombre() %></strong>?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                        <button type="button" class="btn btn-danger" onclick="eliminarUsuario(<%= usuario.getId() %>)" data-bs-dismiss="modal">Eliminar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <script>
        function eliminarUsuario(id) {
            $.ajax({
                url: 'eliminarUsuarioServlet?id=' + id,
                type: 'GET',
                success: function(result) {
                    $('#usuarioRow' + id).remove();
                    alert('Usuario eliminado con éxito!');
                },
                error: function(err) {
                    alert('Error al eliminar el usuario.');
                }
            });
        }
    </script>
</body>
</html>
