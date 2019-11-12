package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.rpc.ServiceException;

import WS.DtCanal;
import WS.WebServices;
import WS.WebServicesService;
import WS.WebServicesServiceLocator;


@WebServlet("/AltaUsuario")
public class AltaUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AltaUsuario() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		WebServicesService wsLocator = new WebServicesServiceLocator();
		WebServices ws = null;
		try {
			ws = wsLocator.getWebServicesPort();
		} catch (ServiceException e) {
			e.printStackTrace();
		}		
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		SimpleDateFormat formatter = new SimpleDateFormat("dd/mm/yyyy");
		String fecha = request.getParameter("fechaNacimiento");
		//CALENDAR DE PRUEBA
		Calendar fechaNac = Calendar.getInstance();
//		try {
//			fechaNac = formatter.parse(fecha);
//		} catch (ParseException e) {
//			System.out.println(e);
//        }
		
		String img = request.getParameter("img");
		String nombreCanal = request.getParameter("canal");
		String descripcion = request.getParameter("descripcion");
		String password = request.getParameter("contrasena");
		Boolean privado = false;
		System.out.println(request.getParameter("privado"));
		if(request.getParameter("privado") == "Si")
			privado = true;
		//Se cambio el constructor, puede que genere error..
		DtCanal canal = new DtCanal(nombreCanal, descripcion, nickname, privado, null, null);
		System.out.println(canal.getNombre());
		System.out.println(canal.getDescripcion());
		System.out.println(canal.getNick());

		Boolean ok = ws.ingresarUsuario(nickname, email, password, nombre, apellido, fechaNac, img, canal);
		RequestDispatcher rd;
		String resp = "index.jsp";
		if(ok) {
			request.setAttribute("mensaje", "El usuario " + nickname + " ha sido ingresado correctamente");
			response.sendRedirect(request.getContextPath() + "/");
		}else {
			request.setAttribute("mensaje", "El usuario " + nickname + " o el email " + email + " ya existe!. Intentelo nuevamente");
			rd = request.getRequestDispatcher(resp);
			rd.forward(request, response);
			resp = "altaUsuario.jsp";
		}

		
	}

}
