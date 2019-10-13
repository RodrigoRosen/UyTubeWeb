<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@page import="datatypes.DtVideo"%>
<%@page import="datatypes.DtUsuario"%>
<%@page import="datatypes.DtLista"%>
<%@page import="datatypes.DtCanal"%>
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
	<div class="container-fluid">
		<div class="col-xs-8">
					<br />
		
			<ul class="nav nav-tabs">
				<li class="nav-item">
					<a href="#videos" class="nav-link active" role="tab" data-toggle="tab">Videos</a>
				</li>
				<li class="nav-item">
					<a href="#listas" class="nav-link" role="tab" data-toggle="tab">Listas</a>
				</li>			
				<li class="nav-item">
					<a href="#canales" class="nav-link" role="tab" data-toggle="tab">Canales</a>
				</li>			
			</ul>
			
			<div class="tab-content col-xs-12 col-md-8">
<!-- 			TAB VIDEOS -->
				<div role="tabpanel" class="tab-pane active" id="videos" name="videos">
				<%
					if(request.getAttribute("videos") != null){%>
					<table class="table table-dark table-hover  table-responsive col-xs-8">
					  <thead>
					    <tr>
					      <th scope="col">#</th>
					      <th scope="col">Video</th>
					      <th scope="col">Nombre/Descripcion</th>
					      <th scope="col">Fecha de agregado</th>
					    </tr>
					  </thead>
					  <tbody>
						<%
							ArrayList<DtVideo> videos = (ArrayList<DtVideo>) request.getAttribute("videos");
							String url;
							String img;
							String nombrevid;
							String descripcionvid;
							Integer id;
							String agregado;
							Integer num = 0;
							for(DtVideo dtvideo : videos){
								url = "https://www.youtube.com/embed/"+dtvideo.getUrl();
								img = "https://i.ytimg.com/vi/" + dtvideo.getUrl() +"/default.jpg";
								nombrevid = dtvideo.getNombre();
								descripcionvid = dtvideo.getDescripcion();
								System.out.println(img +" = "+ url);
								id =dtvideo.getId();
								agregado = dtvideo.getFechaPub().toString();
								num+=1;
						%>
					    <tr>
					      <th scope="row"><%=num %></th>
					      <td><a href="ConsultarVideo?id=<%=id%>">
										<img class="hover"src="<%=img%>">	
									</a></td>
					      <td><%=nombrevid%> - <%=descripcionvid%></td>
					      <td><%=agregado %></td>
					      
					    </tr>
					    	<%}%>
					  </tbody>
					</table>
					<%}else{
					%>	
						<h3>Nada por aca...</h3>
						
					<%}; %>				
				
				</div>
				
<!-- 				TAB DE LISTAS	 -->
			
				<div role="tabpanel" class="tab-pane" id="listas" name="listas">
				
				<%
					if(request.getAttribute("listas") != null){%>
						<table class="table table-dark table-hover table-responsive">
						  <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col">Lista</th>
						      <th scope="col">Categoria</th>
						    </tr>
						  </thead>
						  <tbody>	
						<%  
						ArrayList<DtLista> listas = (ArrayList<DtLista>) request.getAttribute("listas");
						String nombrelist;
						String categorialist;
						Integer id;
						Integer num = 0;
						for(DtLista dtlista : listas){
							nombrelist = dtlista.getNombre();
							categorialist = dtlista.getCategoria();
							id = dtlista.getId();
							num+=1;
						%>
						<tr>
							<th scope="col"><%=num %></th>
							<td><a href="ConsultaLista?IDLISTA=<%=id%>">
										<%=nombrelist%>
									</a></td>
							<td><%=categorialist%></td>
						</tr>
					<%}%>
				  </tbody>
					</table>	
					<%}else{
					%>	
						<h3>Nada por aca...</h3>
						
					<%}; %>
				
				</div>
				<div role="tabpanel" class="tab-pane" id="canales" name="canales">
<!-- 				TAB CANALES -->
				<%
					if(request.getAttribute("canales") != null){%>
						<table class="table table-dark table-hover table-responsive ">
						  <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col">Canal</th>
						      <th scope="col">Propietario</th>
						    </tr>
						  </thead>
						   <tbody>
						<%
						ArrayList<DtCanal> canales = (ArrayList<DtCanal>) request.getAttribute("canales");
						String nomCanal;
						String descCanal;
						String propietario;
						Integer num = 0;
						for(DtCanal dtcanal : canales){
							nomCanal = dtcanal.getNombre();
							descCanal = dtcanal.getDescripcion();
							propietario = dtcanal.getNick();
							num+=1;
						%>
						<tr>
							<th scope="col"><%=num %></th>
							<td><%=nomCanal%></td>
							<td><%=propietario%></td>
						</tr>
						
					<%}%>
					</tbody>
					</table>	
					<%}else{
					%>	
						<h3>Nada por aca...</h3>
						
					<%}; %>		
				
				
				</div>
		
			</div>

		</div>	
			<div class="col-sm-2">
				<jsp:include page="listadoCategorias.jsp" />
			</div>		
	</div>			




	

	<script src="js/app.js" charset="utf-8"></script>
	<script src="js/tab.js" charset="utf-8"></script>

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