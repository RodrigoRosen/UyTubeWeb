<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>uyTube | Listado</title>

</head>
<body>	
	<% ArrayList<String> categorias = (ArrayList<String>) session.getAttribute("categorias"); %>
	
	<div class="container">
		<h3 class="d-block p-2 bg-dark text-white text-center">Categorias</h3>
		<ul class="list-group">
			<% if (categorias != null) {
				for (String cat : categorias) {
			%>
			<li class="list-group-item list-group-item-action list-group-item-primary"><form action="ConsultaCategoria" method="get">
			<a class="text-uppercase font-weight-bold" href="ConsultaCategoria?categoriaSeleccionada=<%=cat%>"><%=cat%></a>			
			</form></li>
			<% } 
			} %>
		</ul>
	</div>


</body>
</html>