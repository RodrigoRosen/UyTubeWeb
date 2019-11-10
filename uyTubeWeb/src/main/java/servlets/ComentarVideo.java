package servlets;

import java.io.IOException;

import java.util.Date;

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
import WS.DtVideo;
import WS.DtComentario;


@WebServlet("/ComentarVideo")
public class ComentarVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ComentarVideo() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession se = request.getSession();
		String login = (String) se.getAttribute("login");
		if(login != null) {
			WebServicesService wsLocator = new WebServicesServiceLocator();
			WebServices ws = null;
			try {
				ws = wsLocator.getWebServicesPort();
			} catch (ServiceException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String aux1 = request.getParameter("v");
			String aux2 = request.getParameter("id");
			if(aux1 != null) {
				try {
					Integer v = Integer.valueOf(aux1);
					DtVideo dtv = ws.findVideo(v.intValue());
					if(dtv != null) {
						if(aux2 != null) {
							Integer id = Integer.valueOf(aux2);
							request.setAttribute("id", id);					
						}else {
							request.setAttribute("id", null);							
						}
						request.setAttribute("video", dtv);	
						request.getRequestDispatcher("comentarVideo.jsp").forward(request, response);	
						
					}else {
						request.setAttribute("mensaje", "ERROR al comentar el video.");
						request.getRequestDispatcher("index.jsp").forward(request, response);						
					}
				}catch(Exception e) {
					request.setAttribute("mensaje", "ERROR al comentar el video.");
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}
			}else {
				request.setAttribute("mensaje", "ERROR al comentar el video.");
				request.getRequestDispatcher("index.jsp").forward(request, response);
				
			}
		}else {
			request.setAttribute("mensaje", "Debes estar logeado.");
			request.getRequestDispatcher("index.jsp").forward(request, response);		
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession se = request.getSession();
		String login = (String) se.getAttribute("login");
		if(login != null) {
			String aux = request.getParameter("aux");
			if(aux != null) {
				Integer i =  Integer.valueOf(aux);
				String com = request.getParameter("comentario");
				if(com != null && !com.equals("")) {
					WebServicesService wsLocator = new WebServicesServiceLocator();
					WebServices ws = null;
					try {
						ws = wsLocator.getWebServicesPort();
					} catch (ServiceException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					DtVideo dtv = ws.findVideo(i.intValue());
					String owner = ws.findDuenioVideo(dtv.getId());
					if(owner != null) {
						String user = (String) se.getAttribute("nickname");	
						ws.seleccionarUsuario(owner);
						ws.seleccionarVideo(dtv.getNombre());
						ws.seleccionarUsuario(user);
						DtComentario dtc = new DtComentario();
						String aux2 = request.getParameter("id");					
						if(aux2 != null) {
							System.out.println("######################################################################### "+aux2);
							Integer id =  Integer.valueOf(aux2);
							if(id.intValue() != 0) {
								dtc.setId(id.intValue());
								ws.seleccionarComentario(dtc);
							}
						}else {
							System.out.println("######################################################################### null id");
						}
						//CAMBIAR A CALENDAR?
						dtc.setFecha(new Date());
						dtc.setTexto(com);
						dtc.setNick(user);
						Boolean b = ws.ingresarComentario(dtc);
						ws.finCasoUso();
						if(b) {
							response.sendRedirect(request.getContextPath() + "/" + "ConsultarVideo?id="+dtv.getId());							
						}else {
							System.out.println("######################################################################### error ingreso");
							request.setAttribute("mensaje", "ERROR al comentar el video.");
							request.getRequestDispatcher("index.jsp").forward(request, response);							
						}
					}else {
						System.out.println("######################################################################### null owner");
						request.setAttribute("mensaje", "ERROR al comentar el video.");
						request.getRequestDispatcher("index.jsp").forward(request, response);
					}
				}else {
					System.out.println("######################################################################### null comentario");
					request.setAttribute("mensaje", "ERROR al comentar el video.");
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}	
			}else {
				System.out.println("######################################################################### null video");
				request.setAttribute("mensaje", "ERROR al comentar el video.");
				request.getRequestDispatcher("index.jsp").forward(request, response);		
			}
		}else {
			System.out.println("######################################################################### null login");
			request.setAttribute("mensaje", "Debes estar logeado.");
			request.getRequestDispatcher("index.jsp").forward(request, response);		
		}
	}	
}
