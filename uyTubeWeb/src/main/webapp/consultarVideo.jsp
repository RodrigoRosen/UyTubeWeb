<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%> 
<%@ page import="java.util.Iterator"%> 
<%@ page import="java.text.DateFormat"%> 
<%@ page import="java.text.SimpleDateFormat"%> 
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.Map.Entry"%>
<%@ page import="java.util.Date"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="interfaces.Fabrica"%> 
<%@ page import="interfaces.IControlador"%>
<%@ page import="datatypes.DtVideo"%>
<%@ page import="datatypes.DtComentario"%>
<% 
	HttpSession se = request.getSession();
	String login = (String) session.getAttribute("login");
	String user = (String) se.getAttribute("nickname");
	IControlador icon = Fabrica.getInstancia().getIControlador();

	DtVideo v = null;
	String fecha="Fecha";
	String duracion="Duracion";
	String likes = " 0 me gusta,\t0 no me gusta";
	boolean propio=false;
	int g= 0; // no hay valoraciones del usuario para el video	
	
	if(request.getAttribute("video") != null){	
		v = (DtVideo)request.getAttribute("video");
		if(login != null){
			propio = Boolean.TRUE.equals(request.getAttribute("propio"));
			g = (Integer)request.getAttribute("gustar");			
		}
		if( (!v.getPrivado() )||(propio) ){ //el video es publico o es del usuario logueado
			DateFormat dateFormat = new SimpleDateFormat("dd/mm/yyyy"); 
			fecha = dateFormat.format(v.getFechaPub());
			duracion = v.getDuracion().toString(); 
			likes = v.getValoracionesPositivas().size()+" me gusta,\t"+v.getValoracionesNegativas().size()+" no me gusta";
		}
	}else{		
		v = new DtVideo(-1,"Nombre",true,null,"Descripcion",null,"categoria",null,"/url");
		v.setCom(new ArrayList<DtComentario>());
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">		
		<script src="libs/jquery-3.4.1.min.js" charset="utf-8"></script>
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>			
		<script src="js/bootstrap-datepicker.js" charset="utf-8"></script>
		<link rel="stylesheet" href="css/bootstrap-datepicker.css">	
		
		<script>
			function editar(bool){
				if(bool){
					document.getElementById("botones").style.display = "none";
					document.getElementById("valorar").style.display = "inline";
				} else {
					document.getElementById("botones").style.display = "inline";
					document.getElementById("valorar").style.display = "none";	
				}
			}
		</script>			
			
		<title>uyTube | Consultar Video</title>
	
	</head>	
	<body>		
		<!-- Barra Principal -->
		<div class="container" id="navBarPrincipal">
		<jsp:include page="nav.jsp" />
	</div>
		<!-- Resto de la pag -->
		<h1 style="text-align:center !important">Consultar Video</h1>
		<!--datosVideo -->
		<form action="ModificarDatosVideo" method="get">				
			<div class="container">
				<div class="form-group row">
					<div class="col-xs-12 col-xs-offset-12 row mx-auto" style="width:560px !important" >
						<iframe class="col-xs-12" width="560" height="315" src="https://www.youtube.com/embed/<%=v.getUrl()%>" frameborder="0" allowfullscreen></iframe>
					</div>
				</div>	
				<div class="form-group row">
					<div class="col-xs-12 col-xs-offset-12 row mx-auto" style="width:560px !important">
						<label style="width:115px;padding-right:10px; padding-top:9px">Nombre:</label>
						<input type="text" name="nombre" class="form-control col-xs-12 col-sm-8 col-md-8" id="nombre" aria-describedby="emailHelp" placeholder="<%=v.getNombre()%>" disabled style="max-width:445px !important; min-width:445px !important">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-xs-12 col-xs-offset-12 row mx-auto" style="width:560px !important">
						<label style="width:115px;padding-right:10px; padding-top:9px">Descripcion:</label>
						<textarea class="form-control col-xs-12 col-sm-8 col-md-8" name="descripcion" disabled style="max-width:445px !important; min-width:445px !important" placeholder="<%=v.getDescripcion()%>"></textarea>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-xs-12 col-xs-offset-12 row mx-auto" style="width:560px !important">
						<label style="width:115px;padding-right:10px; padding-top:9px">Publicado:</label>
						<input type="text" name="fecha" class="form-control col-xs-12 col-sm-8 col-md-8" id="fecha" aria-describedby="emailHelp" placeholder="<%=fecha%>" disabled style="max-width:445px !important; min-width:445px !important">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-xs-12 col-xs-offset-12 row mx-auto" style="width:560px !important">
						<label style="width:115px;padding-right:10px; padding-top:9px">Duracion:</label>
						<input type="text" name="duracion" class="form-control col-xs-12 col-sm-8 col-md-8" id="duracion" aria-describedby="emailHelp" placeholder="<%=duracion%>" disabled style="max-width:445px !important; min-width:445px !important">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-xs-12 col-xs-offset-12 row mx-auto" style="width:560px !important">
						<label style="width:115px;padding-right:10px; padding-top:9px">URL:</label>
						<input type="text" name="url" class="form-control col-xs-12 col-sm-8 col-md-8" id="url" aria-describedby="emailHelp" placeholder="<%=v.getUrl()%>" disabled style="max-width:445px !important; min-width:445px !important">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-xs-12 col-xs-offset-12 row mx-auto" style="width:560px !important">
						<label style="width:115px;padding-right:10px; padding-top:9px">Categoria:</label>
						<input type="text" name="categoria" class="form-control col-xs-12 col-sm-8 col-md-8" id="categoria" aria-describedby="emailHelp" placeholder="<%=v.getCategoria()%>" disabled style="max-width:445px !important; min-width:445px !important">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-xs-12 col-xs-offset-12 row mx-auto" style="width:560px !important">
						<label style="width:115px;padding-right:10px; padding-top:9px">Es privado?</label>
						<select class="custom-select col-xs-12 col-sm-8 col-md-8" id="privado" name="privado"  disabled style="max-width:445px !important; min-width:445px !important">
							<option value="Si" <%if(v.getPrivado()){%> selected <%}%>>Si</option>
							<option value="No" <%if(!v.getPrivado()){%> selected <%}%>>No</option>
						</select>	
					</div>		
				</div>
				<div class="form-group row">
					<div class="col-xs-12 col-xs-offset-12 row mx-auto" style="width:560px !important">
						<label style="width:115px;padding-right:10px; padding-top:9px">Likes:</label>
					    <input type="text" name="likes" class="form-control col-xs-12 col-sm-8 col-md-8" id="likes" ria-describedby="emailHelp" placeholder="<%=likes%>" disabled style="max-width:445px !important; min-width:445px !important">	
					</div>
				</div>	
				<%if((propio)&&(!v.getPrivado())){%>
					<div class="form-group row">
						<div class="col-xs-12 col-xs-offset-12 row mx-auto" style="width:560px !important">
							<label style="width:115px;padding-right:10px; padding-top:9px">Le Gusta:</label>
							<select name="like" class="form-control col-xs-12 col-sm-8 col-md-8" id="like" style="max-width:445px !important; min-width:445px !important">
								<option  disabled="disabled" selected="selected">--Usuarios--</option>
								<%for(String s: v.getValoracionesPositivas()){%>
									<option value="<%=s%>"> <%=s%> </option>
								<%}%>												
							</select>
						</div>		
					</div>
					<div class="form-group row">
						<div class="col-xs-12 col-xs-offset-12 row mx-auto" style="width:560px !important">
							<label style="width:115px;padding-right:10px; padding-top:9px">No le Gusta:</label>
							<select name="dislike" class="form-control col-xs-12 col-sm-8 col-md-8" id="dislike" style="max-width:445px !important; min-width:445px !important">
								<option  disabled="disabled" selected="selected">--Usuarios--</option>
								<%for(String s: v.getValoracionesNegativas()){%>
									<option value="<%=s%>"><%=s%></option>
								<%}%>												
							</select>
						</div>		
					</div>
				<%}%>					
				<%if((login != null)&&(v != null)){%>
					<!-- Botones otros CU -->
					<div class="form-group row" id="botones" name="botones">	
						<div class="col-xs-12 col-xs-offset-12 row mx-auto" style="width:560px !important">
							<%if((login != null)&&(!v.getPrivado())){%>
								<button type="button" id="btnValorar" class="btn btn-primary col-xs-12 col-sm-4 col-md-4" onclick="editar(true)" style="max-width:560px !important; min-width:560px !important">Valorar</button>							
							<%}%>
						</div>	
					</div>
				<%}%>
			</div>
		</form>
		<%if((login != null)&&(!v.getPrivado())){%>
			<!--valorarVideo -->
			<form action="ValorarVideo" method="post">		
				<div class="container" id="valorar" name="valorar" style="display:none">
					<div class="form-group row">					
						<div style="display:none"><input type="text" name="aux" id="aux" placeholder="<%=v.getId()%>" value="<%=v.getId()%>"></div>
						<div class="col-xs-12 col-xs-offset-12 row mx-auto" style="width:560px !important">
							<select name="likex" class="form-control col-xs-12 col-sm-8 col-md-8" id="likex"  style="max-width:445px !important; min-width:560px !important">
								<%if(g == 0){%><option  disabled="disabled" selected="selected">--Seleccionar Opcion--</option><%}%>
								<option value="1" <%if(g > 0){%>selected="selected"<%}%>>Me Gusta</option>
								<option value="-1" <%if(g < 0){%>selected="selected"<%}%>>No Me Gusta</option>														
							</select>
						</div>
					</div>
					<div class="form-group row">					
						<div class="col-xs-12 col-xs-offset-12 row mx-auto" style="width:560px !important">
							<button type="button" id="btnEsc" class="btn btn-primary col-xs-12 col-sm-4 col-md-4" onclick="editar(false)" style="max-width:49% !important; min-width:49% !important; margin-right:1% !important">Cancelar</button>
							<button type="submit" id="btnLike" class="btn btn-primary col-xs-12 col-sm-4 col-md-4" style="max-width:49% !important; min-width:49% !important; margin-left:1% !important">Aceptar</button>	
						</div>
					</div>	
				</div>
			</form>			
		<%}%>			
		<%if((login != null)&&(v != null)){%>
			<!-- comentarVideo -->	
			<form action="ComentarVideo" method="get">		
				<div class="container" style="width:560px !important">	
						<%for(DtComentario c: v.getCom()){%>
							<div style="padding-left:<%=c.getNivel()*20%>px;" class="form-group row"><p><%=c.getNick()+": "+c.getTexto()%></p><a href="ComentarVideo?v=<%=v.getId()+"&id="+c.getId()%>" style="margin-left:30px">Responder</a></div>
						<%}%>
					<div class="col-xs-12 col-xs-offset-12 row mx-auto" style="width:560px !important">
						<button type="submit" class="btn btn-primary col-xs-12 col-sm-4 col-md-4" name="v" value="<%=v.getId()%>" style="max-width:560px !important; min-width:560px !important;padding:6px 0 !important">Comentar</button>
					</div>
				</div>
			</form>
		<%}%>
		
		<script src="js/app.js" charset="utf-8"></script>	
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	</body>
</html>