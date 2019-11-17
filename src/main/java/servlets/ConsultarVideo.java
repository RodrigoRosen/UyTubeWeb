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

import WS.WebServices;
import WS.WebServicesService;
import WS.WebServicesServiceLocator;
import WS.DtUsuario;
import WS.DtVideo;

@WebServlet("/ConsultarVideo")
public class ConsultarVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ConsultarVideo() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		WebServicesService wsLocator = new WebServicesServiceLocator();
		WebServices ws = null;
		try {
			ws = wsLocator.getWebServicesPort();
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String aux = request.getParameter("id");
		DtVideo v = null;
		if(aux != null) {
			try {
				Integer i = Integer.valueOf(aux);
				v = ws.findVideo(i.intValue());
				if(v != null) {
					request.setAttribute("video", v);
					HttpSession se = request.getSession();
					String login = (String) se.getAttribute("login");
					if(login != null) {
						int gustar = 0;
						boolean propio=false;
						String user = (String) se.getAttribute("nickname");	
						ws.seleccionarUsuario(user);
						if(ws.seleccionarVideo(v.getNombre()) != null){
							propio = true;
						}
						if(v.getPrivado() && !propio) {
							request.setAttribute("mensaje", "ERROR al consultar el video.");
							request.getRequestDispatcher("Index").forward(request, response);							
						}
						ws.finCasoUso();
						if(!v.getPrivado()){
							String[] val = v.getValoracionesPositivas();
							if(val != null) {
								for(String s: val){
									if(s.equals(user)){
										gustar = 1; //el user le dio like al video
									}
								}
							}
							if(gustar == 0){
								val = v.getValoracionesNegativas();
								if(val != null) {
									for(String s: val){
										if(s.equals(user)){
											gustar = -1; //el user le dio dislike al video
										}
									}
								}
							}
						}
						request.setAttribute("gustar", gustar);
						request.setAttribute("propio", propio);
						request.getRequestDispatcher("consultarVideo.jsp").forward(request, response);
					}else if(v.getPrivado()) {
						request.setAttribute("mensaje", "ERROR al consultar el video.");
						request.getRequestDispatcher("Index").forward(request, response);
					}else {
						request.getRequestDispatcher("consultarVideo.jsp").forward(request, response);
					}
				}
				request.setAttribute("mensaje", "ERROR al consultar el video.");
				request.getRequestDispatcher("Index").forward(request, response);			
			}catch(Exception e) {}
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String aux = request.getParameter("publicos");
		if(aux == null)
			aux = request.getParameter("privados");
		if(aux != null) {
			WebServicesService wsLocator = new WebServicesServiceLocator();
			WebServices ws = null;
			try {
				ws = wsLocator.getWebServicesPort();
			} catch (ServiceException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			DtVideo v = null;
			try {
				Integer i = Integer.valueOf(aux);
				v = ws.findVideo(i);
				request.setAttribute("video", v);
				if(v != null) {	
					HttpSession se = request.getSession();
					String login = (String) se.getAttribute("login");
					if(login != null) {
						int gustar = 0;
						boolean propio=false;
						String user = (String) se.getAttribute("nickname");	
						ws.seleccionarUsuario(user);
						if(ws.seleccionarVideo(v.getNombre()) != null){
							propio = true;
						}
						ws.finCasoUso();
						if(!v.getPrivado()){
							for(String s: v.getValoracionesPositivas()){
								if(s.equals(user)){
									gustar = 1; //el user le dio like al video
								}
							}
							if(gustar == 0){
								for(String s: v.getValoracionesNegativas()){
									if(s.equals(user)){
										gustar = -1; //el user le dio dislike al video
									}
								}						
							}
						}
						request.setAttribute("gustar", gustar);
						request.setAttribute("propio", propio);
					}
				}
			}catch(Exception e) {}
		}
		request.getRequestDispatcher("consultarVideo.jsp").forward(request, response);
	}

}