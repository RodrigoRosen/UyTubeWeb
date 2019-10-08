package servlets;

import java.io.IOException;
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

@WebServlet("/Usuario")
public class Usuario  extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public Usuario() {
        super();
    }

    /*El caso de uso comienza cuando un Propietario desea modificaralguno de sus datos. 
     * Para ello el sistema muestra todos los da-tos del usuario (incluyendo su imagen, si la tiene) 
     * y su canal,permitiendo que edite todos sus datos excepto su nickname ycorreo electrónico, 
     * pudiendo además hacer público o privado elcanal. En el caso de querer cambiar su contraseña, 
     * deberátambién ingresar la confirmación de la nueva contraseña. 
     * El usuario también puede seleccionar un video o lista de reproducción de su canal y realizar su modificación, 
     * tal como indicanlos casos de uso Modificar Datos de Video y Modificar Da-tos de Lista de Reproducción, respectivamente. 
     * Cuando ter-mina la edición, el sistema actualiza los datos del usuario.*/
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Utilizo fabrica y controlador relativos al proyecto anterior (.jar)
		Fabrica fabrica = Fabrica.getInstancia();
		IControlador icon = fabrica.getIControlador();
		
		//traigo la sesion para traer el usuario
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("nickname");
		
		//uso la función del controlador que devuelve el mapa de datos del uruario
		 Map<DtUsuario, DtCanal> datos = icon.listarDatosUsuario(user);
		 Iterator<Entry<DtUsuario, DtCanal>> it = datos.entrySet().iterator();
			DtUsuario usuario = null;
			DtCanal canal = null;
			while (it.hasNext()) {
				Entry<DtUsuario, DtCanal> entry = it.next();
				usuario = entry.getKey();
				canal = entry.getValue();
			}
			if (!datos.isEmpty()) request.setAttribute("usuario", datos);
			request.setAttribute("nickname", usuario.getNickname());
			request.setAttribute("email", usuario.getEmail());
			request.setAttribute("nombre", usuario.getNombre());
			request.setAttribute("apellido", usuario.getApellido());
			request.setAttribute("fecha", usuario.getFechaNac());
			request.setAttribute("img", usuario.getImg());
			request.setAttribute("nom_canal", canal.getNombre());
			request.setAttribute("descrpicio", canal.getDescripcion());
      //Private??
			
			RequestDispatcher view = request.getRequestDispatcher("Usuario.jsp");
			view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
}
