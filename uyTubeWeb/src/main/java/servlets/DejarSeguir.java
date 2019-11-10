package servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.rpc.ServiceException;

import WS.DtUsuario;
import WS.WebServices;
import WS.WebServicesService;
import WS.WebServicesServiceLocator;

@WebServlet("/DejarSeguir")
public class DejarSeguir extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DejarSeguir() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession se = request.getSession();
		String login = (String) se.getAttribute("login");
		if(login != null) {	
			String seguido = request.getParameter("user");
			if(seguido != null) {
				String seguidor = (String) se.getAttribute("nickname");
				WebServicesService wsLocator = new WebServicesServiceLocator();
				WebServices ws = null;
				try {
					ws = wsLocator.getWebServicesPort();
				} catch (ServiceException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				ws.finCasoUso();
				DtUsuario usr1 = ws.seleccionarUsuario(seguidor);
				DtUsuario usr2 = ws.seleccionarUsuario(seguido);
				if(usr1 != null && usr2 != null) {
					//Ver como corregir esto
					DtUsuario aux = usr1.getSeguidos().get(seguido);
					if(aux != null) {
						ws.dejarSeguir();
						ws.finCasoUso();
						request.setAttribute("mensaje", "Dejaste de seguir a "+seguido+" con exito!!!");
						response.sendRedirect(request.getContextPath()+"/"+"ConsultaUsuario?nickname="+seguido);
					}else {
						ws.finCasoUso();
						request.setAttribute("mensaje", "No seguias al usuario: "+seguido);
						response.sendRedirect(request.getContextPath()+"/"+"Index");
					}				
				}else {
					ws.finCasoUso();
					request.setAttribute("mensaje", "No se pudo dejar de seguir a "+seguido);
					response.sendRedirect(request.getContextPath()+"/"+"Index");
				}				
			}else {
				request.setAttribute("mensaje", "ERROR dejando de seguir a usuario");
				response.sendRedirect(request.getContextPath()+"/"+"Index");
			}	
		}else {
			request.setAttribute("mensaje", "Debes estar logeado para acceder a esa pagina");
			response.sendRedirect(request.getContextPath()+"/"+"Index");	
		}
	}
}
