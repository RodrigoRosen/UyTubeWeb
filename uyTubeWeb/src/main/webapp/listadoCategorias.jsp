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
	<% ArrayList<String> categorias = (ArrayList<String>) request.getAttribute("categorias"); %>
	<h3>Categorias</h3>
	<div class="container">
		<ul class="list-group">
			<% if (categorias != null) {
				for (String cat : categorias) {
			%>
			<li class="list-group-item"><form action="ConsultaCategoria" method="get"><input type="submit" name="categoriaSeleccionada" value="<%=cat%>"></input></form></li>
			<% } 
			} %>
		</ul>
	</div>


</body>
</html>