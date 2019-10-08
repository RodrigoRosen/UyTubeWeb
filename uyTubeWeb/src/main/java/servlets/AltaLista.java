package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datatypes.DtUsuario;
import interfaces.Fabrica;
import interfaces.IControlador;

/**
 * Servlet implementation class AltaLista
 */
@WebServlet("/AltaLista")
public class AltaLista extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AltaLista() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("nickname");
		if (username != null) {
			Fabrica fabrica = Fabrica.getInstancia();
			IControlador icon = fabrica.getIControlador();
			ArrayList<String> categorias = icon.listarCategorias();
			if (!categorias.isEmpty()) request.setAttribute("categorias", categorias);
			RequestDispatcher rd;
			request.setAttribute("loaded", true);
			rd = request.getRequestDispatcher("/altaLista.jsp");
			rd.forward(request, response);
		}
		else {
			response.sendError(403);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getInstancia();
		IControlador icon = fabrica.getIControlador();		
		icon.ingresarTipoLista(false);
		String nombreLista = (String) request.getParameter("nombreLista");
		String Privada = (String) request.getParameter("privada");
		String categoria = (String) request.getParameter("categoria");
		boolean privada = false;
		if (Privada != null && Privada.equals("on")) privada = true;		
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("nickname");		
		DtUsuario user = icon.seleccionarUsuario(username);		
		String resp = "altaLista.jsp";
		if (icon.crearLista(user, nombreLista, privada, categoria)) {
			request.setAttribute("mensaje", "La lista se creó correctamente");
			icon.finCasoUso();
			resp = "index.jsp";
		}
		else {
			request.setAttribute("mensaje", "Existe una lista con el nombre ingresado.");
			request.setAttribute("error", "Hubo un error.");
			doGet(request, response);
		}
		RequestDispatcher rd;		
		rd = request.getRequestDispatcher(resp);
		rd.forward(request, response);
		
	}

}
