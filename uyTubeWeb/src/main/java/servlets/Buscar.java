package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datatypes.DtCanal;
import datatypes.DtLista;
import datatypes.DtVideo;
import interfaces.Fabrica;
import interfaces.IControlador;

/**
 * Servlet implementation class Buscar
 */
@WebServlet("/Buscar")
public class Buscar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Buscar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getInstancia();
		IControlador icon = fabrica.getIControlador();
		String dato = request.getParameter("buscar");
		ArrayList <DtVideo> videos = icon.buscarVideosPublicos(dato);
		if (!videos.isEmpty()) request.setAttribute("videos", videos);
		
		ArrayList <DtCanal> canales = icon.buscarCanalesPublicos(dato);
		if(!canales.isEmpty()) request.setAttribute("canales", canales);
		
		ArrayList <DtLista> listas = icon.buscarListasPublicas(dato);
		if(!listas.isEmpty()) request.setAttribute("listas", listas);
		
		RequestDispatcher view = request.getRequestDispatcher("resultado.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
