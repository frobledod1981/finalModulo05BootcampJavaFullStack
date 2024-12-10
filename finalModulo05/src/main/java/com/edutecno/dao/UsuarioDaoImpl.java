package com.edutecno.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.text.SimpleDateFormat;
import java.sql.Date;

import com.edutecno.modelo.Usuario;
import com.edutecno.procesaconexion.ConexionDB;

public class UsuarioDaoImpl extends ConexionDB{
	
	private Connection conn;
	private List<Usuario> usuarios = new ArrayList<>();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	
	public UsuarioDaoImpl() {
		conn = generaConexion();
	}
	
	
	public List<Usuario> getAll() {
		List<Usuario> usuarios = new ArrayList<>();
		try (Statement stmt = conn.createStatement()) {
			String sql = "SELECT * FROM usuarios";
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Usuario u = new Usuario();
				u.setId(rs.getInt("id"));
				u.setNombre(rs.getString("nombre"));
				u.setUsername(rs.getString("username"));
				u.setEmail(rs.getString("email"));
				u.setFechaNacimiento(rs.getDate("fecha_nacimiento"));
				u.setPassword(rs.getString("password"));
				u.setAnimal(rs.getString("animal"));
				usuarios.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		usuarios.sort(Comparator.comparing(Usuario::getId));
		return usuarios;
	}
	
	public Usuario validarUsuario(String username,String password) {
		Usuario u = null;
		try (Statement stmt = conn.createStatement()) {
			String sql = "SELECT * FROM usuarios WHERE username = '" + username + "' AND password = '" + password + "'";
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()) { 
				u = new Usuario();
				u.setId(rs.getInt("id"));
				u.setNombre(rs.getString("nombre"));
				u.setUsername(rs.getString("username"));
				u.setEmail(rs.getString("email"));
				u.setFechaNacimiento(rs.getDate("fecha_nacimiento"));
				u.setPassword(rs.getString("password"));
				u.setAnimal(rs.getString("animal")); 
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}
	

	
	public void save(Usuario u) {
		String sql = "INSERT INTO usuarios (nombre, username, email, fecha_nacimiento, password,animal) values(?,?,?,?,?,?)";

		try (PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setString(1, u.getNombre());
			stmt.setString(2, u.getUsername());
			stmt.setString(3, u.getEmail());
			
			Date sqlDate = new Date(u.getFechaNacimiento().getTime());
			stmt.setDate(4, sqlDate);
			
			stmt.setString(5, u.getPassword());
			stmt.setString(6, u.getAnimal());
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	


	public void update(Usuario usuario) {
		String sql = "UPDATE usuarios SET nombre = ?, username = ?, email = ?, fecha_nacimiento = ? ,password = ? ,animal = ? WHERE id = ?";
		
		try (PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setString(1, usuario.getNombre());
			stmt.setString(2, usuario.getUsername());
			stmt.setString(3, usuario.getEmail());
			
			//String fechaFormateada = dateFormat.format(usuario.getFechaNacimiento());
			//stmt.setString(4, fechaFormateada);
			stmt.setDate(4, new Date(usuario.getFechaNacimiento().getTime()));
			
			stmt.setString(5, usuario.getPassword());
			stmt.setString(6, usuario.getAnimal());
			stmt.setInt(7, usuario.getId());
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delete(int id) {
		String sql = "DELETE FROM usuarios WHERE id = ?";

		try (PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setInt(1, id);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	public Usuario getById(int id) {
		Usuario u = new Usuario();
		String sql = "SELECT * FROM usuarios WHERE id = ?";
		try (PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				u.setId(rs.getInt("id"));
				u.setNombre(rs.getString("nombre"));
				u.setUsername(rs.getString("username"));
				u.setEmail(rs.getString("email"));
				u.setFechaNacimiento(rs.getDate("fecha_nacimiento"));
				u.setPassword(rs.getString("password"));
				u.setAnimal(rs.getString("animal")); 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}
	
	

	
	


}
