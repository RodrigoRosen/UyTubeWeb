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


import org.hibernate.Session;

import datatypes.DtLista;
import datatypes.DtUsuario;
import datatypes.DtVideo;
import interfaces.Fabrica;
import interfaces.IControlador;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getInstancia();
		IControlador icon = fabrica.getIControlador();
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("nickname");
		DtUsuario dtuser  = icon.seleccionarUsuario(user);/*Aca se debe usar el usuario logeado*/
		List<DtLista> listed = icon.listarListasParticulares(dtuser);
		ArrayList<String> listas = new ArrayList<String>();
		for(DtLista l: listed) {
			listas.add(l.getNombre());
		}
		if (!listas.isEmpty()) request.setAttribute("listas", listas);
		RequestDispatcher view = request.getRequestDispatcher("modificarDatosLista.jsp");
		view.forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getInstancia();
		IControlador icon = fabrica.getIControlador();
		
		ArrayList<String> listCategory = icon.listarCategorias();
		request.setAttribute("listCategory", listCategory);
		
		System.out.println("Llega hasta acaa1");
		String nombre = request.getParameter("nombre");
		Boolean esprivado = false;
		System.out.println("Llega hasta acaa1");
		if(request.getParameter("esprivado").equals("si")) {
			System.out.println("Llega hasta acaa1");
			esprivado = true;
		}
		System.out.println("Llega hasta acaa2");
		Boolean esdefecto = false;
		if(request.getParameter("esdefecto").equals("si")) {
			esdefecto = true;
		}
		System.out.println("Llega hasta acaa3");
		String category = request.getParameter("categoria");
		
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("nickname");
		System.out.println("Llega hasta acaa4");

		//Seleccion de Usuario y Categoria
		icon.seleccionarUsuario(user);
		icon.seleccionarCategoria(category);
		if (category != null) {
			icon.seleccionarCategoria(category);
		}
		DtLista oldLista = icon.seleccionarLista(nombre);
		DtLista newLista = icon.seleccionarLista(nombre);
		System.out.println(newLista.getNombre());
		newLista.setNombre(nombre);
		newLista.setPrivado(esprivado);
		newLista.setDefecto(esdefecto);
		newLista.setCategoria(category);
		//Se ingresa el video
		icon.modificarListaParticular(oldLista ,newLista);
		RequestDispatcher rd;
		request.setAttribute("mensaje", "Se ha modificado correctamente la lista " + nombre);
		rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
		//doGet(request, response);
	}

}
