package servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datatypes.DtUsuario;
import interfaces.Fabrica;
import interfaces.IControlador;

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
				IControlador icon = Fabrica.getIControlador();
				icon.finCasoUso();
				DtUsuario usr1 = icon.seleccionarUsuario(seguidor);
				DtUsuario usr2 = icon.seleccionarUsuario(seguido);
				if(usr1 != null && usr2 != null) {
					DtUsuario aux = usr1.getSeguidos().get(seguido);
					if(aux != null) {
						icon.dejarSeguir();
						icon.finCasoUso();
						request.setAttribute("mensaje", "Dejaste de seguir a "+seguido+" con exito!!!");
						response.sendRedirect(request.getContextPath()+"/"+"ConsultarUsuario?nickname="+seguido);
					}else {
						icon.finCasoUso();
						request.setAttribute("mensaje", "No seguias al usuario: "+seguido);
						response.sendRedirect(request.getContextPath()+"/"+"Index");
					}				
				}else {
					icon.finCasoUso();
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
