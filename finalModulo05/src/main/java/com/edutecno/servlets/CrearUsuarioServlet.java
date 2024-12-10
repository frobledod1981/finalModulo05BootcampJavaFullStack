package com.edutecno.servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.edutecno.modelo.Usuario;
import com.frobledo.service.HoroscopoService;
import com.frobledo.service.UsuarioService;


@WebServlet("/crearUsuarioServlet")
public class CrearUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	UsuarioService usuarioService;
	HoroscopoService horoscopoService;
 
    public CrearUsuarioServlet() {
        super();
        usuarioService = new UsuarioService();
        horoscopoService = new HoroscopoService();
    }
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		String nombre = request.getParameter("nombre");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String fechaNacimientoStr = request.getParameter("fecha_nacimiento");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		
		request.setAttribute("nombre", nombre);
		request.setAttribute("email", email);
		request.setAttribute("username", username);
		request.setAttribute("fecha_nacimiento", fechaNacimientoStr);
		
		if (!password.equals(password2)) { 
			  request.setAttribute("errorMessage", "Las contraseñas no coinciden.");
			  request.getRequestDispatcher("registro.jsp").forward(request, response);
			  return;
	    }
		
		
		try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaNacimiento = sdf.parse(fechaNacimientoStr);
            
            Usuario usuario = new Usuario();
            usuario.setNombre(nombre);
			usuario.setUsername(username);
			usuario.setEmail(email);
			usuario.setFechaNacimiento(fechaNacimiento);
			usuario.setPassword(password);
			usuario = horoscopoService.consultarHoroscopoChino(usuario);
			usuarioService.guardarUsuario(usuario);
			
			request.setAttribute("successMessage", "Usuario Creado Loguese con su Usuario y Password!");
            

            request.getRequestDispatcher("registro.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
		
		
	}

}
