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
import javax.xml.rpc.ServiceException;
import WS.WebServices;
import WS.WebServicesService;
import WS.WebServicesServiceLocator;
import WS.DtUsuario;
import WS.DtVideo;

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
		RequestDispatcher rd = null;
		WebServicesService wsLocator = new WebServicesServiceLocator();
		WebServices ws = null;
		try {
			ws = wsLocator.getWebServicesPort();
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("nickname");//se obtiene el usuario que valora
		String a = request.getParameter("aux");
		String b = request.getParameter("likex");
		if(a!=null && b!=null) {
			int id = Integer.valueOf(a);
			int valoracion = Integer.valueOf(b);
			Boolean valor = null;
			if(valoracion > 0)
				valor = true;
			else
				valor = false;		
			//VER POR QUE TIENE UN ARGUMENTO MENOS	// o.O
			boolean r = ws.valorarVideoPublico(id,user, valor);
			if(r) {
				request.setAttribute("mensaje", "Se ha valorado correctamente el video ");
				//request.setParameter("id", id);
				//rd = request.getRequestDispatcher("/ConsultarVideo?id="+id);
				response.sendRedirect(request.getContextPath() + "/" + "ConsultarVideo?id="+id);
			}else {
				request.setAttribute("mensaje", "Error al valorar el video ");
				rd = request.getRequestDispatcher("index.jsp");
		        rd.forward(request, response);	
			}
		}else {
			request.setAttribute("mensaje", "Error al valorar el video ");
			rd = request.getRequestDispatcher("index.jsp");
	        rd.forward(request, response);	
		}
		//doGet(request, response);
	}

}
