package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import datatypes.DtComentario;
import datatypes.DtUsuario;
import datatypes.DtVideo;
import interfaces.Fabrica;
import interfaces.IControlador;

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
			IControlador icon = Fabrica.getIControlador();
			String aux1 = request.getParameter("v");
			String aux2 = request.getParameter("id");
			if(aux1 != null) {
				try {
					Integer v = Integer.valueOf(aux1);
					DtVideo dtv = icon.findVideo(v.intValue());
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
					IControlador icon = Fabrica.getIControlador();
					DtVideo dtv = icon.findVideo(i.intValue());
					String owner = icon.findDuenioVideo(dtv.getId());
					if(owner != null) {
						String user = (String) se.getAttribute("nickname");	
						icon.seleccionarUsuario(owner);
						icon.seleccionarVideo(dtv.getNombre());
						icon.seleccionarUsuario(user);
						DtComentario dtc = new DtComentario();
						String aux2 = request.getParameter("id");
						Integer id =  Integer.valueOf(aux2);						
						if(id != null) {
							dtc.setId(id.intValue());
							icon.seleccionarComentario(dtc);
						}else {
							System.out.println("######################################################################### null id");
						}
						dtc.setFecha(new Date());
						dtc.setTexto(com);
						dtc.setNick(user);
						Boolean b = icon.ingresarComentario(dtc);
						icon.finCasoUso();
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
