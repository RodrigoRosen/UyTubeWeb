package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datatypes.DtLista;
import datatypes.DtUsuario;
import datatypes.DtVideo;
import interfaces.Fabrica;
import interfaces.IControlador;

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
		Fabrica fabrica = Fabrica.getInstancia();
		IControlador icon = fabrica.getIControlador();
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("nickname");
		String textVideo = (String) request.getParameter("VideoDeleteName");
		String nombreVideo = null;
		nombreVideo = textVideo;		
		String nombreLista = (String) request.getParameter("listaSelected");
		if (username != null && nombreLista != null) {	
			icon.seleccionarUsuario(username);
			DtUsuario user = new DtUsuario(username);
			icon.listarListasParticulares(user);
			DtLista lst = new DtLista(0,nombreLista,false,false,null);
			icon.videosEnLista(lst);
			DtVideo vid = new DtVideo(0,nombreVideo,false,null,null,0,null,null,null);
			icon.quitarVideo(vid);
			icon.finCasoUso();
		}
		response.sendRedirect(request.getContextPath() + "/");	
	}

}
