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
import javax.xml.rpc.ServiceException;

import WS.DtUsuario;
import WS.DtUsuarioSeguidoresEntry;
import WS.DtUsuarioSeguidosEntry;
import WS.WebServices;
import WS.WebServicesService;
import WS.WebServicesServiceLocator;

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
		WebServicesService wsLocator = new WebServicesServiceLocator();
		WebServices ws = null;
		try {
			ws = wsLocator.getWebServicesPort();
		} catch (ServiceException e) {
			e.printStackTrace();
		}		
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("nickname");
		if (username != null) {
			String[] categorias = ws.listarCategorias();
			if (categorias.length > 0) request.setAttribute("categorias", categorias);
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
		WebServicesService wsLocator = new WebServicesServiceLocator();
		WebServices ws = null;
		try {
			ws = wsLocator.getWebServicesPort();
		} catch (ServiceException e) {
			e.printStackTrace();
		}		
		ws.ingresarTipoLista(false);
		String nombreLista = (String) request.getParameter("nombreLista");
		String Privada = (String) request.getParameter("privada");
		String categoria = (String) request.getParameter("categoria");
		boolean privada = false;
		if (Privada != null && Privada.equals("on")) privada = true;		
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("nickname");		
		DtUsuario user = ws.seleccionarUsuario(username);		
		String resp = "altaLista.jsp";
		if (ws.crearLista(user, nombreLista, privada, categoria)) {
			request.setAttribute("mensaje", "La lista se cre� correctamente");
			ws.finCasoUso();
			resp = "index.jsp";
		}
		else {
			request.setAttribute("mensaje", "Existe una lista con el nombre ingresado.");
			request.setAttribute("error", "Hubo un error.");
			doGet(request, response);
		}
		response.sendRedirect(request.getContextPath() + "/");
		
	}

}
