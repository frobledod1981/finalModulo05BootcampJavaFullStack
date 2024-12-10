package com.frobledo.service;

import java.util.List;

import com.edutecno.dao.HoroscopoDaoImpl;
import com.edutecno.modelo.Horoscopo;
import com.edutecno.modelo.Usuario;

public class HoroscopoService {
	
	private static HoroscopoDaoImpl horoscopoDao;
	
	public HoroscopoService(HoroscopoDaoImpl horoscopoDAO) {
		horoscopoDao = horoscopoDAO;
	}
	
	public HoroscopoService() {
		super();
		horoscopoDao = new HoroscopoDaoImpl();
		horoscopoDao.loadFromFiles();
	}
	
	public List<Horoscopo> mostarHoroscopos(){
		return horoscopoDao.getAll();
	}
	

//	    public Usuario consultarHoroscopoChino(Usuario usuario) {
//	        List<Horoscopo> listaHoroscopo = horoscopoDao.obtenerHoroscopo();
//	        Horoscopo horoscopo = null;
//
//	        for (Horoscopo temp : listaHoroscopo) {
//	            if (usuario.getFechaNacimiento().after(temp.getFechaInicio())
//	                && usuario.getFechaNacimiento().before(temp.getFechaFin())) {
//	                horoscopo = temp;
//	                break;
//	            } else if (usuario.getFechaNacimiento().equals(temp.getFechaInicio())
//	                       || usuario.getFechaNacimiento().equals(temp.getFechaFin())) {
//	                horoscopo = temp;
//	                break;
//	            }
//	        }
//
//	        if (horoscopo != null) {
//	            usuario.setAnimal(horoscopo.getAnimal());
//	        }
//
//	        return usuario;
//	    }
	
	
	

	    public Usuario consultarHoroscopoChino(Usuario usuario) {
	    	List<Horoscopo> listaHoroscopo = horoscopoDao.obtenerHoroscopo();
	        Horoscopo horoscopo = null;

	        for (Horoscopo temp : listaHoroscopo) {
	            if (usuario.getFechaNacimiento().after(temp.getFechaInicio()) && usuario.getFechaNacimiento().before(temp.getFechaFin())) {
	                horoscopo = temp;
	                break;
	            } else if (usuario.getFechaNacimiento().equals(temp.getFechaInicio()) || usuario.getFechaNacimiento().equals(temp.getFechaFin())) {
	                horoscopo = temp;
	                break;
	            }
	        }

	        if (horoscopo != null) {
	            usuario.setAnimal(horoscopo.getAnimal());
	        }

	        return usuario;
	    }
	

	
	
	
	
	
	}

	
	
	
	
	


