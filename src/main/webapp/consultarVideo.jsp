<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%> 
<%@ page import="java.util.Iterator"%> 
<%@page import="WS.WebClient"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.Map.Entry"%>
<%@ page import="java.util.Date"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="WS.DtVideo"%>
<%@ page import="WS.DtComentario"%>
<% 
	HttpSession se = request.getSession();
	String login = (String) session.getAttribute("login");
	String user = (String) se.getAttribute("nickname");

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
			fecha = WebClient.getDate(v.getFechaPub());
			duracion = v.getDuracion().toString(); 
			likes = (v.getValoracionesPositivas()).length+" me gusta,\t"+(v.getValoracionesNegativas()).length+" no me gusta";
		}
	}else{		
		v = new DtVideo(-1,"Nombre",true,null,"Descripcion",null,"categoria",null,"/url",new DtComentario[3],null,null);
		//v.setCom(new ArrayList<DtComentario>());
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
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="css/consultarVideos.css">
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
		<script>
			function comentar(id){
				document.getElementById("id").value= id.toString();
				$('#id').val(id);
				document.getElementById("id").placeholder= id.toString();
			}
		</script>
			
		<title>uyTube | Consultar Video</title>
	
	</head>	
	<body>		
		<!-- Barra Principal -->
		<div class="container-fluid" id="navBarPrincipal">
		<jsp:include page="nav.jsp" />
	</div>
		<!-- Resto de la pag -->
		<h1>Consultar Video</h1>
		<!--datosVideo -->
		<form action="ModificarDatosVideo" method="get">				
			<div class="container">
				<div class="form-group row">
					<div class="col-xs-12 col-xs-offset-12 row mx-auto kontrol">
						<iframe class="col-xs-12" width="560" height="315" src="https://www.youtube.com/embed/<%=v.getUrl()%>" frameborder="0" allowfullscreen></iframe>
					</div>
				</div>	
				<div class="form-group row">
					<div class="col-xs-12 col-xs-offset-12 row mx-auto kontrol">
						<label class="label">Nombre:</label>
						<input type="text" name="nombre" class="form-control col-xs-12 col-sm-8 col-md-8 input" id="nombre" aria-describedby="emailHelp" placeholder="<%=v.getNombre()%>" disabled>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-xs-12 col-xs-offset-12 row mx-auto kontrol">
						<label class="label">Descripcion:</label>
						<textarea class="form-control col-xs-12 col-sm-8 col-md-8 input" name="descripcion" disabled placeholder="<%=v.getDescripcion()%>"></textarea>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-xs-12 col-xs-offset-12 row mx-auto kontrol">
						<label class="label">Publicado:</label>
						<input type="text" name="fecha" class="form-control col-xs-12 col-sm-8 col-md-8 input" id="fecha" aria-describedby="emailHelp" placeholder="<%=fecha%>" disabled>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-xs-12 col-xs-offset-12 row mx-auto kontrol">
						<label class="label">Duracion:</label>
						<input type="text" name="duracion" class="form-control col-xs-12 col-sm-8 col-md-8 input" id="duracion" aria-describedby="emailHelp" placeholder="<%=duracion%>" disabled>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-xs-12 col-xs-offset-12 row mx-auto kontrol">
						<label class="label">URL:</label>
						<input type="text" name="url" class="form-control col-xs-12 col-sm-8 col-md-8 input" id="url" aria-describedby="emailHelp" placeholder="<%=v.getUrl()%>" disabled>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-xs-12 col-xs-offset-12 row mx-auto kontrol">
						<label class="label">Categoria:</label>
						<input type="text" name="categoria" class="form-control col-xs-12 col-sm-8 col-md-8 input" id="categoria" aria-describedby="emailHelp" placeholder="<%=v.getCategoria()%>" disabled>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-xs-12 col-xs-offset-12 row mx-auto kontrol">
						<label class="label">Es privado?</label>
						<select class="custom-select col-xs-12 col-sm-8 col-md-8  input" id="privado" name="privado"  disabled>
							<option value="Si" <%if(v.getPrivado()){%> selected <%}%>>Si</option>
							<option value="No" <%if(!v.getPrivado()){%> selected <%}%>>No</option>
						</select>	
					</div>		
				</div>
				<div class="form-group row">
					<div class="col-xs-12 col-xs-offset-12 row mx-auto kontrol">
						<label class="label">Likes:</label>
					    <input type="text" name="likes" class="form-control col-xs-12 col-sm-8 col-md-8 input" id="likes" ria-describedby="emailHelp" placeholder="<%=likes%>" disabled>	
					</div>
				</div>	
				<%if((propio)&&(!v.getPrivado())){%>
					<div class="form-group row">
						<div class="col-xs-12 col-xs-offset-12 row mx-auto kontrol">
							<label class="label">Le Gusta:</label>
							<select name="like" class="form-control col-xs-12 col-sm-8 col-md-8 input" id="like">
								<option  disabled="disabled" selected="selected">--Usuarios--</option>
								<%for(String s: v.getValoracionesPositivas()){%>
									<option value="<%=s%>"> <%=s%> </option>
								<%}%>												
							</select>
						</div>		
					</div>
					<div class="form-group row">
						<div class="col-xs-12 col-xs-offset-12 row mx-auto kontrol">
							<label class="label">No le Gusta:</label>
							<select name="dislike" class="form-control col-xs-12 col-sm-8 col-md-8 input" id="dislike">
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
						<div class="col-xs-12 col-xs-offset-12 row mx-auto kontrol">
							<%if((login != null)&&(!v.getPrivado())){%>
								<button type="button" id="btnValorar" class="btn btn-primary col-xs-12 col-sm-4 col-md-4 kontrol" onclick="editar(true)">Valorar</button>							
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
						<div id="divVV"><input type="text" name="aux" id="aux" placeholder="<%=v.getId()%>" value="<%=v.getId()%>"></div>
						<div class="col-xs-12 col-xs-offset-12 row mx-auto kontrol">
							<select name="likex" class="form-control col-xs-12 col-sm-8 col-md-8 kontrol" id="likex">
								<%if(g == 0){%><option  disabled="disabled" selected="selected">--Seleccionar Opcion--</option><%}%>
								<option value="1" <%if(g > 0){%>selected="selected"<%}%>>Me Gusta</option>
								<option value="-1" <%if(g < 0){%>selected="selected"<%}%>>No Me Gusta</option>														
							</select>
						</div>
					</div>
					<div class="form-group row">					
						<div class="col-xs-12 col-xs-offset-12 row mx-auto kontrol">
							<button type="button" id="btnEsc" class="btn btn-primary col-xs-12 col-sm-4 col-md-4 button" onclick="editar(false)">Cancelar</button>
							<button type="submit" id="btnLike" class="btn btn-primary col-xs-12 col-sm-4 col-md-4 button">Aceptar</button>	
						</div>
					</div>	
				</div>
			</form>			
		<%}%>			
		<%if((v != null)&&(!v.getPrivado())){%>
			<!-- comentarVideo -->	
			<div class="chatContainer">
			    <div class="chatTitleContainer">Comments</div>
				<div class="chatHistoryContainer">
			        <ul class="formComments">
						<li class="commentLi commentstep-1" data-commentid="4">
							<%for(DtComentario c: v.getCom()){%>
								<table class="form-comments-table" style="margin-left:<%=c.getNivel()*40%>px;">
									<tr>
										<td><div class="comment-timestamp"><%=c.getFecha()%></div></td>
										<td><div class="comment-user"><%=c.getNick()%></div></td>
										<td><div id="comment-4" data-commentid="4" class="comment comment-step1"><%=c.getTexto()%></div></td>
										<%if(login != null) {%>
				                            <td>
				                            	<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#comentarVideo" onclick="comentar(<%=c.getId()%>)">
				                                		<i class="fas fa-reply"></i> Responder
			                                	</button>
											</td>
										<%}%>
									</tr>
								</table>
							<%}%>
						</li>
			        </ul>
				</div>
				<%if(login != null) {%>			    
				    <div class="input-group input-group-sm chatMessageControls">
				        <span class="input-group-btn">
				            <button id="sendMessageButton" class="btn btn-primary" type="button"  data-toggle="modal" data-target="#comentarVideo" onclick="comentar(0)">
				            	<i class="far fa-comment-dots"></i> Comentar
				            </button>
				        </span>
				    </div>
			    <%}%>
			</div>
		<%}%>	
		<!--Comentar Video-->
			<div class="modal fade" id="comentarVideo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Comentar video</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form id="Comentar Video" action="ComentarVideo" method="post">
							<div class="modal-body mx-auto">								
								<input type="text" name="aux" id="aux" placeholder="<%=v.getId()%>" value="<%=v.getId()%>" hidden>
								<input type="text" name="id" id="id" placeholder="-1" hidden>
								<div class="form-group row ">
									<textarea name="comentario" id="comentario" class="form-control form-control-sm validate"></textarea>
									<button id="submitAdd" type="submit" class="btn btn-info">Comentar</button>									
								</div>
								<div class="text-center mt-2"></div>
							</div>
							<div class="modal-footer-center"></div>
						</form>
					</div>
				</div>
			</div>
		
		<script src="js/app.js" charset="utf-8"></script>	
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	</body>
</html>