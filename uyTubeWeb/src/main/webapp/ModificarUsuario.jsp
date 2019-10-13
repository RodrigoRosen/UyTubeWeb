<%@page import="datatypes.DtCanal"%>
<%@page import="datatypes.DtUsuario"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@page import="datatypes.DtVideo"%>
<%@page import="datatypes.DtLista"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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


<title>UyTube | Perfil</title>

</head>
<body>
	<!-- Barra Principal -->
	<div class="container" id="navBarPrincipal">
		<jsp:include page="nav.jsp" />
	</div>
	<!-- Resto de la pag -->
	<%
		String nickname = "";
		String newNickname = "";
		String email = "";
		String nombre = "";
		String apellido = "";
		String password = "";
		String confpassword = "";
		Date fecha = new Date();
		String img = "";
		String nom_canal = "";
		String descripcion = "";
		Boolean privado = false;

		DtUsuario usr = (DtUsuario) request.getAttribute("dtu");
		DtCanal cnl = (DtCanal) request.getAttribute("dtc");

		if (usr != null) {
			nickname = usr.getNickname();
			newNickname = nickname;
			email = usr.getEmail();
			nombre = usr.getNombre();
			apellido = usr.getApellido();
			password = usr.getPassword();
			confpassword = usr.getPassword();
			fecha = usr.getFechaNac();
			img = usr.getImg();
			nom_canal = cnl.getNombre();
			descripcion = cnl.getDescripcion();
			privado = cnl.isPrivado();
		}
	%>
	<form action="ModificarUsuario" method="post" name="ModificarUsuario"
		id="ModificarUsuario">
		<div class="container">
			<div class="form-group row">
				<h1 class="col-xs-4 col-sm-4">Perfil De</h1>
				<input type="text" name="nickname"
					class="form-control col-xs-8 col-sm-8 col-md-8" id="nickname"
					aria-describedby="emailHelp" placeholder="<%=nickname%>"
					value="<%=nickname%>" readonly>
				<h6 class="col-xs-4 col-sm-4">Nickname</h6>
				<input type="text" name="newNickname"
					class="form-control col-xs-8 col-sm-8 col-md-8" id="newNickname"
					aria-describedby="emailHelp" placeholder="<%=newNickname%>"
					value="<%=newNickname%>">
			</div>

			<div class="form-group row">
				<h6 class="col-xs-4 col-sm-4">Email</h6>
				<input type="text" name="email"
					class="form-control col-xs-8 col-sm-8 col-md-8" id="email"
					aria-describedby="emailHelp" placeholder="<%=email%>"
					value="<%=email%>">
			</div>

			<div class="form-group row">
				<h6 class="col-xs-4 col-sm-4">Nombre</h6>
				<input type="text" name="nombre"
					class="form-control col-xs-8 col-sm-8 col-md-8" id="nombre"
					aria-describedby="emailHelp" placeholder="<%=nombre%>"
					value="<%=nombre%>">
			</div>

			<div class="form-group row">
				<h6 class="col-xs-4 col-sm-4">Apellido</h6>
				<input type="text" name="apellido"
					class="form-control col-xs-8 col-sm-8 col-md-8" id="apellido"
					aria-describedby="emailHelp" placeholder="<%=apellido%>"
					value="<%=apellido%>">
			</div>

			<div class="form-group row">
				<h6 class="col-xs-4 col-sm-4">Contraseña</h6>
				<input type="password" name="password"
					class="form-control col-xs-8 col-sm-8 col-md-8" id="password"
					aria-describedby="emailHelp" placeholder="<%=password%>"
					value="<%=password%>">
			</div>

			<div class="form-group row">
				<h6 class="col-xs-4 col-sm-4">Confirmar Contraseña</h6>
				<input type="password" name="confpassword"
					class="form-control col-xs-8 col-sm-8 col-md-8" id="confpassword"
					aria-describedby="emailHelp" placeholder="<%=confpassword%>"
					value="<%=confpassword%>">
			</div>

			<div class="form-group row">
				<h6 class="col-xs-4 col-sm-4">Fecha</h6>
				<div class="input-group date sg-fecha">
					<input type="text" class="form-control col-xs-8 col-sm-8 col-md-8 "
						id="fecha" placeholder="<%=fecha%>" value="<%=fecha%>"><span
						class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
				</div>
			</div>

			<div class="form-group row">
				<h6 class="col-xs-4 col-sm-4">Imagen</h6>
				<input id="img" name="img" type="file" class="file"
					data-browse-on-zone-click="true"> <img src="#"
					class="rounded float-left" alt="..." value="<%=img%>">
				<!-- INGRESAR LA IMG -->
			</div>

			<div class="form-group row">
				<h6 class="col-xs-4 col-sm-4">Nombre Canal</h6>
				<input type="text" name="canal"
					class="form-control col-xs-8 col-sm-8 col-md-8" id="canal"
					aria-describedby="emailHelp" placeholder="<%=nom_canal%>"
					value="<%=nom_canal%>">
			</div>

			<div class="form-group row">
				<h6 class="col-xs-4 col-sm-4">Descripcion</h6>
				<input type="text" name="descripcion"
					class="form-control col-xs-8 col-sm-8 col-md-8" id="descripcion"
					aria-describedby="emailHelp" placeholder="<%=descripcion%>"
					value="<%=descripcion%>">
			</div>

			<div class="form-group row">
				<h6 class="col-xs-4 col-sm-4">Privado</h6>
				<input type="text" name="privado"
					class="form-control col-xs-8 col-sm-8 col-md-8" id="privado"
					aria-describedby="emailHelp" placeholder="<%=privado%>"
					value="<%=privado%>">
			</div>

			<div class="form-group row">
				<button type="submit" id="btnAceptar"
					class="btn btn-primary col-xs-12 col-sm-12 col-md-12">Modificar</button>
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

