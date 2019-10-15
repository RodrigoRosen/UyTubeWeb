<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<script src="libs/jquery-3.4.1.min.js" charset="utf-8"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous" />

<script src="js/bootstrap-datepicker.js" charset="utf-8"></script>
<link rel="stylesheet" href="css/bootstrap-datepicker.css">


<title>uyTube | Alta Video</title>

</head>


<body>
	<!-- Barra Principal -->
	<div class="container" id="navBarPrincipal">
		<jsp:include page="nav.jsp" />
	</div>
	<!-- Resto de la pag -->
	<h1 class="container">Video Nuevo</h1>
	<form action="AltaVideo" method="post">
		<div class="container">
			<div class="form-group row">
				<input type="text" name="nombre"
					class="form-control col-xs-12 col-sm-8 col-md-8" id="nombre"
					aria-describedby="emailHelp" placeholder="Nombre" required="true">
			</div>
			<div class="form-group row">
				<input type="number" name="duracion"
					class="form-control col-xs-12 col-sm-8 col-md-8" id="duracion"
					aria-describedby="emailHelp" placeholder=Duracion " required="true" onchange="durWarning()">
			</div>
			<div class="form-group row">
				<input type="text" name="url"
					class="form-control col-xs-12 col-sm-8 col-md-8" id="url"
					aria-describedby="emailHelp" placeholder="Url" required="true">
			</div>
			<div class="form-group row">
				<input type="text" name="descripcion"
					class="form-control col-xs-12 col-sm-8 col-md-8" id="descripcion"
					aria-describedby="emailHelp" placeholder="Descripcion"
					required="true">
			</div>

			<div class="form-group row">
				<select
					class="custom-select form-control col-xs-4 col-sm-4 col-md-4"
					id="idCategoryList" name="categoria">
					<option selected>Seleccionar Categoria...</option>
					<%
						ArrayList<String> categorias = (ArrayList<String>) request.getAttribute("categorias");
						if (categorias != null) {
							for (String cat : categorias) {
					%>
					<option value="<%=cat%>"><%=cat%></option>
					<%
						}
						}
					%>
				</select>
			</div>

			<div class="form-group row">
				<button type="submit" id="btnAceptar"
					class="btn btn-primary col-xs-12 col-sm-4 col-md-4">Subir
					Video</button>
			</div>
		</div>
		</div>
	</form>

	<script>
		$(document).ready(
				function() {
					var cats =
	<%=request.getAttribute("categorias")%>
		;
					var error =
	<%=request.getAttribute("error")%>
		;
					var loaded =
	<%=request.getAttribute("loaded")%>
		if (cats === undefined || cats === null && error === null
							&& !loaded)
						$("#getAttr").click();
				});
	</script>
	<script src="js/app.js" charset="utf-8"></script>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

</body>
</html>