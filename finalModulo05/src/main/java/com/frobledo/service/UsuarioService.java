package com.frobledo.service;

import java.util.List;

import com.edutecno.dao.UsuarioDaoImpl;
import com.edutecno.modelo.Usuario;

public class UsuarioService {
	
	UsuarioDaoImpl usuarioDao;
	
	public UsuarioService() {
		usuarioDao = new UsuarioDaoImpl();
	}
	
	public Usuario login(String username, String password) {
		return usuarioDao.validarUsuario(username, password); 
	}
	
	public List<Usuario> obtenerUsuarios(){
		return usuarioDao.getAll();
	}
	
	public Usuario obtenerPorId(int id) {
		return usuarioDao.getById(id);
	}
	
	public void actualizarUsuario(Usuario usuario) {
		usuarioDao.update(usuario);
	}
	
	public void guardarUsuario(Usuario usuario) {
		usuarioDao.save(usuario);
	}
	
	public void eliminarUsuario(int id) {
		usuarioDao.delete(id);
	}

}
