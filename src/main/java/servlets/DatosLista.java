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

import WS.DtLista;
import WS.DtUsuario;
import WS.DtVideo;
import WS.WebServices;
import WS.WebServicesService;
import WS.WebServicesServiceLocator;

/**
 * Servlet implementation class DatosVideo
 */
@WebServlet("/DatosLista")
public class DatosLista extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DatosLista() {
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
		DtUsuario dtuser  = ws.seleccionarUsuario(user);/*Aca se debe usar el usuario logeado*/
		ws.seleccionarUsuario(user);
		DtLista[] listed = ws.listarListasParticulares(dtuser);
		ArrayList<String> listas = new ArrayList<String>();
		for(DtLista l: listed) {
			listas.add(l.getNombre());
		}
		if (!listas.isEmpty()) request.setAttribute("listas", listas);
		String nomList = (String) request.getParameter("listsel");
		DtLista dtl = ws.seleccionarLista(nomList);
		if(dtl!= null) request.setAttribute("dtl", dtl);
		String[] categorias = ws.listarCategorias();
		if (categorias != null && categorias.length > 0) request.setAttribute("categorias", categorias);
		RequestDispatcher rd = request.getRequestDispatcher("modificarDatosLista.jsp");
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
