package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import antlr.Parser;
import datatypes.DtLista;
import datatypes.DtVideo;
import interfaces.Fabrica;
import interfaces.IControlador;

/**
 * Servlet implementation class ConsultaLista
 */
@WebServlet("/ConsultaLista")
public class ConsultaLista extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConsultaLista() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Fabrica fabrica = Fabrica.getInstancia();
		IControlador icon = fabrica.getIControlador();
		int id = Integer.parseInt(request.getParameter("IDLISTA"));
		DtLista datosLista = icon.findLista(id);
		if (datosLista != null) {
			request.setAttribute("datosLista", datosLista);
			ArrayList<DtVideo> videos = icon.videosEnListaPublica(datosLista);
			if (videos != null) request.setAttribute("videos", videos);
			request.setAttribute("error", false);
		}
		else {
			request.setAttribute("error", true);
		}
		RequestDispatcher view = request.getRequestDispatcher("consultaLista.jsp");
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
