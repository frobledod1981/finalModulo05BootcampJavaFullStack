package com.edutecno.procesaconexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConexionDB {

	
	protected static Connection conn;
	protected PreparedStatement pstm = null;
	protected ResultSet rs = null;

	// EJEMPLO DE CONEXION SIN SINGLETON
	protected Connection generaConexion() {
		String usr = "root";
		String pwd = "inacap2021";
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/finalmodulo05";
		if (conn == null) {
			try {
				Class.forName(driver);
				conn = DriverManager.getConnection(url, usr, pwd);
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println("Se entrega nueva conexion");
		} else {
			System.out.println("Se entrega conexion existente");
		}
		return conn;
	}
    
    
}


