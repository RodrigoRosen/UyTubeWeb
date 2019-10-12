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
		<nav class="navbar navbar-expand-lg navbar-light bg-light"> <img
			src="imagenes/UyTube.png" class="img-fluid" height="50px"
			width="150px">
		<div class="md-form mt-0" style="margin-left: 40px">
			<input class="form-control" type="text" placeholder="Search"
				aria-label="Search" id="searchBarPrincipalId" style="width: 450px">
		</div>


<!--Modal: Login / Register Form-->
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
	<% ArrayList<String> lists = (ArrayList<String>) request.getAttribute("listas"); %>
	<form action="DatosLista" method="post" name="ModificarDatosLista" id="modificarDatosLista">
		<div class="container">
			<div class="body row">
				<div class="form-group row">
				  <select class="custom-select col-xs-12 col-sm-4 col-md-4" id="listsel" name="listsel" >
				    <option selected>Seleccione una lista</option>
	    			<%
	    			if(lists != null)
					for (String lista : lists) {
					%>
					<option value="<%=lista%>"><%=lista%>
					</option>
					<%
						}
					%>
				    
				  </select>	
				  <button type="submit" id="btnModList" class="btn btn-primary col-xs-12 col-sm-8 col-md-8">Mostrar Datos Lista</button>
				</div>
			</div>
		</div>
	</form>
	<%DtLista dtlista = (DtLista) request.getAttribute("dtl"); 
		String nombre = " ";
		Boolean privado = false;
		String esprivado = "";
		Boolean defecto = false;
		String esdefecto = "";
		String categoria = " ";
		if(dtlista != null){
			nombre = dtlista.getNombre();
			defecto = dtlista.isDefecto();
			categoria = dtlista.getCategoria();
			if(dtlista.isPrivado())
				esprivado = "si";
			else 
				esprivado = "no";
			if(dtlista.isDefecto())
				esdefecto = "si";
			else 
				esdefecto = "no";
		}
	%>
	<form action="ModificarDatosLista" method="post" name="ModificarDatosLista" id="modificarDatosLista">
		<div class="container">
			<div class="form-group row">
				<input type="text" name="nombre"
				class="form-control col-xs-12 col-sm-8 col-md-8" id="nombre"
				aria-describedby="emailHelp" placeholder="<%=nombre%>" value="<%=nombre%>">
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
				<h3 class="col-xs-4 col-sm-4">Es defecto?</h3>
				<select class="custom-select col-xs-8 col-sm-8 col-md-8" id="esdefecto" name="esdefecto" >
				    <option selected><%=esdefecto%></option>
					<option value="si">si
					</option>
					<option value="no">no
					</option>
				    
				  </select>	
			</div>
			<% ArrayList<String> categorias = (ArrayList<String>) request.getAttribute("categorias"); %>
			<select class="custom-select col-xs-12 col-sm-4 col-md-4" id="categoria" name="categoria" >
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
			<div class="form-group row">
				<button type="submit" id="btnAceptar" class="btn btn-primary col-xs-12 col-sm-4 col-md-4">Aceptar</button>
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
