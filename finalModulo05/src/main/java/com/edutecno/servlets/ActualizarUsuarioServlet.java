package com.edutecno.servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.edutecno.modelo.Usuario;
import com.frobledo.service.HoroscopoService;
import com.frobledo.service.UsuarioService;

import javax.servlet.http.HttpSession;



@WebServlet("/actualizarUsuarioServlet")
public class ActualizarUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UsuarioService usuarioService;
	HoroscopoService horoscopoService;
       
  
    public ActualizarUsuarioServlet() {
        super();
        usuarioService = new UsuarioService();
        horoscopoService = new HoroscopoService();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int id = Integer.parseInt(request.getParameter("id"));
		Usuario usuario = usuarioService.obtenerPorId(id);
		HttpSession session = request.getSession(false);
		session.setAttribute("usuario", usuario);
		request.getRequestDispatcher("modificarform.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json"); 
		response.setCharacterEncoding("UTF-8");

	
		int id = Integer.parseInt(request.getParameter("id"));
		String nombre = request.getParameter("nombre");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String fechaNacimientoStr = request.getParameter("fecha_nacimiento");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
	
		if (!password.equals(password2)) { 
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			response.getWriter().write("{\"message\":\"Las contraseñas no coinciden.\"}");
			return;
		}
		
		try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaNacimiento = sdf.parse(fechaNacimientoStr);
            
            Usuario usuario = new Usuario();
            usuario.setId(id);
            usuario.setNombre(nombre);
			usuario.setUsername(username);
			usuario.setEmail(email);
			usuario.setFechaNacimiento(fechaNacimiento);
			usuario.setPassword(password);
			
			usuario = horoscopoService.consultarHoroscopoChino(usuario);
			usuarioService.actualizarUsuario(usuario);
			
			String usuarioJson = "{" + 
					"\"id\":" + usuario.getId() + "," + 
					"\"nombre\":\"" + usuario.getNombre() + 
					"\"," + "\"username\":\"" + usuario.getUsername() + "\"," +
					"\"email\":\"" + usuario.getEmail() + "\"," +
					"\"fechaNacimiento\":\"" + usuario.getFechaNacimiento() + "\"," +
					"\"animal\":\"" + usuario.getAnimal() + "\"" + "}"; 
			
					response.setStatus(HttpServletResponse.SC_OK);
					response.getWriter().write(usuarioJson);
		

//  		   List<Usuario> usuarios = usuarioService.obtenerUsuarios();
//		   request.getSession().setAttribute("usuarios", usuarios);

			 response.sendRedirect("modificar.jsp");
		
	
            
			
        } catch (Exception e) {
            e.printStackTrace();
            e.printStackTrace(); response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"message\":\"Ocurrió un error al actualizar el usuario.\"}");
        }
		
	}

}
