<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UyTube | Video</title>

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
		<div class="md-form mt-0" style="margin-left: 360px">
			<button type="button" id="btnModal" class="btn btn-primary">Entrar</button>
		</div>

		<!--Modal: Login / Register Form-->
		<div class="modal fade" id="modalFec" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
								
									<div class="md-form form-sm mb-5">
										<i class="fas fa-envelope prefix"></i> <input type="nickname"
											id="nickLogin" class="form-control form-control-sm validate">
										<label data-error="wrong" data-success="right"
											for="modalLRInput10">Usuario</label>
									</div>

									<div class="md-form form-sm mb-4">
										<i class="fas fa-lock prefix"></i> <input type="password"
											id="passLogin" class="form-control form-control-sm validate">
										<label data-error="wrong" data-success="right"
											for="modalLRInput11">Contrasena</label>
									</div>
									
									<div class="text-center mt-2">
										<button class="btn btn-info">
											Iniciar <i class="fas fa-sign-in ml-1"></i>
										</button>
									</div>
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
	
	<div class="container">
	<!-- Hay que mostrar todos los vídeos de una lista existente -->
		<li>David bowie - Heroes</li>
		<div class="body row">
			<iframe class="col-xs-12 col-sd-6" width="560" height="315"
				src="https://www.youtube.com/embed/xEqSOst1dg8" frameborder="0"
				allowfullscreen></iframe>
		</div>
		
		<div class="body row">		
			<li>41</li><button type="button" class="btn btn-info">Me gusta</button>
			<li>3</li><button type="button" class="btn btn-danger">No me gusta</button>
		</div>
		
		<div class="body row">		
			<marquee scrollamount="3" direction="up" behavior="scroll" width="80%" style="border:BLUE 3px SOLID">
				<div style="border:SKYBLUE 3px SOLID">	
					<p>Comentario 1</p>
					<div style="border:SKYBLUE 3px SOLID">	
						<p>SubComentario 1 </p>
					</div>
					<div style="border:SKYBLUE 3px SOLID">	
						<p>SubCometnario 2</p>
					</div>
				</div>
				<div style="border:SKYBLUE 3px SOLID">	
					<p>Comentario 2</p>
					<div style="border:SKYBLUE 3px SOLID">	
						<p>SubComentario 1 </p>
					</div>
					<div style="border:SKYBLUE 3px SOLID">	
						<p>SubCometnario 2</p>
					</div>
				</div>
			</marquee>
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
