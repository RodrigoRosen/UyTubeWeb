package servlets;

import java.io.IOException;
import java.text.ParseException;
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

import datatypes.DtCanal;
import datatypes.DtUsuario;
import interfaces.Fabrica;
import interfaces.IControlador;

@WebServlet("/ModificarUsuario")
public class ModificarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ModificarUsuario() {
		super();
	}

	/*
	 * El caso de uso comienza cuando un Propietario desea modificaralguno de sus
	 * datos. Para ello el sistema muestra todos los da-tos del usuario (incluyendo
	 * su imagen, si la tiene) y su canal,permitiendo que edite todos sus datos
	 * excepto su nickname ycorreo electrónico, pudiendo además hacer público o
	 * privado elcanal. En el caso de querer cambiar su contraseña, deberátambién
	 * ingresar la confirmación de la nueva contraseña. El usuario también puede
	 * seleccionar un video o lista de reproducción de su canal y realizar su
	 * modificación, tal como indicanlos casos de uso Modificar Datos de Video y
	 * Modificar Da-tos de Lista de Reproducción, respectivamente. Cuando ter-mina
	 * la edición, el sistema actualiza los datos del usuario.
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getInstancia();
		IControlador icon = fabrica.getIControlador();

		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("nickname");

		Map<DtUsuario, DtCanal> datos = icon.listarDatosUsuario(user);
		Iterator<Entry<DtUsuario, DtCanal>> it = datos.entrySet().iterator();
		DtUsuario dtu = null;
		DtCanal dtc = null;
		while (it.hasNext()) {
			Entry<DtUsuario, DtCanal> entry = it.next();
			dtu = entry.getKey();
			dtc = entry.getValue();
		}
		if (dtu != null)
			request.setAttribute("dtu", dtu);
		if (dtc != null)
			request.setAttribute("dtc", dtc);
		RequestDispatcher view = request.getRequestDispatcher("ModificarUsuario.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getInstancia();
		IControlador icon = fabrica.getIControlador();

		ArrayList<String> listCategory = icon.listarCategorias();
		request.setAttribute("listCategory", listCategory);

		String nickname = request.getParameter("newNickname");
		String email = request.getParameter("email");
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		String fecha = request.getParameter("fecha");
		Date fechaNac = new Date();
		try {
			fechaNac = formatter.parse(fecha);
		} catch (ParseException e) {
			System.out.println(e);
		}
		String img = request.getParameter("img");
		String nombreCanal = request.getParameter("nom_canal");
		String descripcion = request.getParameter("descripcion");
		String password = request.getParameter("password");
		Boolean privado = false;
		if (request.getParameter("privado") == "Si")
			privado = true;
		DtCanal canal = new DtCanal(nombreCanal, descripcion, nickname, privado);
		DtUsuario usuario = new DtUsuario(nickname, email, password, nombre, apellido, fechaNac, img);

		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("nickname");

		// Seleccion de Usuario y Modificacion
		icon.seleccionarUsuario(user);
		icon.modificarUsuarioCanal(usuario, canal);

		RequestDispatcher rd;
		request.setAttribute("mensaje",
				"Se ha modificado correctamente el usuario " + nickname + " y su canal " + nombre);
		icon.finCasoUso();
		rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
	}

}
