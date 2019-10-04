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

import interfaces.Fabrica;
import interfaces.IControlador;

@WebServlet("/AltaVideo")
public class AltaVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AltaVideo() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getInstancia();
		IControlador icon = fabrica.getIControlador();
		
		ArrayList<String> listCategory = icon.listarCategorias();
		request.setAttribute("listCategory", listCategory);
		
		String category = request.getParameter("category");
		String nombre = request.getParameter("nombre");
		String duracion = request.getParameter("duracion");
		Integer dur = Integer.parseInt(duracion);
		String url = request.getParameter("url");
		String descripcion = request.getParameter("descripcion");
		Date fecha = new Date();
		//request.getParameter("fechaVideo");

		icon.ingresarVideo(nombre, dur, url, descripcion, fecha);
		RequestDispatcher rd;
		request.setAttribute("mensaje", "Se ha ingresado correctamente el video " + nombre);
		rd = request.getRequestDispatcher("index.jsp");
		doGet(request, response);
	}

}
