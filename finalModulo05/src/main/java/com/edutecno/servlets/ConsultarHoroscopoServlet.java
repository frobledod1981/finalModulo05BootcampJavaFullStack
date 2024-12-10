package com.edutecno.servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.edutecno.modelo.Usuario;
import com.frobledo.service.HoroscopoService;



@WebServlet("/horoscopoServlet")
public class ConsultarHoroscopoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HoroscopoService horoscopoService;
       
  
    public ConsultarHoroscopoServlet() {
        super();
        horoscopoService = new HoroscopoService();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		System.out.println("en do get");
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		String nombre = request.getParameter("nombre");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String fechaNacimientoStr = request.getParameter("fechaNacimiento");
		String password = request.getParameter("password");
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		try { 
			Date fechaNacimiento = dateFormat.parse(fechaNacimientoStr);
			Usuario usuario = new Usuario();
			usuario.setNombre(nombre);
			usuario.setUsername(username);
			usuario.setEmail(email);
			usuario.setFechaNacimiento(fechaNacimiento);
			usuario.setPassword(password);
			usuario = horoscopoService.consultarHoroscopoChino(usuario);
			
			request.setAttribute("usuario", usuario);
			request.getRequestDispatcher("resultado.jsp").forward(request, response);
			} catch (ParseException e) { 
				e.printStackTrace();
			}
	
	}

}
