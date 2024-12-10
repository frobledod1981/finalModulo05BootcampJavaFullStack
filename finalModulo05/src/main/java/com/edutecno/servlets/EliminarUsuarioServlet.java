package com.edutecno.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.frobledo.service.UsuarioService;


@WebServlet("/eliminarUsuarioServlet")
public class EliminarUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UsuarioService usuarioService;
       
  
    public EliminarUsuarioServlet() {
        super();
        usuarioService = new UsuarioService();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		usuarioService.eliminarUsuario(id);
		//response.sendRedirect("main.jsp");
		//request.setAttribute("deleteMessage", "Usuario Eliminado de Forma Exitosa!");
		response.getWriter().write("Usuario eliminado con éxito!");
		//request.getRequestDispatcher("eliminar.jsp").forward(request, response);
	}
		
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
