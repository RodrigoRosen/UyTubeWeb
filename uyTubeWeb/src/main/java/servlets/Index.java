package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import interfaces.Fabrica;
import interfaces.IControlador;

/**
 * Servlet implementation class Index
 */
@WebServlet("/Index")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Index() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				HttpSession session = request.getSession();
				Fabrica fabrica = Fabrica.getInstancia();
				IControlador icon = fabrica.getIControlador();
				ArrayList<String> categorias = icon.listarCategorias();
				Map<String, String> canales = icon.listarCanalesPublicos();
				HashMap<Integer, String> videos = icon.listarVideosPublicos();
				HashMap<Integer, String> listas = icon.listarListasPublicas();
				if (videos != null && !videos.isEmpty()) session.setAttribute("videosPublicos", videos);
				if (listas != null && !listas.isEmpty()) session.setAttribute("listasPublicas", listas);
				if (categorias != null && !categorias.isEmpty()) session.setAttribute("categorias", categorias);
				RequestDispatcher view = request.getRequestDispatcher("index.jsp");		
				view.forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}