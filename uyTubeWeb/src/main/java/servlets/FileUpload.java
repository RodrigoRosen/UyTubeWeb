package servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/FileUpload")
@MultipartConfig
public class FileUpload extends HttpServlet {

	private static final long serialVersionUID = 1L;
    // ...
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String description = request.getParameter("description"); // Retrieves <input type="text" name="description">
	    Part filePart = request.getPart("Foto"); // Retrieves <input type="file" name="file">
	    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
	    InputStream fileContent = filePart.getInputStream();
	    File f = new File("/home/seba/eclipse/imagenes/"+fileName);
	    FileOutputStream os = new FileOutputStream(f);
	    int datos = fileContent.read();
	    while(datos != -1) {
	    	os.write(datos);
	    	datos = fileContent.read();
	    }
	    os.close();
	    fileContent.close();
	    
	}
	
	
}
