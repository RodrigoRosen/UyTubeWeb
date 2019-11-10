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
import javax.xml.rpc.ServiceException;

import WS.WebServices;
import WS.WebServicesService;
import WS.WebServicesServiceLocator;

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
		WebServicesService wsLocator = new WebServicesServiceLocator();
		WebServices ws = null;
		try {
			ws = wsLocator.getWebServicesPort();
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		String[] categorias = ws.listarCategorias();
		if (categorias.length > 0) request.setAttribute("categorias", categorias);
		String categoria = request.getParameter("categoriaSeleccionada");
		if (categoria != null) {
			//Falta realizar la conversion
			//Map<String, String> videos = ws.videosXCatPublicos(categoria);
			//Map<String, String> listas = ws.listasXCatPublicas(categoria);
//			request.setAttribute("videos", videos);
//			request.setAttribute("listas", listas);
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
