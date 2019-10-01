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
			crossorigin="anonymous"/>
			
		<script src="js/bootstrap-datepicker.js" charset="utf-8"></script>
		<link rel="stylesheet" href="css/bootstrap-datepicker.css">	
			
			
		<title>UyTube | Perfil</title>
	
	</head>
<body>
		<!-- Barra Principal -->
		<div class="container" id="navBarPrincipal">
			<nav class="navbar navbar-expand-lg navbar-light bg-light"> <img
				src="imagenes/UyTube.png" class="img-fluid" height="50px"
				width="150px">
			<div class="md-form mt-0" style="margin-left: 40px">
				<input class="form-control col-xs-12 col-sm-8 col-md-8 " type="text" placeholder="Search"
					aria-label="Search" id="searchBarPrincipalId" style="width: 450px">
			</div>
			<div class="md-form mt-0" style="margin-left: 360px">
				<button type="button" class="btn btn-primary">Iniciar sesion</button>
			</div>
			</nav>
		</div>
		<!-- Resto de la pag -->
		<h1 class="container">Perfil</h1>
		<form action="ConsultaUsuario" method="post">
			<div class="container">
						<div class="form-group row">
							 <input type="text" name="nickname"
								class="form-control col-xs-12 col-sm-8 col-md-8" id="nickname"
								aria-describedby="emailHelp" placeholder="Usuario">
						</div>
						<div class="form-group row">
							 <input type="text" name="email"
								class="form-control col-xs-12 col-sm-8 col-md-8" id="email"
								aria-describedby="emailHelp" placeholder=Email">
						</div>
						<div class="form-group row">
							 <input type="text" name="nombre"
								class="form-control col-xs-12 col-sm-8 col-md-8" id="nombre"
								aria-describedby="emailHelp" placeholder="Nombre">
						</div>
						<div class="form-group row">
							 <input type="text" name="apellido"
								class="form-control col-xs-12 col-sm-8 col-md-8" id="apellido"
								aria-describedby="emailHelp" placeholder="Apellido">
						</div>

						<div class="form-group row">
							 <input type="password" name="contrasena"
								class="form-control col-xs-12 col-sm-8 col-md-8" id="contrasena"
								aria-describedby="emailHelp" placeholder="Contrasena">
						</div>
						
						<div class="form-group row">
							 <input type="password" name="confcontrasena"
								class="form-control col-xs-12 col-sm-8 col-md-8" id="confcontrasena"
								aria-describedby="emailHelp" placeholder="Confirmar contrasena">
						</div>
						
						
						<div class="form-group row">
							<div class="input-group date sg-fecha">
							      <input type="text" class="form-control col-xs-12 col-sm-8 col-md-8 " id="fechaNacimiento" placeholder="Fecha de nacimiento"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
						    </div>	  
						</div>
						
<!-- 						<div class="form-group row ">						 -->
<!-- 							<div class="input-group mb-3 col-xs-12 col-sm-8 col-md-8 "> -->
<!-- 							  <div class="input-group-prepend"> -->
<!-- 							    <span class="input-group-text " id="inputGroupFileAddon01">Upload</span> -->
<!-- 							  </div> -->
<!-- 							  <div class="custom-file"> -->
<!-- 							    <input type="file" class="custom-file-input " id="inputGroupFile01" aria-describedby="inputGroupFileAddon01"> -->
<!-- 							    <label class="custom-file-label" for="inputGroupFile01">Choose file</label> -->
<!-- 							  </div> -->
<!-- 							</div> -->
<!-- 						</div> -->

						
						<div class="form-group row">
					        <input id="img" name="img" type="file" class="file" data-browse-on-zone-click="true">
					        <img src="#" class="rounded float-left" alt="...">  <!-- INGRESAR LA IMG -->
						</div>

						<div class="form-group row">
							 <input type="text" name="canal"
								class="form-control col-xs-12 col-sm-8 col-md-8" id="canal"
								aria-describedby="emailHelp" placeholder="Canal">
						</div>

						<div class="form-group row">
							 <input type="text" name="descripcion"
								class="form-control col-xs-12 col-sm-8 col-md-8" id="descripcion"
								aria-describedby="emailHelp" placeholder="Descripcion">
						</div>
						
						<div class="form-group row">
							 <input type="text" name="privado"
								class="form-control col-xs-12 col-sm-8 col-md-8" id="privado"
								aria-describedby="emailHelp" placeholder="Es privado?">
						</div>						

						<div class="form-group row">
							<button type="submit" id="btnAceptar" class="btn btn-primary col-xs-12 col-sm-4 col-md-4">Aceptar</button>
							<button type="submit" id="btnAceptar" class="btn btn-secundary col-xs-12 col-sm-4 col-md-4">Modificar</button>
						</div>
						



			</div>
		</form>
		
<!--  		<script> --> 
<!-- 		    $(document).on('ready', function() { -->
<!-- 	        $("#input-b5").fileinput({showCaption: true, dropZoneEnabled: true}); -->
<!-- 		    }); -->
<!-- 	    </script> --> 
		
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
