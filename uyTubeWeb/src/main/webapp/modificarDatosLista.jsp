<%@page import="datatypes.DtVideo"%>
<%@page import="datatypes.DtLista"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UyTube</title>

<!-- JQuery -->
<script src="libs/jquery-3.4.1.min.js" charset="utf-8"></script>


<!-- CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link href="/css/created/indexLayout.css" rel="stylesheet"
	type="text/css">

<script src="js/bootstrap-datepicker.js" charset="utf-8"></script>
<link rel="stylesheet" href="css/bootstrap-datepicker.css">

</head>


<body>
	<!-- Barra Principal -->
	<div class="container" id="navBarPrincipal">
		<jsp:include page="nav.jsp" />
	</div>
	<!-- Resto de la pag -->

	<%-- 	<h2>${mensaje}</h2> --%>
	<div class="alert alert-primary alert-dismissible fade show"
		role="alert">
		${mensaje}
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<%
		ArrayList<String> lists = (ArrayList<String>) request.getAttribute("listas");
	%>
	<form action="DatosLista" method="post" name="ModificarDatosLista"
		id="modificarDatosLista">
		<div class="container">
			<div class="body row">
				<div class="form-group row">
					<select class="custom-select col-xs-8 col-sm-8 col-md-8"
						id="listsel" name="listsel">
						<option selected>Seleccione una lista</option>
						<%
							if (lists != null)
								for (String lista : lists) {
						%>
						<option value="<%=lista%>"><%=lista%>
						</option>
						<%
							}
						%>

					</select>
					<button type="submit" id="btnModList"
						class="btn btn-primary col-xs-4 col-sm-4 col-md-4">Mostrar
						Datos Lista</button>
				</div>
			</div>
		</div>
	</form>
	<%
		DtLista dtlista = (DtLista) request.getAttribute("dtl");
		String nombre = " ";
		String newNombre = " ";
		Boolean privado = false;
		String esprivado = "";
		String newPrivado = "";
		String categoria = " ";
		String newCategoria = " ";
		if (dtlista != null) {
			nombre = dtlista.getNombre();
			newNombre = nombre;
			categoria = dtlista.getCategoria();
			newCategoria = categoria;
			if (dtlista.isPrivado()) {
				esprivado = "si";
				newPrivado = "si";
			} else {
				esprivado = "no";
				newPrivado = "no";
			}
		}
	%>
	<form action="ModificarDatosLista" method="post"
		name="ModificarDatosLista" id="modificarDatosLista">
		<div class="container">
			<div class="form-group row">
				<h6 class="col-xs-2 col-sm-2">Nombre</h6>
				<input type="text" name="nombre"
					class="form-control col-xs-4 col-sm-4 col-md-4" id="nombre"
					aria-describedby="emailHelp" placeholder="<%=nombre%>"
					value="<%=nombre%>" readonly>
				<h6 class="col-xs-2 col-sm-2">Nuevo Nombre:</h6>
				<input type="text" name="newNombre"
					class="form-control col-xs-4 col-sm-4 col-md-4" id="newNombre"
					aria-describedby="emailHelp" placeholder="<%=newNombre%>"
					value="<%=newNombre%>">
			</div>
			<div class="form-group row">
				<h6 class="col-xs-2 col-sm-2">Privado</h6>
				<select class="custom-select col-xs-4 col-sm-4 col-md-4"
					id="esprivado" name="esprivado" disabled="true">
					<option selected><%=esprivado%></option>
				</select>
				<h6 class="col-xs-2 col-sm-2">Nuevo Privado</h6>
				<select class="custom-select col-xs-4 col-sm-4 col-md-4"
					id="newPrivado" name="newPrivado">
					<option selected><%=newPrivado%></option>
					<option value="si">si</option>
					<option value="no">no</option>

				</select>
			</div>
			<%
				ArrayList<String> categorias = (ArrayList<String>) request.getAttribute("categorias");
			%>
			<div class="form-group row">
				<h6 class="col-xs-2 col-sm-2">Categoria</h6>
				<select class="custom-select col-xs-4 col-sm-4 col-md-4"
					id="categoria" name="categoria" disabled="true">
					<option selected><%=categoria%></option>
					<!-- 
					<%
						if (categorias != null)
							for (String cat : categorias) {
					%>
					<option value="<%=cat%>"><%=cat%>
					</option>
					<%
						}
					%>-->

				</select>
				<h6 class="col-xs-2 col-sm-2">Nueva Categoria</h6>
				<select class="custom-select col-xs-4 col-sm-4 col-md-4"
					id="newCategoria" name="newCategoria">
					<option selected><%=categoria%></option>
					<%
						if (categorias != null)
							for (String cat : categorias) {
					%>
					<option value="<%=cat%>"><%=cat%>
					</option>
					<%
						}
					%>
				</select>
			</div>
			<div class="form-group row">
				<button type="submit" id="btnAceptar"
					class="btn btn-primary col-xs-12 col-sm-4 col-md-4">Aceptar</button>
			</div>
		</div>
	</form>

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
