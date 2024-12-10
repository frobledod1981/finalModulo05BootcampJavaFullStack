<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.edutecno.modelo.*"%>
<html>
<head>
    <title>Resultado del Horóscopo Chino</title>
</head>
<body>
<h2>Resultado del Horóscopo Chino</h2>
<% Usuario usuario = (Usuario) request.getAttribute("usuario"); %>
<p>Nombre: <%= usuario.getNombre() %></p>
<p>Usuario: <%= usuario.getUsername() %></p>
<p>Email: <%= usuario.getEmail() %></p>
<p>Fecha de Nacimiento: <%= usuario.getFechaNacimiento() %></p>
<p>Signo del Horóscopo Chino: <%= usuario.getAnimal() %></p>
</body>
</html>
