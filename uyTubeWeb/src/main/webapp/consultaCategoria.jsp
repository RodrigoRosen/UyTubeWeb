<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.Map.Entry"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="ISO-8859-1">

<script src="libs/jquery-3.4.1.min.js" charset="utf-8"></script>
<script
	src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous" />

<script src="js/bootstrap-datepicker.js" charset="utf-8"></script>
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<title>Consulta de categoria</title>
</head>
<body>
	<div class="container" id="navBarPrincipal">
		<nav class="navbar navbar-expand-lg navbar-light bg-light"> <img
			src="imagenes/UyTube.png" class="img-fluid" height="50px"
			width="150px">
		<div class="md-form mt-0" style="margin-left: 40px">
			<input class="form-control" type="text" placeholder="Search"
				aria-label="Search" id="searchBarPrincipalId" style="width: 450px">
		</div>
		<%
			String login = (String) session.getAttribute("login");
			String username = (String) session.getAttribute("nickname");
			if (login == null) {
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
			}
			;
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
	<div class="container-fluid text-center">
		<div class="row content">

			<div class="col-xs-6 col-sm-4 col-lg-2 sidenav" id="sideBar">
				<ul class="list-unstyled components">
					<li><a href="#homeSubmenu" data-toggle="collapse"
						aria-expanded="false" class="dropdown-toggle">Videos</a>
						<ul class="collapse list-unstyled" id="homeSubmenu">
							<li><a href="altaVideo.jsp">Añadir Video</a></li>
							<form action="ModificarDatosVideo" method="get">
								<li><a href="ModificarDatosVideo">Modificar Video</a></li>
							</form>
							<li><a href="#">Consultar Video</a></li>
							<li><a href="#">Comentar un Video</a></li>
							<li><a href="#">Valorar Video</a></li>
						</ul></li>
					<li><a href="#pageSubmenu" data-toggle="collapse"
						aria-expanded="false" class="dropdown-toggle">Listas de
							reproduccion</a>
						<ul class="collapse list-unstyled" id="pageSubmenu">
							<form action="AltaLista" method="get">
								<li><a href="altaLista.jsp">Crear Lista de Reproduccion
										Particular</a></li>
							</form>
							<li><a href="#">Modificar Lista de Reproduccion</a></li>
							<li><a href="#">Agregar Video a Lista de Reproduccion</a></li>
							<li><a href="#">Quitar Video de Lista de Reproduccion</a></li>
							<li><a href="#">Consulta de Lista de Reproduccion</a></li>
						</ul></li>
					<li><a href="#categoria" data-toggle="collapse"
						aria-expanded="false" class="dropdown-toggle">Categorias</a>
						<ul class="collapse list-unstyled" id="categoria">
							<li><a href="altaCategoria.jsp">Crear Categoria</a></li>
							<form action="ListarCategorias" method="get">
								<button type="submit" value="Submit" class="btn-link">Listar
									Categorias</button>
							</form>
						</ul></li>
					<li><a href="#usuario" data-toggle="collapse"
						aria-expanded="false" class="dropdown-toggle">Usuarios</a>
						<ul class="collapse list-unstyled" id="usuario">
							<li><a href="seguirUsuario.jsp">Seguir Usuario</a></li>
							<li><a href="#">Dejar de Seguir</a></li>
							<li><a href="#">Consultar Usuario</a></li>
							<li><a href="#">Modificar Usuario</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- Logica del consulta lista -->
			<div class="col-xs-12 col-xs-offset-12 row">
				<h2>Listas</h2>
				<table class="table table-striped table-bordered">
					<thead>
						<th scope="col">Propietario</th>
						<th scope="col">Nombre</th>
					</thead>
					<tbody>
						<%
							Map<String, String> videos = (Map<String, String>) request.getAttribute("videos");
							Map<String, String> listas = (Map<String, String>) request.getAttribute("listas");
							for (Entry<String, String> entry : listas.entrySet()) {
						%>
						<td><%=entry.getValue()%></td>
						<td><%=entry.getKey()%></td>
						<%
							}
						%>
					</tbody>
				</table>
				<h2>Videos</h2>
				<table class="table table-striped table-bordered">
					<thead>
						<th scope="col">Propietario</th>
						<th scope="col">Nombre</th>
					</thead>
					<tbody>
						<%
							for (Entry<String, String> entry : videos.entrySet()) {
						%>
						<td><%=entry.getValue()%></td>
						<td><%=entry.getKey()%></td>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
			<div class="col-sm-2 sidenav col-sm-offset-6">
				<jsp:include page="listadoCategorias.jsp" />
			</div>
		</div>
	</div>
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