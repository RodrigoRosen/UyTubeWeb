package servlets;

import java.io.IOException;
import java.util.ArrayList;

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
import WS.DtVideo;

/**
 * Servlet implementation class DatosVideo
 */
@WebServlet("/DatosVideo")
public class DatosVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DatosVideo() {
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
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("nickname");
		ws.seleccionarUsuario(user);
		String[] videos = ws.listarVideos();
		if (videos != null & videos.length > 0) request.setAttribute("videos", videos);
		String nomVid = (String) request.getParameter("vidsel");
		DtVideo dtv = ws.seleccionarVideo(nomVid);
		if(dtv != null) request.setAttribute("dtv", dtv);
		String[] categorias = ws.listarCategorias();
		if (categorias != null && categorias.length > 0) request.setAttribute("categorias", categorias);
		ws.finCasoUso();
		RequestDispatcher rd = request.getRequestDispatcher("modificarDatosVideo.jsp");
		rd.forward(request, response);
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
