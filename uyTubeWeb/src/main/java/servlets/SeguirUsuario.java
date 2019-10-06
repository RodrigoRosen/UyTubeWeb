package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import interfaces.Fabrica;
import interfaces.IControlador;

@WebServlet("/SeguirUsuario")
public class SeguirUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SeguirUsuario() {
        super();
    }

	protected void users(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Prueba -1");
		Fabrica fabrica = Fabrica.getInstancia();
		IControlador icon = fabrica.getIControlador();

		HttpSession se = request.getSession();
		String user1 = (String) se.getAttribute("nickname");
		String user2 = request.getParameter("users");
		System.out.println("Llega hasta acaa");
		System.out.println(user1+" - "+user2);

		//Seleccion de Usuarios
		icon.finCasoUso();
		icon.seleccionarUsuario(user1);
		icon.seleccionarUsuario(user2);
		icon.seguirUsuario();
		icon.finCasoUso();
		//if (category != null) {
		//	icon.seleccionarCategoria(category);
		//}

		//Se ingresa el video
		//Boolean newVideo = icon.ingresarVideo(nombre, dur, url, descripcion, fecha);
		RequestDispatcher rd;
		request.setAttribute("mensaje", "Siguendo a " + user2+ " con exito!!!");
		rd = request.getRequestDispatcher("/index.jsp");
        rd.forward(request, response);
		//doGet(request, response);
	}

}
