<%@page import="datatypes.DtVideo"%>
<%@page import="datatypes.DtUsuario"%>
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
		<nav class="navbar navbar-expand-lg navbar-light bg-light"> 
			<a href="index.jsp">
				<img src="imagenes/UyTube.png" class="img-fluid" height="50px"
				width="150px">
			</a>
		<div class="md-form mt-0" style="margin-left: 40px">
			<input class="form-control" type="text" placeholder="Search"
				aria-label="Search" id="searchBarPrincipalId" style="width: 450px">
		</div>
		<%
			String login = (String) session.getAttribute("login");
			String username = (String) session.getAttribute("nickname");
			if (login == null || login.equals("Usuario y/o contraseña inválida, por favor intente de nuevo.")) {
		%>
		<div class="md-form mt-0" style="margin-left: 360px">
			<button type="button" id="btnModal" class="btn btn-primary">Entrar</button>
		</div>
		<%
			} else {
		%>
		<div class="md-form mt-0" style="margin-left: 250px">
			<h3><%=username%></h3>
			<form action="LogOut" method="post">
				<button type="submit" id="btnModalLogOut" class="btn btn-primary">Salir</button>
			</form>
		</div>
		<%
			} ;
		%> <!--Modal: Login / Register Form-->
		<div class="modal fade" id="modalFec" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog cascading-modal" role="document">
				<!--Content-->
				<div class="modal-content">
					<!-- Tab panels -->
					<div class="tab-content">
						<!--Panel 7-->
						<div class="tab-pane fade in show active" id="panel7"
							role="tabpanel">

							<!--Body-->
							<div class="modal-body mb-1">
								<label>Iniciar Sesion</label>

								<form action="Login" method="post">

									<div class="md-form form-sm mb-5">
										<i class="fas fa-envelope prefix"></i> <input type="nickname"
											id="nickLogin" name="nickLogin"
											class="form-control form-control-sm validate"> <label
											data-error="wrong" data-success="right" for="modalLRInput10">Usuario</label>
									</div>

									<div class="md-form form-sm mb-4">
										<i class="fas fa-lock prefix"></i> <input type="password"
											id="passLogin" name="passLogin"
											class="form-control form-control-sm validate"> <label
											data-error="wrong" data-success="right" for="modalLRInput11">Contrasena</label>
									</div>
									<div class="text-center mt-2">
										<button id="login" type="submit" class="btn btn-info">
											Iniciar <i class="fas fa-sign-in ml-1"></i>
										</button>
									</div>
								</form>
							</div>
							<!--Footer-->
							<div class="modal-footer">
								<div class="options text-center text-md-right mt-1">
									<p>
										No tiene usuario? <a href="altaUsuario.jsp" class="blue-text">Registrarse!</a>
									</p>
								</div>
								<button type="button"
									class="btn btn-outline-info waves-effect ml-auto"
									data-dismiss="modal">Cerrar</button>
							</div>

						</div>

					</div>
					<!--/.Content-->
				</div>
			</div>
		</div>
		<!--Modal: Login / Register Form--> </nav>

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
	<% ArrayList<String> vids = (ArrayList<String>) request.getAttribute("videos"); %>
	<form action="DatosVideo" method="post" name="ModificarDatosVideo" id="modificarDatosVideo">
		<div class="container">
<!-- 			<div class="body row"> -->
				<div class="form-group row">
				  <select class="custom-select col-xs-8 col-sm-8 col-md-8" id="vidsel" name="vidsel" >
				    <option selected>Seleccione un video</option>
	    			<%
	    			if(vids != null)
					for (String video : vids) {
					%>
					<option value="<%=video%>"><%=video%>
					</option>
					<%
						}
					%>
				    
				  </select>	
				  <button type="submit" id="btnModVid" class="btn btn-primary col-xs-4 col-sm-4 col-md-4">Mostrar Datos Video Seleccionado</button>
				</div>
			</div>
<!-- 		</div> -->
	</form>
	<%DtVideo dtvideo = (DtVideo) request.getAttribute("dtv"); 
		String nombre = " ";
		String duracion = " ";
		String url = " ";
		String descripcion = " ";
		String categoria = " ";
		Boolean privado = false;
		String esprivado = "";
		if(dtvideo != null){
			nombre = dtvideo.getNombre();
			duracion = dtvideo.getDuracion().toString();
			url = dtvideo.getUrl();
			descripcion = dtvideo.getDescripcion();
			categoria = dtvideo.getCategoria();
			if(dtvideo.getPrivado())
				esprivado = "si";
			else 
				esprivado = "no";
		}
	%>
	<%if(url != null){ %>
			<div class="form-group" style="text-align:center">
					<iframe class="col-xs-12" width="560" height="315"
						src="<%=url%>" frameborder="0"
						allowfullscreen></iframe>
			</div>
	<%}else{%>
		<h2 style="text-align:center">La url del video no es correcta!</h2>
	<%}; %>
	<form action="ModificarDatosVideo" method="post" name="ModificarDatosVideo" id="modificarDatosVideo">
		<div class="container">
			<div class="form-group row">
				<h3 class="col-xs-4 col-sm-4">Nombre</h3>
				<input type="text" name="nombre"
				class="form-control col-xs-8 col-sm-8 col-md-8" id="nombre"
				aria-describedby="emailHelp" placeholder="<%=nombre%>" value="<%=nombre%>">
			</div>
			<div class="form-group row">
				 <h3 class="col-xs-4 col-sm-4">Duracion</h3>
				 <input type="text" name="duracion"
					class="form-control col-xs-8 col-sm-8 col-md-8" id="duracion"
					aria-describedby="emailHelp" value=<%=duracion %>>
			</div>
			<div class="form-group row">
				<h3 class="col-xs-4 col-sm-4">URL</h3>
				 <input type="text" name="url"
					class="form-control col-xs-8 col-sm-8 col-md-8" id="url"
					aria-describedby="emailHelp" value="<%=url%>">
			</div>
			<div class="form-group row">
				 <h3 class="col-xs-4 col-sm-4">Descripcion</h3>
				 <input type="text" name="descripcion"
					class="form-control col-xs-8 col-sm-8 col-md-8" id="descripcion"
					aria-describedby="emailHelp" value="<%=descripcion%>">
			</div>
		
			<% ArrayList<String> categorias = (ArrayList<String>) request.getAttribute("categorias"); %>
			<div class="form-group row">
				<h3 class="col-xs-4 col-sm-4">Categoria</h3>
				<select class="custom-select col-xs-8 col-sm-8 col-md-8" id="categoria" name="categoria" >
				    <option selected><%=categoria%></option>
	    			<%
	    			if(categorias != null)
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
				<h3 class="col-xs-4 col-sm-4">Es privado?</h3>
				<select class="custom-select col-xs-8 col-sm-8 col-md-8" id="esprivado" name="esprivado" >
				    <option selected><%=esprivado%></option>
					<option value="si">si
					</option>
					<option value="no">no
					</option>
				    
				  </select>	
			</div>
		

			<div class="form-group row">
				<button type="submit" id="btnAceptar" class="btn btn-primary col-xs-12 col-sm-12 col-md-12 center-block">Modificar</button>
			</div>
		</div>

		
		
		
	</form>
	
<!-- 	https://www.youtube.com/embed/EqWRaAF6_WY -->



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
