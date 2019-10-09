package servlets;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datatypes.DtCanal;
import datatypes.DtUsuario;
import interfaces.Fabrica;
import interfaces.IControlador;

@WebServlet("/ConsultaUsuario")
public class Usuario  extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ConsultaUsuario() {
        super();
    }

   
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Utilizo fabrica y controlador relativos al proyecto anterior (.jar)
		Fabrica fabrica = Fabrica.getInstancia();
		IControlador icon = fabrica.getIControlador();
		
    //traigo todos los usuarios
    //Map<String, String> usuarios = icon.
    
		//traigo la sesion para traer el usuario, para comparar si el seleccionado, es el consultado
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("logNick");
		
		//uso la función del controlador que devuelve el mapa de datos del uruario seleccionado
		 Map<DtUsuario, DtCanal> datos = icon.listarDatosUsuario(user);
		 Iterator<Entry<DtUsuario, DtCanal>> it = datos.entrySet().iterator();
			DtUsuario usuario = null;
			DtCanal canal = null;
			while (it.hasNext()) {
				Entry<DtUsuario, DtCanal> entry = it.next();
				usuario = entry.getKey();
				canal = entry.getValue();
			}
			if (!datos.isEmpty()) request.setAttribute("usuario", datos);
			
      // De dónde saco si es private??
      // recordar que tiene que mostrar seguidos y seguidores (nombre y cantidad)
      // tiene que poder modificar los datos si la consulta es sobre el usuario logeado
      // tiene que poder acceder a listas y a videos del usuario
      // consulta de video y consulta lista de reproducción
      
      //Map<String, String> videos = icon.;
			
			RequestDispatcher view = request.getRequestDispatcher("Usuario.jsp");
			view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getInstancia();
		IControlador icon = fabrica.getIControlador();
		
		//en caso de que sea el logeado el que está consultando, se necesita poder modificar los datos del usuario
		//No puede cambiar nickname ni correo
    String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		SimpleDateFormat formatter = new SimpleDateFormat("dd/mm/yyyy");
		String fecha = request.getParameter("fechaNacimiento");
		Date fechaNac = new Date();
		try {
			fechaNac = formatter.parse(fecha);
		} catch (ParseException e) {
			System.out.println(e);
        }
		
		String img = request.getParameter("img");
		String nombreCanal = request.getParameter("nombreCanal");
		String descripcion = request.getParameter("descripcion");
		String password = request.getParameter("contrasena");
		Boolean privado = false;
		System.out.println(request.getParameter("privado"));
		if(request.getParameter("privado") == "Si")
			privado = true;
		DtCanal canal = new DtCanal(nombreCanal, descripcion, nickname, privado);
		//Boolean ok = icon.modificarUsuario(nickname, email, password, nombre, apellido, fechaNac, img, canal);
    //revisar si asi se llama la función
    
		RequestDispatcher rd;
		String resp = "index.jsp";
		if(ok){
			request.setAttribute("mensaje", "El usuario " + nickname + " ha sido modificado correctamente");
		}else {
			request.setAttribute("mensaje", "El usuario " + nickname + " o el email " + email + " ya existe!. Intentelo nuevamente");
			resp = "altaUsuario.jsp";
		}

		rd = request.getRequestDispatcher(resp);
		rd.forward(request, response);
			
	}
	
}
