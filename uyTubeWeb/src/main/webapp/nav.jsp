
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<form action="Index" method="get">
		<input class="navbar-brand" type="image" src="imagenes/UyTube.png"
			height="auto" width="150px">
	</form>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-5">

			<!-- MENU VIDEO -->
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Videos </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">

					<%
						String login = (String) session.getAttribute("login");
						String username = (String) session.getAttribute("nickname");
						if (username != null && username.length() > 0) {
					%>
					<form action="AltaVideo" method="get">
						<li><button class="dropdown-item" type="submit"
								value="Submit" class="btn-link">Alta Video</button></li>
					</form>
					<%
						} else {
					%>
					<a class="dropdown-item disabled" href="#" tabindex="-1"
						aria-disabled="true" data-placement="left"
						title="Debes estar logueado">Alta Video</a>
					<%
						}
						;
					%>

					<%
						if (username != null && username.length() > 0) {
					%>
					<form action="ModificarDatosVideo" method="get">
						<li><a class="dropdown-item" href="ModificarDatosVideo">Modificar
								Video</a></li>
					</form>
					<%
						} else {
					%>
					<a class="dropdown-item disabled" href="#" tabindex="-1"
						aria-disabled="true" data-placement="left"
						title="Debes estar logueado">Modificar Video</a>
					<%
						}
						;
					%>
				</div></li>

			<!-- MENU LISTA -->
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Listas </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<%
						if (username != null && username.length() > 0) {
					%>
					<form action="AltaLista" method="get">
						<a class="dropdown-item" href="AltaLista">Crear Lista
							Particular</a>
					</form>
					<%
						} else {
					%>
					<a class="dropdown-item disabled" href="#" tabindex="-1"
						aria-disabled="true" data-placement="left"
						title="Debes estar logueado">Crear Lista</a>
					<%
						}
						;
					%>
					<%
						if (username != null && username.length() > 0) {
					%>
					<form action="ModificarDatosLista" method="get">
						<a class="dropdown-item" href="ModificarDatosLista">Modificar
							Lista</a>
					</form>
					<%
						} else {
					%>
					<a class="dropdown-item disabled" href="#" tabindex="-1"
						aria-disabled="true" data-placement="left"
						title="Debes estar logueado">Modificar Lista</a>
					<%
						}
						;
					%>
				</div></li>

			<!-- MENU CATEGORIA -->
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Categorias </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="altaCategoria.jsp">Crear
						Categoria</a>
				</div></li>

			<!-- MENU USUARIO -->
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Usuarios </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<%
						if (username != null && username.length() > 0) {
					%>
					<a class="dropdown-item" href="seguirUsuario.jsp">Seguir
						Usuario</a>
					<%
						} else {
					%>
					<a class="dropdown-item disabled" href="#" tabindex="-1"
						aria-disabled="true" data-toggle="tooltip" data-placement="left"
						title="Debes estar logueado">Seguir Usuario</a>
					<%
						}
						;
					%>
					<a class="dropdown-item" href="#">Dejar de Seguir</a> <a
						class="dropdown-item" href="#">Consultar Usuario</a> 
						
						<form action="ModificarUsuario" method="get">
						<li><button class="dropdown-item" type="submit"
								value="Submit" class="btn-link">Modificar Usuario</button></li>
					</form>
				</div></li>
		</ul>

		<!-- SEARCH & ENTRAR & SALIR -->
		<form action="Buscar" class="form-inline navbar-nav mr-auto my-lg-2 d-flex align-items-center">
			<div class="input-group">
				<input type="search" class="form-control" style="width:25em" placeholder="Buscar"
					aria-label="Buscar" aria-describedby="basic-addon1" id="buscar">
				<div class="input-group-prepend">
					<button class="btn btn-outline-secondary" type="submit" id="buscar">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
			<!-- 			<input class="form-control mr-sm-2" type="search" -->
			<!-- 				placeholder="Buscar" aria-label="Buscar" id="buscar" name="buscar"> -->
			<!-- 			<button class="btn btn-outline-success my-2 my-sm-0" type="submit" -->
			<!-- 				id="buscar">Buscar</button> -->
		</form>
		<%
			if (login == null || login.equals("Usuario y/o contraseña inválida, por favor intente de nuevo.")) {
		%>
		<div class="md-form mt-0" style="margin-left: 10px">
			<button type="button" id="btnModal" class="btn btn-primary">Entrar</button>
		</div>
		<%
			} else {
		%>
		<div class="md-form mt-0" style="margin-left: 10px">
			<form action="LogOut" method="post">
				<button type="submit" id="btnModalLogOut" class="btn btn-primary">Salir</button>
			</form>
		</div>
		<%
			}
			;
		%>
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
				</div>
			</div>
		</div>
	</div>
</nav>
