<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="datatypes.DtVideo"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="ComentarVideo" method="post">		
		<%DtVideo v = (DtVideo)request.getAttribute("video");
		Integer id= (Integer)request.getAttribute("id");%>
		<div style="display:none">
			<input type="text" name="aux" id="aux" placeholder="<%=v.getId()%>" value="<%=v.getId()%>">
			<%if(id !=null){%>
				<input type="text" name="id" id="id" placeholder="<%=id.intValue()%>" value="<%=id.intValue()%>">
			<%}%>
		</div>		
		<input type="text"  name="comentario" id="comentario" style="max-width:445px !important; min-width:445px !important">
		<button type="submit" id="btnComentar">Aceptar</button>
	</form>	

</body>
</html>