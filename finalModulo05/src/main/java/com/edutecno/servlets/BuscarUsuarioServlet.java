package com.edutecno.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.edutecno.modelo.Usuario;
import com.frobledo.service.UsuarioService;

import javax.servlet.http.HttpSession;


@WebServlet("/buscarUsuarioServlet")
public class BuscarUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BuscarUsuarioServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession(false);
		if (session != null) {
			List<Usuario> usuarios = new ArrayList<>();
			UsuarioService usuarioService = new UsuarioService();
			usuarios = usuarioService.obtenerUsuarios();
			
			session.setAttribute("usuarios", usuarios);
			request.getRequestDispatcher("usuarios.jsp").forward(request, response);
			usuarios.stream().forEach(System.out::println);
		
		}else {
			response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Credenciales inválidas");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
