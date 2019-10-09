package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datatypes.DtCanal;
import datatypes.DtUsuario;
import interfaces.Fabrica;
import interfaces.IControlador;

@WebServlet("/ConsultarVideo")
public class ConsultarVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ConsultarVideo() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String aux = request.getParameter("publicos");
		if(aux == null)
			aux = request.getParameter("privados");
		if(aux != null) {
			request.setAttribute("video", Integer.valueOf(aux));
		}
		request.getRequestDispatcher("consultarVideo.jsp").forward(request, response);
	}

}