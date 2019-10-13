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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="js/bootstrap-datepicker.js" charset="utf-8"></script>
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<title>Consulta de categoria</title>
</head>
<body>
	<div class="container" id="navBarPrincipal">
		<jsp:include page="nav.jsp" />
	</div>
	<div class="container-fluid text-center">
		<div class="row content">
			<!-- Logica del consulta lista -->

			<div class="col-xs-12 col-xs-offset-12 row mx-auto">
				<h2>Listas</h2>
				<form id="Consulta Lista" action="ConsultaLista" method="GET"
					class="table table-striped table-bordered">
					<table class="table table-striped table-bordered">
						<thead>
							<th scope="col">Propietario</th>
							<th scope="col">Nombre</th>
						</thead>
						<tbody>
							<%
								Map<String, String> videos = (Map<String, String>) request.getAttribute("videos");
								Map<String, String> listas = (Map<String, String>) request.getAttribute("listas");
								if (listas.entrySet() != null) {
									for (Entry<String, String> entry : listas.entrySet()) {
							%>
							<tr>
								<td><%=entry.getValue()%></td>
								<%
									String idLista = entry.getKey().split(";")[0];
											String nombreLista = entry.getKey().split(";")[1];
								%>
								<td><%=nombreLista%></td>
								<td>
									<form action="ConsultaLista" method="GET">
										<button type="button" class="btn" onclick="consultaLista(<%=idLista%>)">
											<i class="fa fa-search"></i>
										</button>
									</form>
								</td>
							</tr>
							<%
								}
								}
							%>
						</tbody>
					</table>
					<input id="IDLISTA" name="IDLISTA" hidden>
				</form>

				<h2>Videos</h2>
				<table class="table table-striped table-bordered">
					<thead>
						<th scope="col">Propietario</th>
						<th scope="col">Nombre</th>
					</thead>
					<tbody>
						<%
							if (videos.entrySet() != null) {
								for (Entry<String, String> entry : videos.entrySet()) {
						%>
						<tr>
							<td><%=entry.getValue()%></td>
							<%
								String idVideo = entry.getKey().split(";")[0];
										String nombreVideo = entry.getKey().split(";")[1];
							%>
							<td><a href="ConsultaVideo?id=<%=idVideo%>"><%=nombreVideo%></a></td>
						</tr>
						<%
							}
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