import java.io.FileInputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.edutecno.dao.HoroscopoDaoImpl;
import com.edutecno.dao.UsuarioDaoImpl;
import com.edutecno.modelo.Horoscopo;
import com.edutecno.modelo.Usuario;
import com.frobledo.service.HoroscopoService;


public class Main {

	public static void main(String[] args) {

		String path = "C:/Users/fernando/eclipse-workspace/finalModulo05/";
		String file = "horoscopo.xlsx";
		
		
//		HoroscopoService service = new HoroscopoService();
//		List<Horoscopo> horoscopos = service.mostarHoroscopos();
//		horoscopos.forEach(System.out::println);
		
//		List<Usuario> usuarios = new ArrayList<>();
//		UsuarioDaoImpl dao = new UsuarioDaoImpl();
//		usuarios = dao.getAll();
//		
//		for(Usuario u : usuarios) {
//			System.out.println(u.toString());
//		}
		
//		HoroscopoService service = new HoroscopoService();
//		List<Horoscopo> horoscopos = service.obtenerHoroscopo(1981);
//		horoscopos.forEach(System.out::println);
		
		HoroscopoDaoImpl horoscopoDao = new HoroscopoDaoImpl();
		HoroscopoService horoscopoService = new HoroscopoService(horoscopoDao);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		
		try {
			
			Usuario usuario = new Usuario();
			usuario.setFechaNacimiento(dateFormat.parse("1981-02-09"));
			
			usuario = horoscopoService.consultarHoroscopoChino(usuario);
			//horoscopoService.consultarHoroscopoChino(usuario);
			System.out.println("El animal del horóscopo chino es: " + usuario.getAnimal());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
}


