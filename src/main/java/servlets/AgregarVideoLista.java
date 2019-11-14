package servlets;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.rpc.ServiceException;

import WS.DtLista;
import WS.WebServices;
import WS.WebServicesService;
import WS.WebServicesServiceLocator;

/**
 * Servlet implementation class AgregarVideoLista
 */
@WebServlet("/AgregarVideoLista")
public class AgregarVideoLista extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AgregarVideoLista() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
			e.printStackTrace();
		}		
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("nickname");
		String idVideo = (String) request.getParameter("IDVIDEO");
		String textVideo = (String) request.getParameter("TEXTVIDEO");
		String nombreVideo = null;
		nombreVideo = textVideo;		
		String nombreLista = (String) request.getParameter("nombreLista");
		if (username != null) {
			String duenioVideo = ws.findDuenioVideo(Integer.parseInt(idVideo));	
			ws.seleccionarUsuario(duenioVideo);
			ws.seleccionarUsuario(duenioVideo);
			ws.seleccionarVideo(nombreVideo);
			ws.seleccionarUsuario(username);
			DtLista lst = ws.seleccionarLista(nombreLista);
			ws.agregarVideo(nombreVideo, lst);
			ws.finCasoUso();
			response.sendRedirect(request.getContextPath() + "/" + "ConsultaLista?IDLISTA="+lst.getId());
		}		
		
	}

}
