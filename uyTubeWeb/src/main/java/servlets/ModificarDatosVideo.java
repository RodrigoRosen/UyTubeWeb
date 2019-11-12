package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

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
import WS.DtUsuario;
import WS.DtVideo;

/**
 * Servlet implementation class ModificarDatosVideo
 */
@WebServlet("/ModificarDatosVideo")
public class ModificarDatosVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarDatosVideo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		WebServicesService wsLocator = new WebServicesServiceLocator();
		WebServices ws = null;
		try {
			ws = wsLocator.getWebServicesPort();
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("nickname");
		ws.seleccionarUsuario(user);/*Aca se debe usar el usuario logeado*/
		String[] videos = ws.listarVideos();
		if (videos != null & videos.length > 0) request.setAttribute("videos", videos);
		RequestDispatcher view = request.getRequestDispatcher("modificarDatosVideo.jsp");
		view.forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		WebServicesService wsLocator = new WebServicesServiceLocator();
		WebServices ws = null;
		try {
			ws = wsLocator.getWebServicesPort();
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String[] listCategory = ws.listarCategorias();
		request.setAttribute("listCategory", listCategory);
		
		String category = request.getParameter("categoria");
		String nombre = request.getParameter("nombre");
		String nomViejo = request.getParameter("nombreViejo");
		String duracion = request.getParameter("duracion");
		Integer dur = Integer.parseInt(duracion);
		String url = request.getParameter("url");
		String descripcion = request.getParameter("descripcion");
		//SE CAMBIA DATE A CALENDAR
		Calendar fecha = Calendar.getInstance();
		Boolean esprivado = false;
		if(request.getParameter("esprivado").equals("si"))
			esprivado = true;
		//request.getParameter("fechaVideo");
		
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("nickname");
		System.out.println("Llega hasta acaa");
		System.out.println(user);

		//Seleccion de Usuario y Categoria
		ws.seleccionarUsuario(user);
		ws.seleccionarCategoria(category);
		if (category != null) {
			ws.seleccionarCategoria(category);
		}
		DtVideo videoNew = ws.seleccionarVideo(nomViejo);
		RequestDispatcher rd;
		if(videoNew != null) {
			System.out.println(videoNew.getNombre());
			System.out.println(category);
			videoNew.setNombre(nombre);
			videoNew.setDuracion(dur);
			videoNew.setUrl(url);
			videoNew.setDescripcion(descripcion);
			//CAMBIAR A CALENDAR?
			videoNew.setFechaPub(fecha);
			videoNew.setCategoria(category);
			videoNew.setPrivado(esprivado);
			//Se ingresa el video
			ws.editarVideo(videoNew);
			request.setAttribute("mensaje", "Se ha modificado correctamente el video " + nombre);
		}else {
			request.setAttribute("mensaje", "Error al modificar el video " + nombre);

		}
		ws.finCasoUso();
		response.sendRedirect(request.getContextPath() + "/" + "ConsultarVideo?id="+videoNew.getId());
	}

}
