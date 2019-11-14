package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
import WS.DtLista;
import WS.DtUsuario;
import WS.DtVideo;

/**
 * Servlet implementation class ModificarLista
 */
@WebServlet("/ModificarDatosLista")
public class ModificarDatosLista extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ModificarDatosLista() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		DtUsuario dtuser = ws.seleccionarUsuario(user);/* Aca se debe usar el usuario logeado */
		DtLista[] listed = ws.listarListasParticulares(dtuser);
		ArrayList<String> listas = new ArrayList<String>();
		for (DtLista l : listed) {
			listas.add(l.getNombre());
		}
		if (!listas.isEmpty())
			request.setAttribute("listas", listas);
		RequestDispatcher view = request.getRequestDispatcher("modificarDatosLista.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		DtUsuario usuario = ws.seleccionarUsuario(user);

		// Nuevos Valores
		String nombre = request.getParameter("nombre");
		String newNombre = request.getParameter("newNombre");
		Boolean newPrivado = false;
		if (request.getParameter("newPrivado").equals("si")) {
			newPrivado = true;
		}
		String newCategory = request.getParameter("newCategoria");
		DtLista oldLista = ws.seleccionarLista(nombre);
		DtLista newLista = new DtLista();
		newLista.setNombre(newNombre);
		newLista.setPrivado(!newPrivado);
		newLista.setCategoria(newCategory);

		// Se modifica la lista
		ws.listarListasParticulares(usuario);
		ws.modificarListaParticular(oldLista, newLista);
		response.sendRedirect(request.getContextPath() + "/" + "ConsultaLista?IDLISTA="+oldLista.getId());
	}

}
