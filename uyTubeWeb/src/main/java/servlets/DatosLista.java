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

import datatypes.DtLista;
import datatypes.DtUsuario;
import datatypes.DtVideo;
import interfaces.Fabrica;
import interfaces.IControlador;

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
		Fabrica fabrica = Fabrica.getInstancia();
		IControlador icon = fabrica.getIControlador();
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("nickname");
		DtUsuario dtuser  = icon.seleccionarUsuario(user);/*Aca se debe usar el usuario logeado*/
		icon.seleccionarUsuario(user);
		List<DtLista> listed = icon.listarListasParticulares(dtuser);
		ArrayList<String> listas = new ArrayList<String>();
		for(DtLista l: listed) {
			listas.add(l.getNombre());
		}
		if (!listas.isEmpty()) request.setAttribute("listas", listas);
		String nomList = (String) request.getParameter("listsel");
		DtLista dtl = icon.seleccionarLista(nomList);
		if(dtl!= null) request.setAttribute("dtl", dtl);
		ArrayList<String> categorias = icon.listarCategorias();
		if (!categorias.isEmpty()) request.setAttribute("categorias", categorias);
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
