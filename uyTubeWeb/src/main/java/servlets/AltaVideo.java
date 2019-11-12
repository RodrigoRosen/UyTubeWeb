package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.rpc.ServiceException;

import WS.WebServices;
import WS.WebServicesService;
import WS.WebServicesServiceLocator;

@WebServlet("/AltaVideo")
public class AltaVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AltaVideo() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("nickname");
		if (username != null) {
			WebServicesService wsLocator = new WebServicesServiceLocator();
			WebServices ws = null;
			try {
				ws = wsLocator.getWebServicesPort();
			} catch (ServiceException e) {
				e.printStackTrace();
			}	
			String[] categorias = ws.listarCategorias();
			if (categorias.length > 0) request.setAttribute("categorias", categorias);
			RequestDispatcher rd;
			request.setAttribute("loaded", true);
			rd = request.getRequestDispatcher("/altaVideo.jsp");
			rd.forward(request, response);
		}
		else {
			response.sendError(403);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		WebServicesService wsLocator = new WebServicesServiceLocator();
		WebServices ws = null;
		try {
			ws = wsLocator.getWebServicesPort();
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		
		String categoria = (String) request.getParameter("categoria");
		String nombre = request.getParameter("nombre");
		String duracion = request.getParameter("duracion");
		Integer dur = Integer.parseInt(duracion);
		String url = request.getParameter("url");
		String descripcion = request.getParameter("descripcion");
		Date fecha = new Date();

		//Seleccion de Usuario y Categoria
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("nickname");
		ws.seleccionarUsuario(user);
		if (categoria != null) {
			ws.seleccionarCategoria(categoria);
		}
		
		//Se ingresa el video
		String resp = "altaVideo.jsp";
		//HAY QUE CAMBIAR A CALENDAR
		if (ws.ingresarVideo(nombre, dur, url, descripcion, fecha)) {
			ws.finCasoUso();
			request.setAttribute("mensaje", "El video se subio correctamente");
		}
		else {
			request.setAttribute("mensaje", "Existe un video con el nombre ingresado.");
			request.setAttribute("error", "No se pudo ingresar el video.");
			doGet(request, response);
		}
		
		response.sendRedirect(request.getContextPath() + "/");
	}

}
