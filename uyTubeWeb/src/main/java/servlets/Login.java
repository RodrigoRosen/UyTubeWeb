package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import interfaces.Fabrica;
import interfaces.IControlador;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd;
        rd = request.getRequestDispatcher("/login.jsp");
        rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();

        String usu = request.getParameter("nickLogin");
        String pwd = request.getParameter("passLogin");
        Fabrica fabrica = Fabrica.getInstancia();        
        IControlador icon = fabrica.getIControlador();
        
        if (icon.login(usu, pwd)) {
        	session.setAttribute("nickname", usu);
        }
        else {
        	request.setAttribute("error", "Usuario y/o contraseña inválida, por favor intente de nuevo.");
        	RequestDispatcher rd;
        	rd = request.getRequestDispatcher("/index.jsp");
        	rd.forward(request, response);
        }
      

//		try {
//
//		} catch (Exception e) {
//			request.setAttribute("error", "Usuario y/o contrasenia no coinciden, vuelva a ingresar");
//			RequestDispatcher rd;
//			rd = request.getRequestDispatcher("/login.jsp");
//			rd.forward(request, response);
//		}
	}

}
