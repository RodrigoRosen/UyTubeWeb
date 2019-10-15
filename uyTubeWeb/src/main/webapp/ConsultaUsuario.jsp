<%@page import="datatypes.DtCanal"%>
<%@page import="datatypes.DtUsuario"%>
<%@page import="datatypes.DtVideo"%>
<%@page import="datatypes.DtLista"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.*"%>
<%@ page import="java.util.Map.Entry"%>
<%@page import="java.util.ArrayList"%>

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
	crossorigin="anonymous" />

<script src="js/bootstrap-datepicker.js" charset="utf-8"></script>
<link rel="stylesheet" href="css/bootstrap-datepicker.css">


<title>UyTube | Perfil</title>

</head>
<body>
	<!-- Barra Principal -->
	<div class="container-fluid" id="navBarPrincipal">
		<jsp:include page="nav.jsp" />
	</div>
	<%
		String login = (String) session.getAttribute("login");
		String user = (String) session.getAttribute("nickname");

		DtUsuario usr = (DtUsuario) request.getAttribute("Usuario");
		DtCanal cnl = (DtCanal) request.getAttribute("Canal");
		
		ArrayList<String> seguidores = (ArrayList<String>) request.getAttribute("seguidores");
		ArrayList<String> seguidos = (ArrayList<String>) request.getAttribute("seguidos");
	%>

	<h1 class="container">Perfil</h1>
	<%
		if (user != null && usr != null && usr.getNickname().equals(user)) {
	%>
	<div class="container">
		<form action="ModificarUsuario" method="get">
			<button type="submit">Editar</button>
		</form>
	</div>
	<%
		} else if (usr != null && user != null && !usr.getNickname().equals(user)) {
	%>
	<div class="container">
		<% boolean soySeguidor = false;
		   int i = 0;
		   for (String seg : seguidores){
			   if (seg.equals(user)) soySeguidor = true;
		   }
		   if (soySeguidor) {%>
		   <form action="DejarSeguir" method="post">
		     <input type="text" name="user" value="<%=usr.getNickname()%>" hidden>
			 <button type="submit">Dejar de seguir</button>
			 </form> 
		   <%} else { %>
		   <form action="SeguirUsuario" method="post">
		     <input type="text" name="user" value="<%=usr.getNickname()%>" hidden>
		   	 <button type="submit">Seguir</button>			   
		   </form>
		  <%}%>
	</div>
	<%}%>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-9">
				<form>

					<div class="container">
						<div class="container">
							<div class="form-group row">
								<h3>
									Imagen de Usuario
									</h2>
							</div>
						</div>

						<div class="form-grup row col-7 mb-3">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">Nickname</span>
								</div>
								<input type="text" value="<%=usr.getNickname()%>" readonly
									aria-label="First name" class="form-control">
							</div>
						</div>
						<div class="form-grup row col-7 mb-3">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">Email</span>
								</div>
								<input type="text" value="<%=usr.getEmail()%>" readonly
									aria-label="First name" class="form-control">
							</div>
						</div>
						<div class="form-grup row col-7 mb-3">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">Nombre</span>
								</div>
								<input type="text" value="<%=usr.getNombre()%>" readonly
									aria-label="First name" class="form-control">
							</div>
						</div>
						<div class="form-grup row col-7 mb-3">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">Apellido</span>
								</div>
								<input type="text" value="<%=usr.getApellido()%>" readonly
									aria-label="First name" class="form-control">
							</div>
						</div>
						<div class="form-grup row col-7 mb-3">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">Fecha de nacimiento</span>
								</div>
								<input type="text" value="<%=usr.getFechaNac()%>" readonly
									aria-label="First name" class="form-control">
							</div>
						</div>

						<div class="form-grup row col-7 mb-3">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">Nombre del canal</span>
								</div>
								<input type="text"
									value="<%=cnl.getNombre() == null ? "" : cnl.getNombre()%>"
									readonly aria-label="First name" class="form-control">
							</div>
						</div>

						<div class="form-grup row col-7 mb-3">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">Descripcion</span>
								</div>
								<textarea readonly aria-label="First name" class="form-control">
					<%=cnl.getDescripcion()%>
					</textarea>
							</div>
						</div>
						<div class="form-grup row col-7 mb-3">
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									checked="<%=cnl.isPrivado()%>" disabled id="customCheck1">
								<label class="custom-control-label" disabled for="customCheck1">Privado?</label>
							</div>
						</div>
						<%
							int num_seguidores = (int) request.getAttribute("num_seguidores");
							int num_seguidos = (int) request.getAttribute("num_seguidos");							
						%>
						<div class="form-grup row mb-3">
							<div class="input-group row col-2">
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<button class="btn btn-outline-secondary dropdown-toggle"
											type="button" data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false">Seguidores</button>
										<div class="dropdown-menu">
											<%
												if (seguidores != null) {
													for (String seguidor : seguidores) {
											%>
											<a class="dropdown-item"
												href="ConsultaUsuario?nickname=<%=seguidor%>"><%=seguidor%></a>
											<%
												}
											%>
											<%
												}
											%>
										</div>
									</div>
									<input readonly aria-label="First name" class="form-control"
										value="<%=num_seguidores%>">
								</div>

							</div>

							<div class="input-group row col-2">
								<div class="input-group-prepend mb-3">
									<button class="btn btn-outline-secondary dropdown-toggle"
										type="button" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">Seguidos</button>
									<div class="dropdown-menu">
										<%
											if (seguidos != null) {
												for (String seguido : seguidos) {
										%>
										<a class="dropdown-item"
											href="ConsultaUsuario?nickname=<%=seguido%>"><%=seguido%></a>
										<%
											}
										%>
										<%
											}
										%>
									</div>
								</div>
								<input readonly aria-label="First name"
									class="form-control mb-3" value="<%=num_seguidos%>">
							</div>
						</div>

						<ul class="nav nav-tabs">
							<li class="nav-item"><a href="#videos"
								class="nav-link active" role="tab" data-toggle="tab">Videos</a></li>
							<li class="nav-item"><a href="#listas" class="nav-link"
								role="tab" data-toggle="tab">Listas</a></li>
						</ul>


						<div class="tab-content col-7">

							<div role="tabpanel" class="tab-pane active" id="videos"
								name="videos">
								<%
									Map<Integer, DtVideo> videos = (Map<Integer, DtVideo>) request.getAttribute("videos");
								%>
								<table class="table table-striped table-bordered">
									<thead>
										<tr>
											<th scope="col">Videos</th>
										</tr>
									</thead>

									<%
										if (videos != null) {
									%>
									<%
										for (DtVideo dtvid : videos.values()) {
									%>
									<tr>
										<td><a href="ConsultarVideo?id=<%=dtvid.getId()%>"><%=dtvid.getNombre()%></a></td>
									</tr>


									<%
										}
										}
									%>

								</table>

							</div>

							<div role="tabpanel" class="tab-pane" id="listas" name="listas">
								<table class="table table-striped table-bordered">
									<thead>
										<tr>
											<th scope="col">Lista</th>
										</tr>
									</thead>
									<tbody>
										<%
											Map<Integer, DtLista> listas = (Map<Integer, DtLista>) request.getAttribute("listas");
										%>
										<%
											if (listas != null) {
												for (DtLista dtlis : listas.values()) {
										%>
										<tr>
											<td><a href="ConsultaLista?IDLISTA=<%=dtlis.getId()%>">
													<%=dtlis.getNombre()%>
											</a></td>
										</tr>
										<%
											}
											}
										%>
									</tbody>

								</table>
							</div>
						</div>

					</div>

				</form>
			</div>
			
			<div class="col-md-auto">
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
