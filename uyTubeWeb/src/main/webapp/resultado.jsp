<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@page import="datatypes.DtVideo"%>
<%@page import="datatypes.DtUsuario"%>
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

<link href="css/created/indexLayout.css" rel="stylesheet" type="text/css">

<script src="js/bootstrap-datepicker.js" charset="utf-8"></script>
<link rel="stylesheet" href="css/bootstrap-datepicker.css">

</head>


<body>
	<!-- Barra Principal -->
	<div class="container" id="navBarPrincipal">
		<jsp:include page="nav.jsp" />
	</div>
	<!-- Resto de la pag -->
	<%
	String login = (String) session.getAttribute("login");
	String username = (String) session.getAttribute("nickname");
		if (username != null && username.length() > 0) {
	%>
	<div class="alert alert-primary alert-dismissible fade show"
		role="alert">
		Te logueaste exitosamente!
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<%
		} else if (login != null && login.length() > 0) {
	%>
	<div class="alert alert-primary alert-dismissible fade show"
		role="alert">
		Hubo un problema en el inicio de sesión, verifica los datos
		ingresados.
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<%
		}
	%>
	<h2>${mensaje}</h2>
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-xs-6 col-sm-4 col-lg-2 sidenav" id="sideBar">
				<ul class="list-unstyled components">
					<li><a href="#homeSubmenu" data-toggle="collapse"
						aria-expanded="false" class="dropdown-toggle">Videos</a>
						<ul class="collapse list-unstyled" id="homeSubmenu">
							<form action="AltaVideo" method="get">
								<!--<li><a href="altaVideo.jsp">Añadir Video</a></li>-->
								<button type="submit" value="Submit" class="btn-link">Alta Video</button>
							</form>
							<%if (username != null && username.length() > 0){ %>
							<form action="ModificarDatosVideo" method="get">
								<li><a href="ModificarDatosVideo">Modificar Video</a></li>
							</form>
							<%}; %>
							<li><a href="consultarVideo.jsp">Consultar Video</a></li>
							<li><a href="#">Comentar un Video</a></li>
							<li><a href="#">Valorar Video</a></li>
						</ul></li>
					<li><a href="#pageSubmenu" data-toggle="collapse"
						aria-expanded="false" class="dropdown-toggle">Listas de
							reproduccion</a>
						<ul class="collapse list-unstyled" id="pageSubmenu">
							<form action="AltaLista" method="get">								
								<li><a href="AltaLista">Crear Lista de Reproduccion
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
			<div class="md-form mt-0">
				<%
				if(request.getAttribute("videos") != null){
					ArrayList<DtVideo> videos = (ArrayList<DtVideo>) request.getAttribute("videos");
					String url;
					String img;
					String nombrevid;
					String descripcionvid;
					for(DtVideo dtvideo : videos){
						url = "https://www.youtube.com/embed/"+dtvideo.getUrl();
						img = "https://i.ytimg.com/vi/" + dtvideo.getUrl() +"/default.jpg";
						nombrevid = dtvideo.getNombre();
						descripcionvid = dtvideo.getDescripcion();
						System.out.println(img +" = "+ url);
					%>
					<div class="row">
						<div class=" container col-xs-12 col-sm-4">
							<a href="consultarVideo.jsp">
								<img class="hover"src="<%=img%>">	
							</a>
						</div>
						<div class="container col-xs-12 col-sm-8">
							<h3><%=nombrevid%></h3>
							<h4><%=descripcionvid%></h4>
						</div>
					</div>
				<%}
				}else{
				%>	
					<h3>Sin Resultado...</h3>
					
				<%}; %>
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