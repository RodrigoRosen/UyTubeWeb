package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.rpc.ServiceException;

import WS.DtCanal;
import WS.DtLista;
import WS.DtVideo;
import WS.WebServices;
import WS.WebServicesService;
import WS.WebServicesServiceLocator;

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
		WebServicesService wsLocator = new WebServicesServiceLocator();
		WebServices ws = null;
		try {
			ws = wsLocator.getWebServicesPort();
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		String dato = request.getParameter("buscar");
		DtVideo[] videos = ws.buscarVideosPublicos(dato);
		if (videos.length > 0) request.setAttribute("videos", videos);
		
		DtCanal[] canales = ws.buscarCanalesPublicos(dato);
		if(canales.length > 0) request.setAttribute("canales", canales);
		
		DtLista[] listas = ws.buscarListasPublicas(dato);
		if(listas.length > 0) request.setAttribute("listas", listas);
		
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
