package servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import javax.xml.rpc.ServiceException;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

import WS.DtCanal;
import WS.DtUsuario;
import WS.DtVideo;
import WS.WebClient;
import WS.WebServices;
import WS.WebServicesService;
import WS.WebServicesServiceLocator;
import WS.DtLista;

@WebServlet("/ConsultaUsuario")
public class ConsultaUsuario  extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ConsultaUsuario() {
        super();
    }
    DtUsuario Usuario = null;
	DtCanal Canal = null;
   
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		WebServicesService wsLocator = new WebServicesServiceLocator();
		WebServices ws = null;
		try {
			ws = wsLocator.getWebServicesPort();
		} catch (ServiceException e) {
			e.printStackTrace();
		}HttpSession session = request.getSession();
		String user2 = request.getParameter("nickname");		
		Map<DtUsuario, DtCanal> datos = WebClient.listarDatosUsuario(user2);
		Iterator<Entry<DtUsuario, DtCanal>> it = datos.entrySet().iterator();
		while (it.hasNext()) {
				Entry<DtUsuario, DtCanal> entry = it.next();
				Usuario = entry.getKey();
				Canal = entry.getValue();
			}
			if (!datos.isEmpty()) {
				request.setAttribute("Usuario", Usuario);
				request.setAttribute("Canal", Canal);
			}			
			Map<String, DtUsuario> seguidor = Usuario.getSeguidores();			
			ArrayList<String> seguidores = new ArrayList<String>();
			for (DtUsuario Usr : seguidor.values()) {
				seguidores.add(Usr.getNickname());
			}
			request.setAttribute("seguidores", seguidores);			
			Map<String, DtUsuario> seguid = Usuario.getSeguidos();
			ArrayList<String> seguidos = new ArrayList<String>();
			for (DtUsuario Usr : seguid.values()) {
				seguidos.add(Usr.getNickname());
			}			
			request.setAttribute("seguidos", seguidos);		
			int num_seguidores = seguidores.size(); 
			int num_seguidos = seguidos.size();
			request.setAttribute("num_seguidos", num_seguidos);
			request.setAttribute("num_seguidores", num_seguidores);			
			Map<Integer, DtVideo> videos = Canal.getListaVideos();//			
			Map<Integer, DtLista> listas = Canal.getListasReproduccion();			
			if (videos != null) request.setAttribute("videos", videos);
			if (listas != null) request.setAttribute("listas", listas);			
			RequestDispatcher view = request.getRequestDispatcher("ConsultaUsuario.jsp");
			view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {			
	}
	
}
