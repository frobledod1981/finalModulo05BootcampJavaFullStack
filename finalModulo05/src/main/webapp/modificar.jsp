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
                    <th>Actualizar</th>
                </tr>
            </thead>
            <tbody id="usuariosTableBody">
                <% 
                HttpSession miSesion = request.getSession(false);
                List<Usuario> usuarios = (List<Usuario>) session.getAttribute("usuarios");
                for (Usuario usuario : usuarios) { %>
                <tr id="usuarioRow<%= usuario.getId() %>">
                    <td><%= usuario.getId() %></td>
                    <td class="nombre"><%= usuario.getNombre() %></td>
                    <td class="username"><%= usuario.getUsername() %></td>
                    <td class="email"><%= usuario.getEmail() %></td>
                    <td class="fechaNacimiento"><%= usuario.getFechaNacimiento() %></td>
                    <td class="animal"><%= usuario.getAnimal() %></td>
                    <td>
                        <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#actualizarModal<%= usuario.getId() %>">
                            Actualizar
                        </button>

                        <!-- Modal de Actualización -->
                        <div class="modal fade" id="actualizarModal<%= usuario.getId() %>" tabindex="-1" aria-labelledby="actualizarModalLabel<%= usuario.getId() %>" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="actualizarModalLabel<%= usuario.getId() %>">Actualizar Usuario</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="actualizarForm<%= usuario.getId() %>" onsubmit="actualizarUsuario(<%= usuario.getId() %>); return false;">
                                            <input type="hidden" name="id" value="<%= usuario.getId() %>">
                                            <div class="mb-3">
                                                <label for="nombre<%= usuario.getId() %>" class="form-label">Nombre:</label>
                                                <input type="text" class="form-control" id="nombre<%= usuario.getId() %>" name="nombre" required value="<%= usuario.getNombre() %>">
                                            </div>
                                            <div class="mb-3">
                                                <label for="email<%= usuario.getId() %>" class="form-label">Correo electrónico:</label>
                                                <input type="email" class="form-control" id="email<%= usuario.getId() %>" name="email" required value="<%= usuario.getEmail() %>">
                                            </div>
                                            <div class="mb-3">
                                                <label for="username<%= usuario.getId() %>" class="form-label">Nombre de usuario:</label>
                                                <input type="text" class="form-control" id="username<%= usuario.getId() %>" name="username" required value="<%= usuario.getUsername() %>">
                                            </div>
                                            <div class="mb-3">
                                                <label for="fecha_nacimiento<%= usuario.getId() %>" class="form-label">Fecha de Nacimiento:</label>
                                                <input type="date" class="form-control" id="fecha_nacimiento<%= usuario.getId() %>" name="fecha_nacimiento" required value="<%= usuario.getFechaNacimiento() %>">
                                            </div>
                                            <div class="mb-3">
                                                <label for="password<%= usuario.getId() %>" class="form-label">Contraseña:</label>
                                                <input type="password" class="form-control" id="password<%= usuario.getId() %>" name="password" required value="<%= usuario.getPassword() %>">
                                            </div>
                                            <div class="mb-3">
                                                <label for="password2<%= usuario.getId() %>" class="form-label">Repite contraseña:</label>
                                                <input type="password" class="form-control" id="password2<%= usuario.getId() %>" name="password2" required value="<%= usuario.getPassword() %>">
                                            </div>
                                            <button type="submit" class="btn btn-info text-white w-100">Actualizar</button>
                                        </form>
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
        function actualizarUsuario(id) {
            var formData = $("#actualizarForm" + id).serialize();

            $.ajax({
                url: 'actualizarUsuarioServlet',
                type: 'POST',
                data: formData,
                success: function(response) {
                    $("#usuarioRow" + id + " td:nth-child(2)").text(response.nombre);
                    $("#usuarioRow" + id + " td:nth-child(3)").text(response.username);
                    $("#usuarioRow" + id + " td:nth-child(4)").text(response.email);
                    $("#usuarioRow" + id + " td:nth-child(5)").text(response.fechaNacimiento);
                    $("#usuarioRow" + id + " td:nth-child(6)").text(response.animal);
                    alert('Usuario actualizado con éxito dirijase al main y buscar usuarios!');
                },
                error: function(err) {
                    alert('Error al actualizar el usuario contraseñas no coinciden.');
                	//alert('Usuario actualizado Ver cambios en Buscar Usuarios en Main.');
                }
            });
        }
    </script>
</body>
</html>
