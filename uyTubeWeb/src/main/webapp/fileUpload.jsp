<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>

    </head>

    <body>

        <form action="FileUpload" method="POST" enctype="multipart/form-data">
            IMAGEN:<br>
            <input type="text" name="description" class="row">
            <input type="file"  name="Foto" ><br><br>
            <input type="submit"  name="accion" value="Guardar"><br>
            <input type="submit"  name="accion" value="Regresar"><br>
        </form>

    </body>

</html>