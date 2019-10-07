package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datatypes.DtLista;
import interfaces.Fabrica;
import interfaces.IControlador;

/**
 * Servlet implementation class consultaCategoria
 */
@WebServlet("/ConsultaCategoria")
public class ConsultaCategoria extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConsultaCategoria() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getInstancia();
		IControlador icon = fabrica.getIControlador();
		String categoria = request.getParameter("categoriaSeleccionada");
		if (categoria != null) {
			Map<String, String> videos = icon.videosXCat(categoria);
			Map<String, String> listas = icon.listasXCat(categoria);
			request.setAttribute("videos", videos);
			request.setAttribute("listas", listas);	
		}
		RequestDispatcher view = request.getRequestDispatcher("consultaCategoria.jsp");
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
