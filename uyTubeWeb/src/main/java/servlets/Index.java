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
import javax.xml.rpc.ServiceException;

import WS.WebServices;
import WS.WebServicesService;
import WS.WebServicesServiceLocator;

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
				WebServicesService wsLocator = new WebServicesServiceLocator();
				WebServices ws = null;
				try {
					ws = wsLocator.getWebServicesPort();
				} catch (ServiceException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				String[] categorias = ws.listarCategorias();
				//CORREGIR
				Map<String, String> canales = ws.listarCanalesPublicos();
				HashMap<Integer, String> videos = ws.listarVideosPublicos();
				HashMap<Integer, String> listas = ws.listarListasPublicas();
				if (videos != null && !videos.isEmpty()) session.setAttribute("videosPublicos", videos);
				if (listas != null && !listas.isEmpty()) session.setAttribute("listasPublicas", listas);
				if (categorias != null && categorias.length > 0) session.setAttribute("categorias", categorias);
				RequestDispatcher view = request.getRequestDispatcher("index.jsp");		
				view.forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}