package com.edutecno.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.edutecno.modelo.Usuario;
import com.frobledo.service.UsuarioService;

import javax.servlet.http.HttpSession;


@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UsuarioService usuarioServive;
       
  
    public LoginServlet() {
        super();
        usuarioServive = new UsuarioService();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("doGet");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Usuario usuario = usuarioServive.login(username, password);
		
		
		if(usuario != null) {
			HttpSession session = request.getSession(true);
			session.setAttribute("usuario", usuario);
			//session.setAttribute("usuario", usuario);
			request.getRequestDispatcher("main.jsp").forward(request, response);
		}else {
		    request.setAttribute("errorMessage", "Login Incorrecto!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		
	}

}
