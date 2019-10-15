package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datatypes.DtCanal;
import interfaces.Fabrica;
import interfaces.IControlador;


@WebServlet("/AltaUsuario")
public class AltaUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AltaUsuario() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getInstancia();
		IControlador icon = fabrica.getIControlador();
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		SimpleDateFormat formatter = new SimpleDateFormat("dd/mm/yyyy");
		String fecha = request.getParameter("fechaNacimiento");
		Date fechaNac = new Date();
		try {
			fechaNac = formatter.parse(fecha);
		} catch (ParseException e) {
			System.out.println(e);
        }
		
		String img = request.getParameter("img");
		String nombreCanal = request.getParameter("canal");
		String descripcion = request.getParameter("descripcion");
		String password = request.getParameter("contrasena");
		Boolean privado = false;
		System.out.println(request.getParameter("privado"));
		if(request.getParameter("privado") == "Si")
			privado = true;
		DtCanal canal = new DtCanal(nombreCanal, descripcion, nickname, privado);
		System.out.println(canal.getNombre());
		System.out.println(canal.getDescripcion());
		System.out.println(canal.getNick());

		Boolean ok = icon.ingresarUsuario(nickname, email, password, nombre, apellido, fechaNac, img, canal);
		RequestDispatcher rd;
		String resp = "index.jsp";
		if(ok) {
			request.setAttribute("mensaje", "El usuario " + nickname + " ha sido ingresado correctamente");
			response.sendRedirect(request.getContextPath() + "/");
		}else {
			request.setAttribute("mensaje", "El usuario " + nickname + " o el email " + email + " ya existe!. Intentelo nuevamente");
			rd = request.getRequestDispatcher(resp);
			rd.forward(request, response);
			resp = "altaUsuario.jsp";
		}

		
	}

}
