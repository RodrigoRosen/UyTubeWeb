package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.hibernate.Session;

import datatypes.DtUsuario;
import datatypes.DtVideo;
import interfaces.Fabrica;
import interfaces.IControlador;

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
		Fabrica fabrica = Fabrica.getInstancia();
		IControlador icon = fabrica.getIControlador();
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("nickname");
		icon.seleccionarUsuario(user);/*Aca se debe usar el usuario logeado*/
		ArrayList<String> videos = icon.listarVideos();
		if (!videos.isEmpty()) request.setAttribute("videos", videos);
		RequestDispatcher view = request.getRequestDispatcher("modificarDatosVideo.jsp");
		view.forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getInstancia();
		IControlador icon = fabrica.getIControlador();
		
		ArrayList<String> listCategory = icon.listarCategorias();
		request.setAttribute("listCategory", listCategory);
		
		String category = request.getParameter("categoria");
		String nombre = request.getParameter("nombre");
		String nomViejo = request.getParameter("nombreViejo");
		String duracion = request.getParameter("duracion");
		Integer dur = Integer.parseInt(duracion);
		String url = request.getParameter("url");
		String descripcion = request.getParameter("descripcion");
		Date fecha = new Date();
		Boolean esprivado = false;
		if(request.getParameter("esprivado").equals("si"))
			esprivado = true;
		//request.getParameter("fechaVideo");
		
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("nickname");
		System.out.println("Llega hasta acaa");
		System.out.println(user);

		//Seleccion de Usuario y Categoria
		icon.seleccionarUsuario(user);
		icon.seleccionarCategoria(category);
		if (category != null) {
			icon.seleccionarCategoria(category);
		}
		DtVideo videoNew = icon.seleccionarVideo(nomViejo);
		RequestDispatcher rd;
		if(videoNew != null) {
			System.out.println(videoNew.getNombre());
			System.out.println(category);
			videoNew.setNombre(nombre);
			videoNew.setDuracion(dur);
			videoNew.setUrl(url);
			videoNew.setDescripcion(descripcion);
			videoNew.setFechaPub(fecha);
			videoNew.setCategoria(category);
			videoNew.setPrivado(esprivado);
			//Se ingresa el video
			icon.editarVideo(videoNew);
			request.setAttribute("mensaje", "Se ha modificado correctamente el video " + nombre);
		}else {
			request.setAttribute("mensaje", "Error al modificar el video " + nombre);

		}
		icon.finCasoUso();
		rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
	}

}
