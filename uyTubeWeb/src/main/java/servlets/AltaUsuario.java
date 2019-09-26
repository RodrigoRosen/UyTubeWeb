package servlets;

import java.io.IOException;
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
		Date fechaNac = new Date();
		String img = request.getParameter("img");
		String nombreCanal = request.getParameter("nombreCanal");
		String descripcion = request.getParameter("descripcion");
		Boolean privado = false;
		if(request.getParameter("privado") == "Si")
			privado = true;
		DtCanal canal = new DtCanal(nombreCanal, descripcion, nickname, privado);
		Boolean ok = icon.ingresarUsuario(nickname, email, nombre, apellido, fechaNac, img, canal);
		RequestDispatcher rd;
		if(ok)
			request.setAttribute("mensaje", "El usuario " + nickname + " a sido ingresado correctamente");
		else
			request.setAttribute("mensaje", "El usuario " + nickname + " o el email " + email + " ya existe!.");

		rd = request.getRequestDispatcher("index.jsp");
		doGet(request, response);
	}

}
