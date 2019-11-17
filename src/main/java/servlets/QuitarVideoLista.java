package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.rpc.ServiceException;

import WS.DtLista;
import WS.DtUsuario;
import WS.DtVideo;
import WS.WebClient;
import WS.WebServices;
import WS.WebServicesService;
import WS.WebServicesServiceLocator;

/**
 * Servlet implementation class QuitarVideoLista
 */
@WebServlet("/QuitarVideoLista")
public class QuitarVideoLista extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuitarVideoLista() {
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("nickname");
		String textVideo = (String) request.getParameter("VideoDeleteName");
		String nombreVideo = null;
		nombreVideo = textVideo;		
		String nombreLista = (String) request.getParameter("listaSelected");
		if (username != null && nombreLista != null) {	
			ws.seleccionarUsuario(username);
			DtUsuario user = WebClient.newUsuario(username, nombreLista);
			ws.listarListasParticulares(user);
			DtLista lst = new DtLista(0,nombreLista,false,false,null);
			ws.videosEnLista(lst);
			DtVideo vid = new DtVideo(0,nombreVideo,false,null,null,0,null,null,null, null, null, null, null, null);
			ws.quitarVideo(vid);
			ws.finCasoUso();
		}
		response.sendRedirect(request.getContextPath() + "/");	
	}

}
