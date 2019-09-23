<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UyTube</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	<link href="/css/created/indexLayout.css" rel="stylesheet" type="text/css">
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
		<div class="md-form mt-0" style="margin-left: 360px">
			<button type="button" class="btn btn-primary">Login</button>
		</div>
		</nav>
	</div>
	<!-- Resto de la pag -->
	<div class="container">
		<div class="body row">		
					<iframe class="col-xs-12 col-sd-6" width="560" height="315" src="https://www.youtube.com/embed/xEqSOst1dg8" frameborder="0" allowfullscreen></iframe>
<!-- 					<div class="col-xs-12 col-sd-3 col-md-3" id="espacio"> -->
<!-- 					</div> -->
					<div class="col-xs-12 col-sd-6 col-md-6 " id="sideBar" >
						<ul class="list-unstyled components">
							<li><a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Videos</a>
								<ul class="collapse list-unstyled" id="homeSubmenu">
									<li><a href="#">Añadir Video</a></li>
									<li><a href="#">Modificar Video</a></li>
									<li><a href="#">Consultar Video</a></li>
									<li><a href="#">Comentar un Video</a></li>
									<li><a href="#">Valorar Video</a></li>
								</ul>
							</li>
							<li>
								<a href="#pageSubmenu"  data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Listas de reproduccion</a>
								<ul class="collapse list-unstyled" id="pageSubmenu">
									<li><a href="#">Crear Lista de Reproduccion Particular</a></li>
									<li><a href="#">Modificar Lista de Reproduccion</a></li>
									<li><a href="#">Agregar Video a Lista de Reproduccion</a></li>
									<li><a href="#">Quitar Video de Lista de Reproduccion</a></li>
									<li><a href="#">Consulta de Lista de Reproduccion</a></li>
								</ul>
							</li>
							<li>
								<a href="#categoria"  data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Categorias</a>
								<ul class="collapse list-unstyled" id="categoria">
									<li><a href="altaCategoria.jsp">Crear Categoria</a></li>
									<li><a href="#">Listar Categorias</a></li>
								</ul>
							</li>
						</ul>
					</div>
		</div>
	</div>
		
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
