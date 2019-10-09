<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%> 
<%@ page import="java.util.Iterator"%> 
<%@ page import="java.text.DateFormat"%> 
<%@ page import="java.text.SimpleDateFormat"%> 
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.Map.Entry"%>
<%@ page import="java.util.Date"%>
<%@ page import="javax.swing.JTree"%>
<%@ page import="javax.xml.soap.Node"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="interfaces.Fabrica"%> 
<%@ page import="interfaces.IControlador"%>
<%@ page import="datatypes.DtVideo"%>
<% 
	HttpSession se = request.getSession();
	String login = (String) session.getAttribute("login");
	String user = (String) se.getAttribute("nickname");
	IControlador icon = Fabrica.getInstancia().getIControlador();
	DtVideo v = null;
	String nombre="Nombre";
	String duracion="Duracion";
	String fecha="Fecha";
	String url="/url";
	String cat="categoria";
	Node root = null;
	String desc="Descripcion";
	String likes = " 0 me gusta,\t0 no me gusta";
	boolean privado=true;
	boolean propio=false;
	HashMap<Integer,String> videos = icon.listarVideosPublicos();
	HashMap<Integer,String> privados = new HashMap<Integer,String>();
	if(login != null){
		privados = icon.listarVideosPrivados(user);
	}
	if(request.getAttribute("video")!= null){
		int id = (Integer)request.getAttribute("video");		
		if((videos.get(id) != null)||(login != null && privados.get(id) != null)){ //el video es publico o es del usuario logueado
			v = icon.findVideo(id);
			nombre = v.getNombre();
			duracion = v.getDuracion().toString(); 
			url = v.getUrl();
			cat = v.getCategoria();
			DateFormat dateFormat = new SimpleDateFormat("dd/mm/yyyy"); 
			fecha = dateFormat.format(v.getFechaPub());
			desc = v.getDescripcion();
			if(v.getPrivado()){
				privado = true;
			}else{
				privado = false;
			}
			likes = v.getValoracionesPositivas().size()+" me gusta,\t"+v.getValoracionesNegativas().size()+" no me gusta";
			if(login != null){			
				icon.seleccionarUsuario(user);
				if(icon.seleccionarVideo(v.getNombre()) != null){
					propio = true;
					root = getTreeRootNode();
				}else{
					propio = false;					
				}
				icon.finCasoUso();
			}
		}
		//request.setAttribute("video", null);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
			
		<title>uyTube | Consultar Video</title>
	
	</head>	
	<body>
		<div style="display:none;"><input type="text" name="aux" id="aux"></div>
		
		<!-- Barra Principal -->
		<div class="container" id="navBarPrincipal">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<a href="index.jsp"> <img src="imagenes/UyTube.png" class="img-fluid" height="50px" width="150px"></a>
				<div class="md-form mt-0" style="margin-left: 40px">
					<input class="form-control col-xs-12 col-sm-8 col-md-8 " type="text" placeholder="Search" aria-label="Search" id="searchBarPrincipalId" style="width: 450px">
				</div>
				<div class="md-form mt-0" style="margin-left: 360px">
					<button type="button" class="btn btn-primary">Login</button>
				</div>
			</nav>
		</div>
		<!-- Resto de la pag -->
		<h1 class="container">Consultar Video</h1>
		<form action="ConsultarVideo" method="post">
			<div class="container">
				<div class="form-group row">
					<label style="width:115px;padding-right:10px; padding-top:9px">Publicos:</label>
					<select name="publicos" class="form-control col-xs-12 col-sm-8 col-md-8" id="publicos" onchange="this.form.submit()">
						<option  disabled="disabled" selected="selected">--Seleccionar Video--</option>
						<% 
						for(Integer i: videos.keySet()){
									%><option value="<%=i%>"><%=videos.get(i)%></option><%
						}%>								
					</select>			
				</div>
				<%if(login != null){%>
				<div class="form-group row">
					<label style="width:115px;padding-right:10px; padding-top:9px">Mis Privados:</label>
					<select name="privados" class="form-control col-xs-12 col-sm-8 col-md-8" id="privados" onchange="this.form.submit()">
						<option  disabled="disabled" selected="selected">--Seleccionar Video--</option>
						<% 
						for(Integer i: privados.keySet()){
									%><option value="<%=i%>"><%=privados.get(i)%></option><%
						}%>												
					</select>		
				</div>
				<%}%>	
			</div>
		</form><form action="ConsultarVideo" method="post">
			<div class="container">
			</div>
		</form>
		<form action="ConsultarVideo" method="post">
			<div class="container">
				<div class="form-group row">
					<label style="width:115px;padding-right:10px; padding-top:9px">Nombre:</label>
					<input type="text" name="nombre"
						class="form-control col-xs-12 col-sm-8 col-md-8" id="nombre"
						aria-describedby="emailHelp" placeholder="<%=nombre%>" disabled>
				</div>
				<div class="form-group row">
					<label style="width:115px;padding-right:10px; padding-top:9px">Descripcion:</label>
					 <input type="text" name="descripcion"
						class="form-control col-xs-12 col-sm-8 col-md-8" id="descripcion"
						aria-describedby="emailHelp" placeholder="<%=desc%>" disabled>
				</div>
				<div class="form-group row">
					<label style="width:115px;padding-right:10px; padding-top:9px">Publicado:</label>
					 <input type="text" name="fecha"
						class="form-control col-xs-12 col-sm-8 col-md-8" id="fecha"
						aria-describedby="emailHelp" placeholder="<%=fecha%>" disabled>
				</div>
				<div class="form-group row">
					<label style="width:115px;padding-right:10px; padding-top:9px">Duracion:</label>
					 <input type="text" name="duracion"
						class="form-control col-xs-12 col-sm-8 col-md-8" id="duracion"
						aria-describedby="emailHelp" placeholder="<%=duracion%>" disabled>
				</div>
				<div class="form-group row">
					<label style="width:115px;padding-right:10px; padding-top:9px">URL:</label>
					 <input type="text" name="url"
						class="form-control col-xs-12 col-sm-8 col-md-8" id="url"
						aria-describedby="emailHelp" placeholder="<%=url%>" disabled>
				</div>
				<div class="form-group row">
					<label style="width:115px;padding-right:10px; padding-top:9px">Categoria:</label>
					 <input type="text" name="categoria"
						class="form-control col-xs-12 col-sm-8 col-md-8" id="categoria"
						aria-describedby="emailHelp" placeholder="<%=cat%>" disabled>
				</div>
				<div class="form-group row">
					<label style="width:115px;padding-right:10px; padding-top:9px">Es privado?</label>
				  <select class="custom-select col-xs-12 col-sm-8 col-md-8" id="privado" name="privado"  disabled>
				    <option value="Si" <%if(privado){%> selected <%}%>>Si</option>
				    <option value="No" <%if(!privado){%> selected <%}%>>No</option>
				  </select>			
				</div>
				<div class="form-group row">
					<label style="width:115px;padding-right:10px; padding-top:9px">Likes:</label>
				    <input type="text" name="likes" class="form-control col-xs-12 col-sm-8 col-md-8" id="likes" ria-describedby="emailHelp" placeholder="<%=likes%>" disabled>	
				</div>	
				<%if(propio){%>
				<div class="form-group row">
					<label style="width:115px;padding-right:10px; padding-top:9px">Le Gusta:</label>
					<select name="like" class="form-control col-xs-12 col-sm-8 col-md-8" id="like">
						<option  disabled="disabled" selected="selected">--Usuarios--</option>
						<% 
						for(String s: v.getValoracionesPositivas()){
									%><option value="<%=s%>"><%=s%></option><%
						}%>												
					</select>		
				</div>
				<%}%>
				<%if(propio){%>
				<div class="form-group row">
					<label style="width:115px;padding-right:10px; padding-top:9px">No le Gusta:</label>
					<select name="dislike" class="form-control col-xs-12 col-sm-8 col-md-8" id="dislike">
						<option  disabled="disabled" selected="selected">--Usuarios--</option>
						<% 
						for(String s: v.getValoracionesNegativas()){
									%><option value="<%=s%>"><%=s%></option><%
						}%>												
					</select>		
				</div>
				<%}%>
				<%if(propio){%>
				<div class="form-group row">
					<c:forEach var="node" items="${node.children}">
					    <!-- TODO: print the node here -->
					    <c:set var="node" value="${node}" scope="request"/>
					    <jsp:include page="node.jsp"/>
					</c:forEach>		
				</div>
				<%}%>
				<div class="form-group row">
					<button type="submit" id="btnAceptar" class="btn btn-primary col-xs-12 col-sm-4 col-md-4">Aceptar</button>
				</div>
			</div>
		</form>
		
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