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

import datatypes.DtVideo;
import interfaces.Fabrica;
import interfaces.IControlador;

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
		Fabrica fabrica = Fabrica.getInstancia();
		IControlador icon = fabrica.getIControlador();
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("nickname");
		icon.seleccionarUsuario(user);
		ArrayList<String> videos = icon.listarVideos();
		if (!videos.isEmpty()) request.setAttribute("videos", videos);
		String nomVid = (String) request.getParameter("vidsel");
		DtVideo dtv = icon.seleccionarVideo(nomVid);
		if(dtv != null) request.setAttribute("dtv", dtv);
		ArrayList<String> categorias = icon.listarCategorias();
		if (!categorias.isEmpty()) request.setAttribute("categorias", categorias);
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
