<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>

<html>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>

    </head>
		<body>

			<label>Ingresar Imagen</label>
		        <form action="FileUpload" method="POST" enctype="multipart/form-data">
		            IMAGEN:<br>
		            <input type="text" name="description" class="row">
		            <input type="file"  name="Foto" ><br><br>
		            <input type="submit"  name="accion" value="Guardar"><br>
		            <input type="submit"  name="accion" value="Regresar"><br>
		        </form>
		</body>
</html>