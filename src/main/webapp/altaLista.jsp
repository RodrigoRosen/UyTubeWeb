<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
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
<title>uyTube | Nueva Lista</title>

</head>
<body>
	
	<div class="modal hide fade" id="myModal">
		<div class="modal-header">
			<a class="close" data-dismiss="modal">×</a>
			<h3>Modal header</h3>
		</div>
		<div class="modal-body">
			<p>One fine body…</p>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn">Close</a> <a href="#" class="btn btn-primary">Save
				changes</a>
		</div>
	</div>
	<div class="container" id="navBarPrincipal">
		<jsp:include page="nav.jsp" />
	</div>
	
	<% String mensaje = (String) request.getAttribute("mensaje");
		if (mensaje != null && mensaje.equals("Existe una lista con el nombre ingresado.")) { %>
	<div class="alert alert-danger alert-dismissible fade show"
		role="warning">
		Ya existe una lista con ese nombre.
		<button type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
 	<% } %>
	
	<h1 class="container">Datos de la lista</h1>
	<form action="AltaLista" method="post">
		<div class="container">
			<div class="form-group row">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">Nombre de
						lista</span>
				</div>
				<input type="text" name="nombreLista"
					class="form-control col-xs-8 col-sm-2 col-md-4" id="txtNombreLista" required="true">
			</div>
			<div class="form-group row">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">Privada?</span>
				</div>
				<input type="checkbox"
					style="width: 35px; height: 20px; margin-left: 20px; margin-top: 7px"
					name="privada" id="chkPrivada">
			</div>

			<div class="form-group row ">
				<div class="input-group-prepend">
					<label class="input-group-text" for="inputGroupSelect01">Categoria</label>
				</div>
				<select
					class="custom-select form-control col-xs-4 col-sm-4 col-md-4"
					id="idCategoryList" name="categoria">
					<option selected>Elegir...</option>
					<%
						String[] categorias = (String[]) request.getAttribute("categorias");
						if (categorias != null) {
							for (String cat : categorias) {
					%>
					<option value="<%=cat%>"><%=cat%></option>
					<%
						}
						}
					%>
				</select>
			</div>
			<div class="form-group row">
				<button type="submit" id="btnAceptar"
					class="btn btn-primary col-xs-2 col-sm-2 col-md-2 btn btn-info"
					value="submit">Crear Lista</button>
			</div>
		</div>

	</form>
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