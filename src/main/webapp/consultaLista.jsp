<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="WS.DtLista"%>
<%@ page import="WS.DtVideo"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.Map.Entry"%>
<!DOCTYPE html>
<html>
<head>
<script src="libs/jquery-3.4.1.min.js" charset="utf-8"></script>


<!-- CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">

<link href="css/created/indexLayout.css" rel="stylesheet"
	type="text/css">

<script src="js/bootstrap-datepicker.js" charset="utf-8"></script>
<link rel="stylesheet" href="css/bootstrap-datepicker.css">

<meta charset="ISO-8859-1">
<title>Datos de Lista</title>
</head>
<body>
	<div class="container-fluid" id="navBarPrincipal">
		<jsp:include page="nav.jsp" />
	</div>

	<!-- Resto de la pag -->
	<%
		String login = (String) session.getAttribute("login");
		String username = (String) session.getAttribute("nickname");
	%>
	<%
		DtLista datosLista = (DtLista) request.getAttribute("datosLista");
	%>
	<div class="container">
		<div class="row">


			<div class="modal fade" id="agregarVideo" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Agregar video</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form id="Agregar Video" action="AgregarVideoLista" method="post">
							<div class="modal-body mx-auto">

								<input type="text" name="IDVIDEO" class="form-control-group"
									id="IDVIDEO" hidden> <input type="text"
									name="TEXTVIDEO" class="form-control-group" id="TEXTVIDEO"
									hidden> <input type="text" name="nombreLista" hidden
									value="<%=datosLista.getNombre()%>">
								<div class="form-group row ">
									<div class="input-group-prepend">
										<label class="input-group-text" for="inputGroupSelect01">Mis
											Videos Privados</label>
									</div>
									<select
										class="custom-select form-control col-xs-4 col-sm-4 col-md-4"
										id="vidPrivado" name="vidPrivado">
										<option selected>Elegir...</option>
										<%
											HashMap<Integer, String> videosPrivados = (HashMap<Integer, String>) request.getAttribute("videosPrivados");
											if (videosPrivados != null && videosPrivados.size() > 0) {
												for (Entry<Integer, String> entry : videosPrivados.entrySet()) {
										%>
										<option value="<%=entry.getKey()%>"><%=entry.getValue()%></option>
										<%
											}
											}
										%>
									</select>
									<div class="input-group-prepend">
										<label class="input-group-text" for="inputGroupSelect01">Todos
											los videos publicos disponibles</label>
									</div>
									<select
										class="custom-select form-control col-xs-4 col-sm-4 col-md-4"
										id="vidPublico" name="vidPublico">
										<option selected>Elegir...</option>
										<%
											HashMap<Integer, String> videosPublicos = (HashMap<Integer, String>) session.getAttribute("videosPublicos");
											if (videosPublicos != null && videosPublicos.size() > 0) {
												for (Entry<Integer, String> entry : videosPublicos.entrySet()) {
										%>
										<option value="<%=entry.getKey()%>"><%=entry.getValue()%></option>
										<%
											}
											}
										%>
									</select>
								</div>
								<div class="text-center mt-2"></div>
							</div>
							<div class="modal-footer-center">
								<button id="submitAdd" type="button" onclick="agregarVideo()"
									class="btn btn-info">
									Agregar video <i class="fas fa-sign-in ml-1"></i>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>


			<form class="col-sm-9 col-md-6 mx-auto">
				<div class="container">

					<div class="form-grup row col-7 mb-3">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">Nombre de lista</span>
							</div>
							<input type="text" value="<%=datosLista.getNombre()%>" readonly
								aria-label="First name" class="form-control">
						</div>
					</div>

					<div class="form-grup row col-7 mb-3">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">Tipo de lista</span>
							</div>
							<input type="text"
								value="<%=datosLista.isDefecto() ? "Defecto" : "Particular"%>"
								readonly aria-label="First name" class="form-control">
						</div>
					</div>
					<div class="form-grup row col-7 mb-3">
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input"
								checked="<%=datosLista.isPrivado()%>" disabled id="customCheck1">
							<label class="custom-control-label" disabled for="customCheck1">Privado?</label>
						</div>
					</div>
					<%
						if (datosLista.getCategoria() != null) {
					%>
					<div class="form-group row" style="margin-left:16px">
						<div class="form-group row">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon3">Categoria</span>
							</div>
							<input type="text" readonly class="form-control-plaintext-group"
								id="nombreCategoria" value="<%=datosLista.getCategoria()%>">
							<i class="fas fa-tags" style="text-align: Center"></i>
						</div>
					</div>
					<%
						}
					%>

					<%
						String duenio = (String) request.getAttribute("Propietario");
					%>
					<div class="form-group row  ">

						<div class="form-group">
							<%
								if (duenio != null && duenio.equals("Propietario")) {
							%>
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#agregarVideo">
								Agregar video a lista<i class="fas fa-plus-circle px-md-2"></i>
							</button>
							<%
								}
							%>
						</div>

						<%
							DtVideo[] videos = (DtVideo[]) request.getAttribute("videos");
							if (videos != null && videos.length > 0) {
						%>
						<div class="container">
							<ul class="list-group px-md-5">
								<%
									String img = null;
										for (DtVideo vid : videos) {
											img = "https://i.ytimg.com/vi/" + vid.getUrl() + "/default.jpg";
								%>
								<%
									if (vid.getPrivado() && duenio != null && duenio.equals("Propietario")) {
								%>
								<li
									class="list-group-item d-flex justify-content-between align-items-center">
									<img class="hover" src="<%=img%>"> <a href="ConsultarVideo?id=<%=vid.getId()%>"><%=vid.getNombre()%></a>
									<button type="button" class="btn btn-danger"
										onclick="quitarVideo('<%=vid.getNombre()%>')">
										<i class="fas fa-minus-circle"></i>
									</button>
								</li>
								<%
									} else if (!vid.getPrivado()) {
								%>
								<li
									class="list-group-item d-flex justify-content-between align-items-center">
									<img class="hover" src="<%=img%>"><a href="ConsultarVideo?id=<%=vid.getId()%>"> <%=vid.getNombre()%></a> 
									<%
 	if (duenio != null && duenio.equals("Propietario")) {
 %>
									<button type="button" class="btn btn-danger"
										onclick="quitarVideo('<%=vid.getNombre()%>')">
										<%
											}
										%>
										<i class="fas fa-minus-circle"></i>
									</button>
								</li>
								<%
									}
										}
								%>
							</ul>
						</div>
					</div>
					<%
						}
					%>
				</div>
			</form>

			<div class="sidenav col-sm-3">
				<jsp:include page="listadoCategorias.jsp" />
			</div>
		</div>

	</div>
	<form id="Quitar Video Lista" action="QuitarVideoLista" method="post">
		<input type="text" name="VideoDeleteName" class="form-control-group"
			id="VideoDeleteName" hidden> <input type="text"
			name="listaSelected" hidden value="<%=datosLista.getNombre()%>">
	</form>
	<script type="text/javascript">
		$("#vidPrivado").change(function() {
			var vid = document.getElementById("vidPrivado").value;
			if (vid != "Elegir...") {
				$("#vidPublico").prop('disabled', true);
			} else {
				$("#vidPublico").prop('disabled', false);
			}
		});
		$("#vidPublico").change(function() {
			var vid = document.getElementById("vidPublico").value;
			if (vid != "Elegir...") {
				$("#vidPrivado").prop('disabled', true);
			} else {
				$("#vidPrivado").prop('disabled', false);
			}
		});
		function agregarVideo() {
			var id = document.getElementById("vidPrivado").value;
			var text = $('#vidPrivado').find(":selected").text();
			if (id == 0 || id == undefined || id == "Elegir...") {
				id = document.getElementById("vidPublico").value;
				text = $('#vidPublico').find(":selected").text();
			}
			document.getElementById("IDVIDEO").value = id;
			document.getElementById("TEXTVIDEO").value = text;
			document.getElementById("Agregar Video").submit();
		};
		function quitarVideo(nameVideo) {
			document.getElementById("VideoDeleteName").value = nameVideo;
			document.getElementById("Quitar Video Lista").submit();
		};
	</script>

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