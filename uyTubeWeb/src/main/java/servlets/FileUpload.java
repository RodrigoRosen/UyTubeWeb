package servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import datatypes.DtCanal;
import datatypes.DtUsuario;
import interfaces.Fabrica;
import interfaces.IControlador;

@WebServlet("/FileUpload")
@MultipartConfig
public class FileUpload extends HttpServlet {

	private static final long serialVersionUID = 1L;
    // ...
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fabrica fabrica = Fabrica.getInstancia();
		IControlador icon = fabrica.getIControlador();
		String description = request.getParameter("description"); // Retrieves <input type="text" name="description">
	    Part filePart = request.getPart("Foto"); // Retrieves <input type="file" name="file">
	    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
	    InputStream fileContent = filePart.getInputStream();
	    File f = new File("/home/seba/eclipse/imagenes/"+fileName);
	    String direccion = ("/home/seba/eclipse/imagenes/"+fileName);
	    HttpSession session = request.getSession();
		String user = (String) session.getAttribute("nickname");
		Map<DtUsuario, DtCanal> dtos = icon.listarDatosUsuario(user);
		Iterator<Entry<DtUsuario, DtCanal>> it = dtos.entrySet().iterator();
		DtUsuario dtu = null;
		DtCanal dtc = null;
		while (it.hasNext()) {
			Entry<DtUsuario, DtCanal> entry = it.next();
			dtu = entry.getKey();
			dtc = entry.getValue();
		}
		dtu.setImg(direccion);
		icon.modificarUsuarioCanal(dtu, dtc);
		
	    FileOutputStream os = new FileOutputStream(f);
	    int datos = fileContent.read();
	    while(datos != -1) {
	    	os.write(datos);
	    	datos = fileContent.read();
	    }
	    os.close();
	    fileContent.close();
	    icon.finCasoUso();
	    RequestDispatcher rd;
		rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
	}
	
	
}
