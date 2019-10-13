package servlets;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datatypes.DtLista;
import interfaces.Fabrica;
import interfaces.IControlador;

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
		Fabrica fabrica = Fabrica.getInstancia();
		IControlador icon = fabrica.getIControlador();
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("nickname");
		String idVideo = (String) request.getParameter("IDVIDEO");
		String textVideo = (String) request.getParameter("TEXTVIDEO");
		String nombreVideo = null;
		nombreVideo = textVideo;		
		String nombreLista = (String) request.getParameter("nombreLista");
		if (username != null) {
			String duenioVideo = icon.findDuenioVideo(Integer.parseInt(idVideo));			
			icon.seleccionarUsuario(duenioVideo);
			icon.seleccionarVideo(nombreVideo);
			icon.seleccionarUsuario(username);
			DtLista lst = icon.seleccionarLista(nombreLista);
			icon.agregarVideo(nombreVideo, lst);
			icon.finCasoUso();
			response.sendRedirect(request.getContextPath() + "/" + "ConsultaLista?IDLISTA="+lst.getId());
		}		
		
	}

}
