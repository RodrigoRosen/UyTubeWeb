package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.hibernate.Session;

import datatypes.DtUsuario;
import datatypes.DtVideo;
import interfaces.Fabrica;
import interfaces.IControlador;

@WebServlet("/ValorarVideo")
public class ValorarVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ValorarVideo() {
        super();
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
		String userVal = (String) session.getAttribute("nickname");//se obtiene el usuario que valora
		String userProp = request.getParameter("propietario");//propietario del video seleccionado en el consulta video
		icon.seleccionarUsuario(userProp);/*Aca se debe usar el usuario propietario del video*/
		icon.seleccionarVideo(request.getParameter("video"));//Se selecciona el video del propietario ya seleccionado
		Boolean valor = null;
		String valoracion = request.getParameter("valoracion");
		if(valoracion.equals("positiva"))
			valor = true;
		else if(valoracion.equals("negativa"))
			valor = false;		
		icon.valorarVideo(userVal, valor);
		RequestDispatcher rd;
		request.setAttribute("mensaje", "Se ha valorado correctamente el video ");
		rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
		//doGet(request, response);
	}

}
