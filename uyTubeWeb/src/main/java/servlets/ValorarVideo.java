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
		RequestDispatcher rd;
		Fabrica fabrica = Fabrica.getInstancia();
		IControlador icon = fabrica.getIControlador();
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("nickname");//se obtiene el usuario que valora
		String a = request.getParameter("aux");
		String b = request.getParameter("likex");
		if(a!=null && b!=null) {
			System.out.println("if*"+a+"*"+b+"****************************************************************************");	
			int id = Integer.valueOf(a);
			int valoracion = Integer.valueOf(b);
			Boolean valor = null;
			if(valoracion > 0)
				valor = true;
			else
				valor = false;		
			boolean r = icon.valorarVideoPublico(id,user, valor);
			if(r) {
				request.setAttribute("mensaje", "Se ha valorado correctamente el video ");
			}else {
				request.setAttribute("mensaje", "Error al valorar el video ");
				System.out.println("Error-valorarVideo****************************************************************************");			
			}
		}else {
			request.setAttribute("mensaje", "Error al valorar el video ");
			System.out.println("variable"+a+"-"+b+"****************************************************************************");				
		}
		rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
		//doGet(request, response);
	}

}
