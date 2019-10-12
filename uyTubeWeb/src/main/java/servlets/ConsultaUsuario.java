package servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

import datatypes.DtCanal;
import datatypes.DtUsuario;
import datatypes.DtVideo;
import datatypes.DtLista;
import interfaces.Fabrica;
import interfaces.IControlador;
import logica.Video;

@WebServlet("/ConsultaUsuario")
public class ConsultaUsuario  extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ConsultaUsuario() {
        super();
    }
    DtUsuario Usuario = null;
	DtCanal Canal = null;
   
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Utilizo fabrica y controlador relativos al proyecto anterior (.jar)
		Fabrica fabrica = Fabrica.getInstancia();
		IControlador icon = fabrica.getIControlador();
		
		//traigo todos los usuarios
		ArrayList<String> usuarios = icon.listarUsuarios();
		if (!usuarios.isEmpty()) request.setAttribute("usuarios", usuarios);
		
		//traigo la sesion para traer el usuario, para comparar si el seleccionado, es el consultado
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("logNick");
		
		//uso la funciÃ³n del controlador que devuelve el mapa de datos del uruario seleccionado
		 Map<DtUsuario, DtCanal> datos = icon.listarDatosUsuario(user);
		 Iterator<Entry<DtUsuario, DtCanal>> it = datos.entrySet().iterator();
			while (it.hasNext()) {
				Entry<DtUsuario, DtCanal> entry = it.next();
				Usuario = entry.getKey();
				Canal = entry.getValue();
			}
			if (!datos.isEmpty()) request.setAttribute("usuario", datos);
			
			
			Map<String, DtUsuario> seguidor = Usuario.getSeguidores();			
			ArrayList<String> seguidores = new ArrayList();
			for (DtUsuario Usr : seguidor.values()) {
				seguidores.add(Usr.getNickname());
			}	
			
			Map<String, DtUsuario> seguid = Usuario.getSeguidos();
			ArrayList<String> seguidos = new ArrayList();
			for (DtUsuario Usr : seguid.values()) {
				seguidos.add(Usr.getNickname());
			}
			
			int num_seguidores=seguidores.size(), num_seguidos=seguidos.size();
			
			Map<Integer, DtVideo> Video = Canal.getListaVideos();
			ArrayList<String> Videos = new ArrayList();
			for (DtVideo vdo : Video.values()) {
				Videos.add(vdo.getNombre());
			}
			
			Map<Integer, DtLista> Lista = Canal.getListasReproduccion();
			ArrayList<String> Listas = new ArrayList();
			for (DtLista lst : Lista.values()) {
				Videos.add(lst.getNombre());
			}
			
			
			RequestDispatcher view = request.getRequestDispatcher("ConsultaUsuario.jsp");
			view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getInstancia();
		IControlador icon = fabrica.getIControlador();
		
		//en caso de que sea el logeado el que estÃ¡ consultando, se necesita poder modificar los datos del usuario
		//No puede cambiar nickname ni correo
    String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		SimpleDateFormat formatter = new SimpleDateFormat("dd/mm/yyyy");
		String fecha = request.getParameter("fechaNacimiento");
		Date fechaNac = new Date();
		try {
			fechaNac = formatter.parse(fecha);
		} catch (java.text.ParseException e) {
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
		DtCanal canal = new DtCanal(nombreCanal, descripcion, Usuario.getNickname(), privado);
		DtUsuario usuario = new DtUsuario(Usuario.getNickname());
		
		RequestDispatcher rd;
		String resp = "index.jsp";
		try{
			icon.modificarUsuarioCanal(usuario, canal);
			request.setAttribute("mensaje", "El usuario " + Usuario.getNickname() + " ha sido modificado correctamente");
		} catch (ParseException e) {
			request.setAttribute("mensaje", "El usuario " + Usuario.getNickname() + " no se ha podido modificar. Intentelo nuevamente");
			resp = "ConsultaUsuario.jsp";
		}

		rd = request.getRequestDispatcher(resp);
		rd.forward(request, response);
			
	}
	
}
