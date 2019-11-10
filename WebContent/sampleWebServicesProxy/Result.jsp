<%@page contentType="text/html;charset=UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<HTML>
<HEAD>
<TITLE>Result</TITLE>
</HEAD>
<BODY>
<H1>Result</H1>

<jsp:useBean id="sampleWebServicesProxyid" scope="session" class="WS.WebServicesProxy" />
<%
if (request.getParameter("endpoint") != null && request.getParameter("endpoint").length() > 0)
sampleWebServicesProxyid.setEndpoint(request.getParameter("endpoint"));
%>

<%
String method = request.getParameter("method");
int methodID = 0;
if (method == null) methodID = -1;

if(methodID != -1) methodID = Integer.parseInt(method);
boolean gotMethod = false;

try {
switch (methodID){ 
case 2:
        gotMethod = true;
        java.lang.String getEndpoint2mtemp = sampleWebServicesProxyid.getEndpoint();
if(getEndpoint2mtemp == null){
%>
<%=getEndpoint2mtemp %>
<%
}else{
        String tempResultreturnp3 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(getEndpoint2mtemp));
        %>
        <%= tempResultreturnp3 %>
        <%
}
break;
case 5:
        gotMethod = true;
        String endpoint_0id=  request.getParameter("endpoint8");
            java.lang.String endpoint_0idTemp = null;
        if(!endpoint_0id.equals("")){
         endpoint_0idTemp  = endpoint_0id;
        }
        sampleWebServicesProxyid.setEndpoint(endpoint_0idTemp);
break;
case 10:
        gotMethod = true;
        WS.WebServices getWebServices10mtemp = sampleWebServicesProxyid.getWebServices();
if(getWebServices10mtemp == null){
%>
<%=getWebServices10mtemp %>
<%
}else{
        if(getWebServices10mtemp!= null){
        String tempreturnp11 = getWebServices10mtemp.toString();
        %>
        <%=tempreturnp11%>
        <%
        }}
break;
case 13:
        gotMethod = true;
        String arg0_1id=  request.getParameter("arg016");
            java.lang.String arg0_1idTemp = null;
        if(!arg0_1id.equals("")){
         arg0_1idTemp  = arg0_1id;
        }
        WS.DtLista[] buscarListasPublicas13mtemp = sampleWebServicesProxyid.buscarListasPublicas(arg0_1idTemp);
if(buscarListasPublicas13mtemp == null){
%>
<%=buscarListasPublicas13mtemp %>
<%
}else{
        String tempreturnp14 = null;
        if(buscarListasPublicas13mtemp != null){
        java.util.List listreturnp14= java.util.Arrays.asList(buscarListasPublicas13mtemp);
        tempreturnp14 = listreturnp14.toString();
        }
        %>
        <%=tempreturnp14%>
        <%
}
break;
case 18:
        gotMethod = true;
        String texto_3id=  request.getParameter("texto23");
            java.lang.String texto_3idTemp = null;
        if(!texto_3id.equals("")){
         texto_3idTemp  = texto_3id;
        }
        String nick_4id=  request.getParameter("nick25");
            java.lang.String nick_4idTemp = null;
        if(!nick_4id.equals("")){
         nick_4idTemp  = nick_4id;
        }
        String fecha_5id=  request.getParameter("fecha27");
            java.util.Calendar fecha_5idTemp = null;
        if(!fecha_5id.equals("")){
        java.text.DateFormat dateFormatfecha27 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTempfecha27  = dateFormatfecha27.parse(fecha_5id);
         fecha_5idTemp = new java.util.GregorianCalendar();
        fecha_5idTemp.setTime(dateTempfecha27);
        }
        String nivel_6id=  request.getParameter("nivel29");
        int nivel_6idTemp  = Integer.parseInt(nivel_6id);
        String id_7id=  request.getParameter("id31");
        int id_7idTemp  = Integer.parseInt(id_7id);
        %>
        <jsp:useBean id="WS1DtComentario_2id" scope="session" class="WS.DtComentario" />
        <%
        WS1DtComentario_2id.setTexto(texto_3idTemp);
        WS1DtComentario_2id.setNick(nick_4idTemp);
        WS1DtComentario_2id.setFecha(fecha_5idTemp);
        WS1DtComentario_2id.setNivel(nivel_6idTemp);
        WS1DtComentario_2id.setId(id_7idTemp);
        boolean ingresarComentario18mtemp = sampleWebServicesProxyid.ingresarComentario(WS1DtComentario_2id);
        String tempResultreturnp19 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(ingresarComentario18mtemp));
        %>
        <%= tempResultreturnp19 %>
        <%
break;
case 33:
        gotMethod = true;
        String fechaNac_9id=  request.getParameter("fechaNac38");
            java.util.Calendar fechaNac_9idTemp = null;
        if(!fechaNac_9id.equals("")){
        java.text.DateFormat dateFormatfechaNac38 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTempfechaNac38  = dateFormatfechaNac38.parse(fechaNac_9id);
         fechaNac_9idTemp = new java.util.GregorianCalendar();
        fechaNac_9idTemp.setTime(dateTempfechaNac38);
        }
        String img_10id=  request.getParameter("img40");
            java.lang.String img_10idTemp = null;
        if(!img_10id.equals("")){
         img_10idTemp  = img_10id;
        }
        String nickname_11id=  request.getParameter("nickname42");
            java.lang.String nickname_11idTemp = null;
        if(!nickname_11id.equals("")){
         nickname_11idTemp  = nickname_11id;
        }
        String email_12id=  request.getParameter("email44");
            java.lang.String email_12idTemp = null;
        if(!email_12id.equals("")){
         email_12idTemp  = email_12id;
        }
        String password_13id=  request.getParameter("password46");
            java.lang.String password_13idTemp = null;
        if(!password_13id.equals("")){
         password_13idTemp  = password_13id;
        }
        String nombre_14id=  request.getParameter("nombre48");
            java.lang.String nombre_14idTemp = null;
        if(!nombre_14id.equals("")){
         nombre_14idTemp  = nombre_14id;
        }
        String apellido_15id=  request.getParameter("apellido50");
            java.lang.String apellido_15idTemp = null;
        if(!apellido_15id.equals("")){
         apellido_15idTemp  = apellido_15id;
        }
        %>
        <jsp:useBean id="WS1DtUsuario_8id" scope="session" class="WS.DtUsuario" />
        <%
        WS1DtUsuario_8id.setFechaNac(fechaNac_9idTemp);
        WS1DtUsuario_8id.setImg(img_10idTemp);
        WS1DtUsuario_8id.setNickname(nickname_11idTemp);
        WS1DtUsuario_8id.setEmail(email_12idTemp);
        WS1DtUsuario_8id.setPassword(password_13idTemp);
        WS1DtUsuario_8id.setNombre(nombre_14idTemp);
        WS1DtUsuario_8id.setApellido(apellido_15idTemp);
        WS.DtLista[] listarListasParticulares33mtemp = sampleWebServicesProxyid.listarListasParticulares(WS1DtUsuario_8id);
if(listarListasParticulares33mtemp == null){
%>
<%=listarListasParticulares33mtemp %>
<%
}else{
        String tempreturnp34 = null;
        if(listarListasParticulares33mtemp != null){
        java.util.List listreturnp34= java.util.Arrays.asList(listarListasParticulares33mtemp);
        tempreturnp34 = listreturnp34.toString();
        }
        %>
        <%=tempreturnp34%>
        <%
}
break;
case 52:
        gotMethod = true;
        String arg0_16id=  request.getParameter("arg055");
            java.lang.String arg0_16idTemp = null;
        if(!arg0_16id.equals("")){
         arg0_16idTemp  = arg0_16id;
        }
        sampleWebServicesProxyid.seleccionarCategoria(arg0_16idTemp);
break;
case 57:
        gotMethod = true;
        java.lang.Object[] listarVideosPublicos57mtemp = sampleWebServicesProxyid.listarVideosPublicos();
if(listarVideosPublicos57mtemp == null){
%>
<%=listarVideosPublicos57mtemp %>
<%
}else{
        String tempreturnp58 = null;
        if(listarVideosPublicos57mtemp != null){
        java.util.List listreturnp58= java.util.Arrays.asList(listarVideosPublicos57mtemp);
        tempreturnp58 = listreturnp58.toString();
        }
        %>
        <%=tempreturnp58%>
        <%
}
break;
case 60:
        gotMethod = true;
        String texto_18id=  request.getParameter("texto65");
            java.lang.String texto_18idTemp = null;
        if(!texto_18id.equals("")){
         texto_18idTemp  = texto_18id;
        }
        String nick_19id=  request.getParameter("nick67");
            java.lang.String nick_19idTemp = null;
        if(!nick_19id.equals("")){
         nick_19idTemp  = nick_19id;
        }
        String fecha_20id=  request.getParameter("fecha69");
            java.util.Calendar fecha_20idTemp = null;
        if(!fecha_20id.equals("")){
        java.text.DateFormat dateFormatfecha69 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTempfecha69  = dateFormatfecha69.parse(fecha_20id);
         fecha_20idTemp = new java.util.GregorianCalendar();
        fecha_20idTemp.setTime(dateTempfecha69);
        }
        String nivel_21id=  request.getParameter("nivel71");
        int nivel_21idTemp  = Integer.parseInt(nivel_21id);
        String id_22id=  request.getParameter("id73");
        int id_22idTemp  = Integer.parseInt(id_22id);
        %>
        <jsp:useBean id="WS1DtComentario_17id" scope="session" class="WS.DtComentario" />
        <%
        WS1DtComentario_17id.setTexto(texto_18idTemp);
        WS1DtComentario_17id.setNick(nick_19idTemp);
        WS1DtComentario_17id.setFecha(fecha_20idTemp);
        WS1DtComentario_17id.setNivel(nivel_21idTemp);
        WS1DtComentario_17id.setId(id_22idTemp);
        sampleWebServicesProxyid.seleccionarComentario(WS1DtComentario_17id);
break;
case 75:
        gotMethod = true;
        java.lang.Object[] listarListasPublicas75mtemp = sampleWebServicesProxyid.listarListasPublicas();
if(listarListasPublicas75mtemp == null){
%>
<%=listarListasPublicas75mtemp %>
<%
}else{
        String tempreturnp76 = null;
        if(listarListasPublicas75mtemp != null){
        java.util.List listreturnp76= java.util.Arrays.asList(listarListasPublicas75mtemp);
        tempreturnp76 = listreturnp76.toString();
        }
        %>
        <%=tempreturnp76%>
        <%
}
break;
case 78:
        gotMethod = true;
        java.lang.Object[] listarCanalesPublicos78mtemp = sampleWebServicesProxyid.listarCanalesPublicos();
if(listarCanalesPublicos78mtemp == null){
%>
<%=listarCanalesPublicos78mtemp %>
<%
}else{
        String tempreturnp79 = null;
        if(listarCanalesPublicos78mtemp != null){
        java.util.List listreturnp79= java.util.Arrays.asList(listarCanalesPublicos78mtemp);
        tempreturnp79 = listreturnp79.toString();
        }
        %>
        <%=tempreturnp79%>
        <%
}
break;
case 81:
        gotMethod = true;
        String arg0_23id=  request.getParameter("arg084");
            java.lang.String arg0_23idTemp = null;
        if(!arg0_23id.equals("")){
         arg0_23idTemp  = arg0_23id;
        }
        WS.DtVideo[] buscarVideosPublicos81mtemp = sampleWebServicesProxyid.buscarVideosPublicos(arg0_23idTemp);
if(buscarVideosPublicos81mtemp == null){
%>
<%=buscarVideosPublicos81mtemp %>
<%
}else{
        String tempreturnp82 = null;
        if(buscarVideosPublicos81mtemp != null){
        java.util.List listreturnp82= java.util.Arrays.asList(buscarVideosPublicos81mtemp);
        tempreturnp82 = listreturnp82.toString();
        }
        %>
        <%=tempreturnp82%>
        <%
}
break;
case 86:
        gotMethod = true;
        String arg0_24id=  request.getParameter("arg089");
            java.lang.String arg0_24idTemp = null;
        if(!arg0_24id.equals("")){
         arg0_24idTemp  = arg0_24id;
        }
        java.lang.Object[] listarVideosPrivados86mtemp = sampleWebServicesProxyid.listarVideosPrivados(arg0_24idTemp);
if(listarVideosPrivados86mtemp == null){
%>
<%=listarVideosPrivados86mtemp %>
<%
}else{
        String tempreturnp87 = null;
        if(listarVideosPrivados86mtemp != null){
        java.util.List listreturnp87= java.util.Arrays.asList(listarVideosPrivados86mtemp);
        tempreturnp87 = listreturnp87.toString();
        }
        %>
        <%=tempreturnp87%>
        <%
}
break;
case 91:
        gotMethod = true;
        String arg0_25id=  request.getParameter("arg094");
            java.lang.String arg0_25idTemp = null;
        if(!arg0_25id.equals("")){
         arg0_25idTemp  = arg0_25id;
        }
        java.lang.Object[] listasXCatPublicas91mtemp = sampleWebServicesProxyid.listasXCatPublicas(arg0_25idTemp);
if(listasXCatPublicas91mtemp == null){
%>
<%=listasXCatPublicas91mtemp %>
<%
}else{
        String tempreturnp92 = null;
        if(listasXCatPublicas91mtemp != null){
        java.util.List listreturnp92= java.util.Arrays.asList(listasXCatPublicas91mtemp);
        tempreturnp92 = listreturnp92.toString();
        }
        %>
        <%=tempreturnp92%>
        <%
}
break;
case 96:
        gotMethod = true;
        String arg0_26id=  request.getParameter("arg099");
            java.lang.String arg0_26idTemp = null;
        if(!arg0_26id.equals("")){
         arg0_26idTemp  = arg0_26id;
        }
        WS.DtCanal[] buscarCanalesPublicos96mtemp = sampleWebServicesProxyid.buscarCanalesPublicos(arg0_26idTemp);
if(buscarCanalesPublicos96mtemp == null){
%>
<%=buscarCanalesPublicos96mtemp %>
<%
}else{
        String tempreturnp97 = null;
        if(buscarCanalesPublicos96mtemp != null){
        java.util.List listreturnp97= java.util.Arrays.asList(buscarCanalesPublicos96mtemp);
        tempreturnp97 = listreturnp97.toString();
        }
        %>
        <%=tempreturnp97%>
        <%
}
break;
case 101:
        gotMethod = true;
        String privado_28id=  request.getParameter("privado106");
        boolean privado_28idTemp  = Boolean.valueOf(privado_28id).booleanValue();
        String defecto_29id=  request.getParameter("defecto108");
        boolean defecto_29idTemp  = Boolean.valueOf(defecto_29id).booleanValue();
        String nombre_30id=  request.getParameter("nombre110");
            java.lang.String nombre_30idTemp = null;
        if(!nombre_30id.equals("")){
         nombre_30idTemp  = nombre_30id;
        }
        String categoria_31id=  request.getParameter("categoria112");
            java.lang.String categoria_31idTemp = null;
        if(!categoria_31id.equals("")){
         categoria_31idTemp  = categoria_31id;
        }
        String id_32id=  request.getParameter("id114");
        int id_32idTemp  = Integer.parseInt(id_32id);
        %>
        <jsp:useBean id="WS1DtLista_27id" scope="session" class="WS.DtLista" />
        <%
        WS1DtLista_27id.setPrivado(privado_28idTemp);
        WS1DtLista_27id.setDefecto(defecto_29idTemp);
        WS1DtLista_27id.setNombre(nombre_30idTemp);
        WS1DtLista_27id.setCategoria(categoria_31idTemp);
        WS1DtLista_27id.setId(id_32idTemp);
        String privado_34id=  request.getParameter("privado118");
        boolean privado_34idTemp  = Boolean.valueOf(privado_34id).booleanValue();
        String defecto_35id=  request.getParameter("defecto120");
        boolean defecto_35idTemp  = Boolean.valueOf(defecto_35id).booleanValue();
        String nombre_36id=  request.getParameter("nombre122");
            java.lang.String nombre_36idTemp = null;
        if(!nombre_36id.equals("")){
         nombre_36idTemp  = nombre_36id;
        }
        String categoria_37id=  request.getParameter("categoria124");
            java.lang.String categoria_37idTemp = null;
        if(!categoria_37id.equals("")){
         categoria_37idTemp  = categoria_37id;
        }
        String id_38id=  request.getParameter("id126");
        int id_38idTemp  = Integer.parseInt(id_38id);
        %>
        <jsp:useBean id="WS1DtLista_33id" scope="session" class="WS.DtLista" />
        <%
        WS1DtLista_33id.setPrivado(privado_34idTemp);
        WS1DtLista_33id.setDefecto(defecto_35idTemp);
        WS1DtLista_33id.setNombre(nombre_36idTemp);
        WS1DtLista_33id.setCategoria(categoria_37idTemp);
        WS1DtLista_33id.setId(id_38idTemp);
        sampleWebServicesProxyid.modificarListaParticular(WS1DtLista_27id,WS1DtLista_33id);
break;
case 128:
        gotMethod = true;
        String arg0_39id=  request.getParameter("arg0131");
            java.lang.String arg0_39idTemp = null;
        if(!arg0_39id.equals("")){
         arg0_39idTemp  = arg0_39id;
        }
        java.lang.Object[] videosXCatPublicos128mtemp = sampleWebServicesProxyid.videosXCatPublicos(arg0_39idTemp);
if(videosXCatPublicos128mtemp == null){
%>
<%=videosXCatPublicos128mtemp %>
<%
}else{
        String tempreturnp129 = null;
        if(videosXCatPublicos128mtemp != null){
        java.util.List listreturnp129= java.util.Arrays.asList(videosXCatPublicos128mtemp);
        tempreturnp129 = listreturnp129.toString();
        }
        %>
        <%=tempreturnp129%>
        <%
}
break;
case 133:
        gotMethod = true;
        String arg0_40id=  request.getParameter("arg0136");
            java.lang.String arg0_40idTemp = null;
        if(!arg0_40id.equals("")){
         arg0_40idTemp  = arg0_40id;
        }
        java.lang.Object[] listarDatosUsuario133mtemp = sampleWebServicesProxyid.listarDatosUsuario(arg0_40idTemp);
if(listarDatosUsuario133mtemp == null){
%>
<%=listarDatosUsuario133mtemp %>
<%
}else{
        String tempreturnp134 = null;
        if(listarDatosUsuario133mtemp != null){
        java.util.List listreturnp134= java.util.Arrays.asList(listarDatosUsuario133mtemp);
        tempreturnp134 = listreturnp134.toString();
        }
        %>
        <%=tempreturnp134%>
        <%
}
break;
case 138:
        gotMethod = true;
        String arg0_41id=  request.getParameter("arg0141");
            java.lang.String arg0_41idTemp = null;
        if(!arg0_41id.equals("")){
         arg0_41idTemp  = arg0_41id;
        }
        String arg1_42id=  request.getParameter("arg1143");
        boolean arg1_42idTemp  = Boolean.valueOf(arg1_42id).booleanValue();
        sampleWebServicesProxyid.valorarVideoPublico(arg0_41idTemp,arg1_42idTemp);
break;
case 145:
        gotMethod = true;
        String arg0_43id=  request.getParameter("arg0166");
            java.lang.String arg0_43idTemp = null;
        if(!arg0_43id.equals("")){
         arg0_43idTemp  = arg0_43id;
        }
        WS.DtUsuario seleccionarUsuario145mtemp = sampleWebServicesProxyid.seleccionarUsuario(arg0_43idTemp);
if(seleccionarUsuario145mtemp == null){
%>
<%=seleccionarUsuario145mtemp %>
<%
}else{
%>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">returnp:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">seguidores:</TD>
<TD>
<%
if(seleccionarUsuario145mtemp != null){
WS.DtUsuarioSeguidoresEntry[] typeseguidores148 = seleccionarUsuario145mtemp.getSeguidores();
        String tempseguidores148 = null;
        if(typeseguidores148 != null){
        java.util.List listseguidores148= java.util.Arrays.asList(typeseguidores148);
        tempseguidores148 = listseguidores148.toString();
        }
        %>
        <%=tempseguidores148%>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">seguidos:</TD>
<TD>
<%
if(seleccionarUsuario145mtemp != null){
WS.DtUsuarioSeguidosEntry[] typeseguidos150 = seleccionarUsuario145mtemp.getSeguidos();
        String tempseguidos150 = null;
        if(typeseguidos150 != null){
        java.util.List listseguidos150= java.util.Arrays.asList(typeseguidos150);
        tempseguidos150 = listseguidos150.toString();
        }
        %>
        <%=tempseguidos150%>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">fechaNac:</TD>
<TD>
<%
if(seleccionarUsuario145mtemp != null){
java.util.Calendar typefechaNac152 = seleccionarUsuario145mtemp.getFechaNac();
        java.text.DateFormat dateFormatfechaNac152 = java.text.DateFormat.getDateInstance();
        java.util.Date datefechaNac152 = typefechaNac152.getTime();
        String tempResultfechaNac152 = org.eclipse.jst.ws.util.JspUtils.markup(dateFormatfechaNac152.format(datefechaNac152));
        %>
        <%= tempResultfechaNac152 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">img:</TD>
<TD>
<%
if(seleccionarUsuario145mtemp != null){
java.lang.String typeimg154 = seleccionarUsuario145mtemp.getImg();
        String tempResultimg154 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeimg154));
        %>
        <%= tempResultimg154 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">nickname:</TD>
<TD>
<%
if(seleccionarUsuario145mtemp != null){
java.lang.String typenickname156 = seleccionarUsuario145mtemp.getNickname();
        String tempResultnickname156 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typenickname156));
        %>
        <%= tempResultnickname156 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">email:</TD>
<TD>
<%
if(seleccionarUsuario145mtemp != null){
java.lang.String typeemail158 = seleccionarUsuario145mtemp.getEmail();
        String tempResultemail158 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeemail158));
        %>
        <%= tempResultemail158 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">password:</TD>
<TD>
<%
if(seleccionarUsuario145mtemp != null){
java.lang.String typepassword160 = seleccionarUsuario145mtemp.getPassword();
        String tempResultpassword160 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typepassword160));
        %>
        <%= tempResultpassword160 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">nombre:</TD>
<TD>
<%
if(seleccionarUsuario145mtemp != null){
java.lang.String typenombre162 = seleccionarUsuario145mtemp.getNombre();
        String tempResultnombre162 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typenombre162));
        %>
        <%= tempResultnombre162 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">apellido:</TD>
<TD>
<%
if(seleccionarUsuario145mtemp != null){
java.lang.String typeapellido164 = seleccionarUsuario145mtemp.getApellido();
        String tempResultapellido164 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeapellido164));
        %>
        <%= tempResultapellido164 %>
        <%
}%>
</TD>
</TABLE>
<%
}
break;
case 168:
        gotMethod = true;
        String privado_45id=  request.getParameter("privado173");
        boolean privado_45idTemp  = Boolean.valueOf(privado_45id).booleanValue();
        String defecto_46id=  request.getParameter("defecto175");
        boolean defecto_46idTemp  = Boolean.valueOf(defecto_46id).booleanValue();
        String nombre_47id=  request.getParameter("nombre177");
            java.lang.String nombre_47idTemp = null;
        if(!nombre_47id.equals("")){
         nombre_47idTemp  = nombre_47id;
        }
        String categoria_48id=  request.getParameter("categoria179");
            java.lang.String categoria_48idTemp = null;
        if(!categoria_48id.equals("")){
         categoria_48idTemp  = categoria_48id;
        }
        String id_49id=  request.getParameter("id181");
        int id_49idTemp  = Integer.parseInt(id_49id);
        %>
        <jsp:useBean id="WS1DtLista_44id" scope="session" class="WS.DtLista" />
        <%
        WS1DtLista_44id.setPrivado(privado_45idTemp);
        WS1DtLista_44id.setDefecto(defecto_46idTemp);
        WS1DtLista_44id.setNombre(nombre_47idTemp);
        WS1DtLista_44id.setCategoria(categoria_48idTemp);
        WS1DtLista_44id.setId(id_49idTemp);
        WS.DtVideo[] videosEnListaPublica168mtemp = sampleWebServicesProxyid.videosEnListaPublica(WS1DtLista_44id);
if(videosEnListaPublica168mtemp == null){
%>
<%=videosEnListaPublica168mtemp %>
<%
}else{
        String tempreturnp169 = null;
        if(videosEnListaPublica168mtemp != null){
        java.util.List listreturnp169= java.util.Arrays.asList(videosEnListaPublica168mtemp);
        tempreturnp169 = listreturnp169.toString();
        }
        %>
        <%=tempreturnp169%>
        <%
}
break;
case 183:
        gotMethod = true;
        String fechaNac_51id=  request.getParameter("fechaNac188");
            java.util.Calendar fechaNac_51idTemp = null;
        if(!fechaNac_51id.equals("")){
        java.text.DateFormat dateFormatfechaNac188 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTempfechaNac188  = dateFormatfechaNac188.parse(fechaNac_51id);
         fechaNac_51idTemp = new java.util.GregorianCalendar();
        fechaNac_51idTemp.setTime(dateTempfechaNac188);
        }
        String img_52id=  request.getParameter("img190");
            java.lang.String img_52idTemp = null;
        if(!img_52id.equals("")){
         img_52idTemp  = img_52id;
        }
        String nickname_53id=  request.getParameter("nickname192");
            java.lang.String nickname_53idTemp = null;
        if(!nickname_53id.equals("")){
         nickname_53idTemp  = nickname_53id;
        }
        String email_54id=  request.getParameter("email194");
            java.lang.String email_54idTemp = null;
        if(!email_54id.equals("")){
         email_54idTemp  = email_54id;
        }
        String password_55id=  request.getParameter("password196");
            java.lang.String password_55idTemp = null;
        if(!password_55id.equals("")){
         password_55idTemp  = password_55id;
        }
        String nombre_56id=  request.getParameter("nombre198");
            java.lang.String nombre_56idTemp = null;
        if(!nombre_56id.equals("")){
         nombre_56idTemp  = nombre_56id;
        }
        String apellido_57id=  request.getParameter("apellido200");
            java.lang.String apellido_57idTemp = null;
        if(!apellido_57id.equals("")){
         apellido_57idTemp  = apellido_57id;
        }
        %>
        <jsp:useBean id="WS1DtUsuario_50id" scope="session" class="WS.DtUsuario" />
        <%
        WS1DtUsuario_50id.setFechaNac(fechaNac_51idTemp);
        WS1DtUsuario_50id.setImg(img_52idTemp);
        WS1DtUsuario_50id.setNickname(nickname_53idTemp);
        WS1DtUsuario_50id.setEmail(email_54idTemp);
        WS1DtUsuario_50id.setPassword(password_55idTemp);
        WS1DtUsuario_50id.setNombre(nombre_56idTemp);
        WS1DtUsuario_50id.setApellido(apellido_57idTemp);
        String nick_59id=  request.getParameter("nick204");
            java.lang.String nick_59idTemp = null;
        if(!nick_59id.equals("")){
         nick_59idTemp  = nick_59id;
        }
        String descripcion_60id=  request.getParameter("descripcion206");
            java.lang.String descripcion_60idTemp = null;
        if(!descripcion_60id.equals("")){
         descripcion_60idTemp  = descripcion_60id;
        }
        String privado_61id=  request.getParameter("privado208");
        boolean privado_61idTemp  = Boolean.valueOf(privado_61id).booleanValue();
        String nombre_62id=  request.getParameter("nombre210");
            java.lang.String nombre_62idTemp = null;
        if(!nombre_62id.equals("")){
         nombre_62idTemp  = nombre_62id;
        }
        %>
        <jsp:useBean id="WS1DtCanal_58id" scope="session" class="WS.DtCanal" />
        <%
        WS1DtCanal_58id.setNick(nick_59idTemp);
        WS1DtCanal_58id.setDescripcion(descripcion_60idTemp);
        WS1DtCanal_58id.setPrivado(privado_61idTemp);
        WS1DtCanal_58id.setNombre(nombre_62idTemp);
        sampleWebServicesProxyid.modificarUsuarioCanal(WS1DtUsuario_50id,WS1DtCanal_58id);
break;
case 212:
        gotMethod = true;
        String arg0_63id=  request.getParameter("arg0215");
        boolean arg0_63idTemp  = Boolean.valueOf(arg0_63id).booleanValue();
        sampleWebServicesProxyid.ingresarTipoLista(arg0_63idTemp);
break;
case 217:
        gotMethod = true;
        sampleWebServicesProxyid.finCasoUso();
break;
case 220:
        gotMethod = true;
        String arg0_64id=  request.getParameter("arg0223");
            java.lang.String arg0_64idTemp = null;
        if(!arg0_64id.equals("")){
         arg0_64idTemp  = arg0_64id;
        }
        String arg1_65id=  request.getParameter("arg1225");
            java.lang.String arg1_65idTemp = null;
        if(!arg1_65id.equals("")){
         arg1_65idTemp  = arg1_65id;
        }
        String arg2_66id=  request.getParameter("arg2227");
            java.lang.String arg2_66idTemp = null;
        if(!arg2_66id.equals("")){
         arg2_66idTemp  = arg2_66id;
        }
        String arg3_67id=  request.getParameter("arg3229");
            java.lang.String arg3_67idTemp = null;
        if(!arg3_67id.equals("")){
         arg3_67idTemp  = arg3_67id;
        }
        String arg4_68id=  request.getParameter("arg4231");
            java.lang.String arg4_68idTemp = null;
        if(!arg4_68id.equals("")){
         arg4_68idTemp  = arg4_68id;
        }
        String arg5_69id=  request.getParameter("arg5233");
            java.util.Calendar arg5_69idTemp = null;
        if(!arg5_69id.equals("")){
        java.text.DateFormat dateFormatarg5233 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTemparg5233  = dateFormatarg5233.parse(arg5_69id);
         arg5_69idTemp = new java.util.GregorianCalendar();
        arg5_69idTemp.setTime(dateTemparg5233);
        }
        String arg6_70id=  request.getParameter("arg6235");
            java.lang.String arg6_70idTemp = null;
        if(!arg6_70id.equals("")){
         arg6_70idTemp  = arg6_70id;
        }
        String nick_72id=  request.getParameter("nick239");
            java.lang.String nick_72idTemp = null;
        if(!nick_72id.equals("")){
         nick_72idTemp  = nick_72id;
        }
        String descripcion_73id=  request.getParameter("descripcion241");
            java.lang.String descripcion_73idTemp = null;
        if(!descripcion_73id.equals("")){
         descripcion_73idTemp  = descripcion_73id;
        }
        String privado_74id=  request.getParameter("privado243");
        boolean privado_74idTemp  = Boolean.valueOf(privado_74id).booleanValue();
        String nombre_75id=  request.getParameter("nombre245");
            java.lang.String nombre_75idTemp = null;
        if(!nombre_75id.equals("")){
         nombre_75idTemp  = nombre_75id;
        }
        %>
        <jsp:useBean id="WS1DtCanal_71id" scope="session" class="WS.DtCanal" />
        <%
        WS1DtCanal_71id.setNick(nick_72idTemp);
        WS1DtCanal_71id.setDescripcion(descripcion_73idTemp);
        WS1DtCanal_71id.setPrivado(privado_74idTemp);
        WS1DtCanal_71id.setNombre(nombre_75idTemp);
        boolean ingresarUsuario220mtemp = sampleWebServicesProxyid.ingresarUsuario(arg0_64idTemp,arg1_65idTemp,arg2_66idTemp,arg3_67idTemp,arg4_68idTemp,arg5_69idTemp,arg6_70idTemp,WS1DtCanal_71id);
        String tempResultreturnp221 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(ingresarUsuario220mtemp));
        %>
        <%= tempResultreturnp221 %>
        <%
break;
case 247:
        gotMethod = true;
        String arg0_76id=  request.getParameter("arg0268");
            java.lang.String arg0_76idTemp = null;
        if(!arg0_76id.equals("")){
         arg0_76idTemp  = arg0_76id;
        }
        WS.DtVideo seleccionarVideo247mtemp = sampleWebServicesProxyid.seleccionarVideo(arg0_76idTemp);
if(seleccionarVideo247mtemp == null){
%>
<%=seleccionarVideo247mtemp %>
<%
}else{
%>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">returnp:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">url:</TD>
<TD>
<%
if(seleccionarVideo247mtemp != null){
java.lang.String typeurl250 = seleccionarVideo247mtemp.getUrl();
        String tempResulturl250 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeurl250));
        %>
        <%= tempResulturl250 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">id:</TD>
<TD>
<%
if(seleccionarVideo247mtemp != null){
%>
<%=seleccionarVideo247mtemp.getId()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">privado:</TD>
<TD>
<%
if(seleccionarVideo247mtemp != null){
java.lang.Boolean typeprivado254 = seleccionarVideo247mtemp.getPrivado();
        String tempResultprivado254 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeprivado254));
        %>
        <%= tempResultprivado254 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">descripcion:</TD>
<TD>
<%
if(seleccionarVideo247mtemp != null){
java.lang.String typedescripcion256 = seleccionarVideo247mtemp.getDescripcion();
        String tempResultdescripcion256 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typedescripcion256));
        %>
        <%= tempResultdescripcion256 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">categoria:</TD>
<TD>
<%
if(seleccionarVideo247mtemp != null){
java.lang.String typecategoria258 = seleccionarVideo247mtemp.getCategoria();
        String tempResultcategoria258 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typecategoria258));
        %>
        <%= tempResultcategoria258 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">canal:</TD>
<TD>
<%
if(seleccionarVideo247mtemp != null){
java.lang.String typecanal260 = seleccionarVideo247mtemp.getCanal();
        String tempResultcanal260 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typecanal260));
        %>
        <%= tempResultcanal260 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">duracion:</TD>
<TD>
<%
if(seleccionarVideo247mtemp != null){
java.lang.Integer typeduracion262 = seleccionarVideo247mtemp.getDuracion();
        String tempResultduracion262 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeduracion262));
        %>
        <%= tempResultduracion262 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">fechaPub:</TD>
<TD>
<%
if(seleccionarVideo247mtemp != null){
java.util.Calendar typefechaPub264 = seleccionarVideo247mtemp.getFechaPub();
        java.text.DateFormat dateFormatfechaPub264 = java.text.DateFormat.getDateInstance();
        java.util.Date datefechaPub264 = typefechaPub264.getTime();
        String tempResultfechaPub264 = org.eclipse.jst.ws.util.JspUtils.markup(dateFormatfechaPub264.format(datefechaPub264));
        %>
        <%= tempResultfechaPub264 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">nombre:</TD>
<TD>
<%
if(seleccionarVideo247mtemp != null){
java.lang.String typenombre266 = seleccionarVideo247mtemp.getNombre();
        String tempResultnombre266 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typenombre266));
        %>
        <%= tempResultnombre266 %>
        <%
}%>
</TD>
</TABLE>
<%
}
break;
case 270:
        gotMethod = true;
        String url_78id=  request.getParameter("url275");
            java.lang.String url_78idTemp = null;
        if(!url_78id.equals("")){
         url_78idTemp  = url_78id;
        }
        String id_79id=  request.getParameter("id277");
        int id_79idTemp  = Integer.parseInt(id_79id);
        String privado_80id=  request.getParameter("privado279");
            java.lang.Boolean privado_80idTemp = null;
        if(!privado_80id.equals("")){
         privado_80idTemp  = java.lang.Boolean.valueOf(privado_80id);
        }
        String descripcion_81id=  request.getParameter("descripcion281");
            java.lang.String descripcion_81idTemp = null;
        if(!descripcion_81id.equals("")){
         descripcion_81idTemp  = descripcion_81id;
        }
        String categoria_82id=  request.getParameter("categoria283");
            java.lang.String categoria_82idTemp = null;
        if(!categoria_82id.equals("")){
         categoria_82idTemp  = categoria_82id;
        }
        String canal_83id=  request.getParameter("canal285");
            java.lang.String canal_83idTemp = null;
        if(!canal_83id.equals("")){
         canal_83idTemp  = canal_83id;
        }
        String duracion_84id=  request.getParameter("duracion287");
            java.lang.Integer duracion_84idTemp = null;
        if(!duracion_84id.equals("")){
         duracion_84idTemp  = java.lang.Integer.valueOf(duracion_84id);
        }
        String fechaPub_85id=  request.getParameter("fechaPub289");
            java.util.Calendar fechaPub_85idTemp = null;
        if(!fechaPub_85id.equals("")){
        java.text.DateFormat dateFormatfechaPub289 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTempfechaPub289  = dateFormatfechaPub289.parse(fechaPub_85id);
         fechaPub_85idTemp = new java.util.GregorianCalendar();
        fechaPub_85idTemp.setTime(dateTempfechaPub289);
        }
        String nombre_86id=  request.getParameter("nombre291");
            java.lang.String nombre_86idTemp = null;
        if(!nombre_86id.equals("")){
         nombre_86idTemp  = nombre_86id;
        }
        %>
        <jsp:useBean id="WS1DtVideo_77id" scope="session" class="WS.DtVideo" />
        <%
        WS1DtVideo_77id.setUrl(url_78idTemp);
        WS1DtVideo_77id.setId(id_79idTemp);
        WS1DtVideo_77id.setPrivado(privado_80idTemp);
        WS1DtVideo_77id.setDescripcion(descripcion_81idTemp);
        WS1DtVideo_77id.setCategoria(categoria_82idTemp);
        WS1DtVideo_77id.setCanal(canal_83idTemp);
        WS1DtVideo_77id.setDuracion(duracion_84idTemp);
        WS1DtVideo_77id.setFechaPub(fechaPub_85idTemp);
        WS1DtVideo_77id.setNombre(nombre_86idTemp);
        sampleWebServicesProxyid.editarVideo(WS1DtVideo_77id);
break;
case 293:
        gotMethod = true;
        String url_88id=  request.getParameter("url298");
            java.lang.String url_88idTemp = null;
        if(!url_88id.equals("")){
         url_88idTemp  = url_88id;
        }
        String id_89id=  request.getParameter("id300");
        int id_89idTemp  = Integer.parseInt(id_89id);
        String privado_90id=  request.getParameter("privado302");
            java.lang.Boolean privado_90idTemp = null;
        if(!privado_90id.equals("")){
         privado_90idTemp  = java.lang.Boolean.valueOf(privado_90id);
        }
        String descripcion_91id=  request.getParameter("descripcion304");
            java.lang.String descripcion_91idTemp = null;
        if(!descripcion_91id.equals("")){
         descripcion_91idTemp  = descripcion_91id;
        }
        String categoria_92id=  request.getParameter("categoria306");
            java.lang.String categoria_92idTemp = null;
        if(!categoria_92id.equals("")){
         categoria_92idTemp  = categoria_92id;
        }
        String canal_93id=  request.getParameter("canal308");
            java.lang.String canal_93idTemp = null;
        if(!canal_93id.equals("")){
         canal_93idTemp  = canal_93id;
        }
        String duracion_94id=  request.getParameter("duracion310");
            java.lang.Integer duracion_94idTemp = null;
        if(!duracion_94id.equals("")){
         duracion_94idTemp  = java.lang.Integer.valueOf(duracion_94id);
        }
        String fechaPub_95id=  request.getParameter("fechaPub312");
            java.util.Calendar fechaPub_95idTemp = null;
        if(!fechaPub_95id.equals("")){
        java.text.DateFormat dateFormatfechaPub312 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTempfechaPub312  = dateFormatfechaPub312.parse(fechaPub_95id);
         fechaPub_95idTemp = new java.util.GregorianCalendar();
        fechaPub_95idTemp.setTime(dateTempfechaPub312);
        }
        String nombre_96id=  request.getParameter("nombre314");
            java.lang.String nombre_96idTemp = null;
        if(!nombre_96id.equals("")){
         nombre_96idTemp  = nombre_96id;
        }
        %>
        <jsp:useBean id="WS1DtVideo_87id" scope="session" class="WS.DtVideo" />
        <%
        WS1DtVideo_87id.setUrl(url_88idTemp);
        WS1DtVideo_87id.setId(id_89idTemp);
        WS1DtVideo_87id.setPrivado(privado_90idTemp);
        WS1DtVideo_87id.setDescripcion(descripcion_91idTemp);
        WS1DtVideo_87id.setCategoria(categoria_92idTemp);
        WS1DtVideo_87id.setCanal(canal_93idTemp);
        WS1DtVideo_87id.setDuracion(duracion_94idTemp);
        WS1DtVideo_87id.setFechaPub(fechaPub_95idTemp);
        WS1DtVideo_87id.setNombre(nombre_96idTemp);
        sampleWebServicesProxyid.quitarVideo(WS1DtVideo_87id);
break;
case 316:
        gotMethod = true;
        String arg0_97id=  request.getParameter("arg0319");
        int arg0_97idTemp  = Integer.parseInt(arg0_97id);
        java.lang.String findDuenioVideo316mtemp = sampleWebServicesProxyid.findDuenioVideo(arg0_97idTemp);
if(findDuenioVideo316mtemp == null){
%>
<%=findDuenioVideo316mtemp %>
<%
}else{
        String tempResultreturnp317 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(findDuenioVideo316mtemp));
        %>
        <%= tempResultreturnp317 %>
        <%
}
break;
case 321:
        gotMethod = true;
        String arg0_98id=  request.getParameter("arg0324");
            java.lang.String arg0_98idTemp = null;
        if(!arg0_98id.equals("")){
         arg0_98idTemp  = arg0_98id;
        }
        String arg1_99id=  request.getParameter("arg1326");
        int arg1_99idTemp  = Integer.parseInt(arg1_99id);
        String arg2_100id=  request.getParameter("arg2328");
            java.lang.String arg2_100idTemp = null;
        if(!arg2_100id.equals("")){
         arg2_100idTemp  = arg2_100id;
        }
        String arg3_101id=  request.getParameter("arg3330");
            java.lang.String arg3_101idTemp = null;
        if(!arg3_101id.equals("")){
         arg3_101idTemp  = arg3_101id;
        }
        String arg4_102id=  request.getParameter("arg4332");
            java.util.Calendar arg4_102idTemp = null;
        if(!arg4_102id.equals("")){
        java.text.DateFormat dateFormatarg4332 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTemparg4332  = dateFormatarg4332.parse(arg4_102id);
         arg4_102idTemp = new java.util.GregorianCalendar();
        arg4_102idTemp.setTime(dateTemparg4332);
        }
        boolean ingresarVideo321mtemp = sampleWebServicesProxyid.ingresarVideo(arg0_98idTemp,arg1_99idTemp,arg2_100idTemp,arg3_101idTemp,arg4_102idTemp);
        String tempResultreturnp322 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(ingresarVideo321mtemp));
        %>
        <%= tempResultreturnp322 %>
        <%
break;
case 334:
        gotMethod = true;
        String arg0_103id=  request.getParameter("arg0337");
            java.lang.String arg0_103idTemp = null;
        if(!arg0_103id.equals("")){
         arg0_103idTemp  = arg0_103id;
        }
        String privado_105id=  request.getParameter("privado341");
        boolean privado_105idTemp  = Boolean.valueOf(privado_105id).booleanValue();
        String defecto_106id=  request.getParameter("defecto343");
        boolean defecto_106idTemp  = Boolean.valueOf(defecto_106id).booleanValue();
        String nombre_107id=  request.getParameter("nombre345");
            java.lang.String nombre_107idTemp = null;
        if(!nombre_107id.equals("")){
         nombre_107idTemp  = nombre_107id;
        }
        String categoria_108id=  request.getParameter("categoria347");
            java.lang.String categoria_108idTemp = null;
        if(!categoria_108id.equals("")){
         categoria_108idTemp  = categoria_108id;
        }
        String id_109id=  request.getParameter("id349");
        int id_109idTemp  = Integer.parseInt(id_109id);
        %>
        <jsp:useBean id="WS1DtLista_104id" scope="session" class="WS.DtLista" />
        <%
        WS1DtLista_104id.setPrivado(privado_105idTemp);
        WS1DtLista_104id.setDefecto(defecto_106idTemp);
        WS1DtLista_104id.setNombre(nombre_107idTemp);
        WS1DtLista_104id.setCategoria(categoria_108idTemp);
        WS1DtLista_104id.setId(id_109idTemp);
        boolean agregarVideo334mtemp = sampleWebServicesProxyid.agregarVideo(arg0_103idTemp,WS1DtLista_104id);
        String tempResultreturnp335 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(agregarVideo334mtemp));
        %>
        <%= tempResultreturnp335 %>
        <%
break;
case 351:
        gotMethod = true;
        String arg0_110id=  request.getParameter("arg0372");
        int arg0_110idTemp  = Integer.parseInt(arg0_110id);
        WS.DtVideo findVideo351mtemp = sampleWebServicesProxyid.findVideo(arg0_110idTemp);
if(findVideo351mtemp == null){
%>
<%=findVideo351mtemp %>
<%
}else{
%>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">returnp:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">url:</TD>
<TD>
<%
if(findVideo351mtemp != null){
java.lang.String typeurl354 = findVideo351mtemp.getUrl();
        String tempResulturl354 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeurl354));
        %>
        <%= tempResulturl354 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">id:</TD>
<TD>
<%
if(findVideo351mtemp != null){
%>
<%=findVideo351mtemp.getId()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">privado:</TD>
<TD>
<%
if(findVideo351mtemp != null){
java.lang.Boolean typeprivado358 = findVideo351mtemp.getPrivado();
        String tempResultprivado358 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeprivado358));
        %>
        <%= tempResultprivado358 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">descripcion:</TD>
<TD>
<%
if(findVideo351mtemp != null){
java.lang.String typedescripcion360 = findVideo351mtemp.getDescripcion();
        String tempResultdescripcion360 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typedescripcion360));
        %>
        <%= tempResultdescripcion360 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">categoria:</TD>
<TD>
<%
if(findVideo351mtemp != null){
java.lang.String typecategoria362 = findVideo351mtemp.getCategoria();
        String tempResultcategoria362 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typecategoria362));
        %>
        <%= tempResultcategoria362 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">canal:</TD>
<TD>
<%
if(findVideo351mtemp != null){
java.lang.String typecanal364 = findVideo351mtemp.getCanal();
        String tempResultcanal364 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typecanal364));
        %>
        <%= tempResultcanal364 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">duracion:</TD>
<TD>
<%
if(findVideo351mtemp != null){
java.lang.Integer typeduracion366 = findVideo351mtemp.getDuracion();
        String tempResultduracion366 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeduracion366));
        %>
        <%= tempResultduracion366 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">fechaPub:</TD>
<TD>
<%
if(findVideo351mtemp != null){
java.util.Calendar typefechaPub368 = findVideo351mtemp.getFechaPub();
        java.text.DateFormat dateFormatfechaPub368 = java.text.DateFormat.getDateInstance();
        java.util.Date datefechaPub368 = typefechaPub368.getTime();
        String tempResultfechaPub368 = org.eclipse.jst.ws.util.JspUtils.markup(dateFormatfechaPub368.format(datefechaPub368));
        %>
        <%= tempResultfechaPub368 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">nombre:</TD>
<TD>
<%
if(findVideo351mtemp != null){
java.lang.String typenombre370 = findVideo351mtemp.getNombre();
        String tempResultnombre370 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typenombre370));
        %>
        <%= tempResultnombre370 %>
        <%
}%>
</TD>
</TABLE>
<%
}
break;
case 374:
        gotMethod = true;
        java.lang.String[] listarVideos374mtemp = sampleWebServicesProxyid.listarVideos();
if(listarVideos374mtemp == null){
%>
<%=listarVideos374mtemp %>
<%
}else{
        String tempreturnp375 = null;
        if(listarVideos374mtemp != null){
        java.util.List listreturnp375= java.util.Arrays.asList(listarVideos374mtemp);
        tempreturnp375 = listreturnp375.toString();
        }
        %>
        <%=tempreturnp375%>
        <%
}
break;
case 377:
        gotMethod = true;
        String fechaNac_112id=  request.getParameter("fechaNac382");
            java.util.Calendar fechaNac_112idTemp = null;
        if(!fechaNac_112id.equals("")){
        java.text.DateFormat dateFormatfechaNac382 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTempfechaNac382  = dateFormatfechaNac382.parse(fechaNac_112id);
         fechaNac_112idTemp = new java.util.GregorianCalendar();
        fechaNac_112idTemp.setTime(dateTempfechaNac382);
        }
        String img_113id=  request.getParameter("img384");
            java.lang.String img_113idTemp = null;
        if(!img_113id.equals("")){
         img_113idTemp  = img_113id;
        }
        String nickname_114id=  request.getParameter("nickname386");
            java.lang.String nickname_114idTemp = null;
        if(!nickname_114id.equals("")){
         nickname_114idTemp  = nickname_114id;
        }
        String email_115id=  request.getParameter("email388");
            java.lang.String email_115idTemp = null;
        if(!email_115id.equals("")){
         email_115idTemp  = email_115id;
        }
        String password_116id=  request.getParameter("password390");
            java.lang.String password_116idTemp = null;
        if(!password_116id.equals("")){
         password_116idTemp  = password_116id;
        }
        String nombre_117id=  request.getParameter("nombre392");
            java.lang.String nombre_117idTemp = null;
        if(!nombre_117id.equals("")){
         nombre_117idTemp  = nombre_117id;
        }
        String apellido_118id=  request.getParameter("apellido394");
            java.lang.String apellido_118idTemp = null;
        if(!apellido_118id.equals("")){
         apellido_118idTemp  = apellido_118id;
        }
        %>
        <jsp:useBean id="WS1DtUsuario_111id" scope="session" class="WS.DtUsuario" />
        <%
        WS1DtUsuario_111id.setFechaNac(fechaNac_112idTemp);
        WS1DtUsuario_111id.setImg(img_113idTemp);
        WS1DtUsuario_111id.setNickname(nickname_114idTemp);
        WS1DtUsuario_111id.setEmail(email_115idTemp);
        WS1DtUsuario_111id.setPassword(password_116idTemp);
        WS1DtUsuario_111id.setNombre(nombre_117idTemp);
        WS1DtUsuario_111id.setApellido(apellido_118idTemp);
        String arg1_119id=  request.getParameter("arg1396");
            java.lang.String arg1_119idTemp = null;
        if(!arg1_119id.equals("")){
         arg1_119idTemp  = arg1_119id;
        }
        String arg2_120id=  request.getParameter("arg2398");
        boolean arg2_120idTemp  = Boolean.valueOf(arg2_120id).booleanValue();
        String arg3_121id=  request.getParameter("arg3400");
            java.lang.String arg3_121idTemp = null;
        if(!arg3_121id.equals("")){
         arg3_121idTemp  = arg3_121id;
        }
        boolean crearLista377mtemp = sampleWebServicesProxyid.crearLista(WS1DtUsuario_111id,arg1_119idTemp,arg2_120idTemp,arg3_121idTemp);
        String tempResultreturnp378 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(crearLista377mtemp));
        %>
        <%= tempResultreturnp378 %>
        <%
break;
case 402:
        gotMethod = true;
        sampleWebServicesProxyid.dejarSeguir();
break;
case 405:
        gotMethod = true;
        String arg0_122id=  request.getParameter("arg0408");
            java.lang.String arg0_122idTemp = null;
        if(!arg0_122id.equals("")){
         arg0_122idTemp  = arg0_122id;
        }
        String arg1_123id=  request.getParameter("arg1410");
            java.lang.String arg1_123idTemp = null;
        if(!arg1_123id.equals("")){
         arg1_123idTemp  = arg1_123id;
        }
        boolean login405mtemp = sampleWebServicesProxyid.login(arg0_122idTemp,arg1_123idTemp);
        String tempResultreturnp406 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(login405mtemp));
        %>
        <%= tempResultreturnp406 %>
        <%
break;
case 412:
        gotMethod = true;
        String arg0_124id=  request.getParameter("arg0425");
        int arg0_124idTemp  = Integer.parseInt(arg0_124id);
        WS.DtLista findLista412mtemp = sampleWebServicesProxyid.findLista(arg0_124idTemp);
if(findLista412mtemp == null){
%>
<%=findLista412mtemp %>
<%
}else{
%>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">returnp:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">privado:</TD>
<TD>
<%
if(findLista412mtemp != null){
%>
<%=findLista412mtemp.isPrivado()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">defecto:</TD>
<TD>
<%
if(findLista412mtemp != null){
%>
<%=findLista412mtemp.isDefecto()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">nombre:</TD>
<TD>
<%
if(findLista412mtemp != null){
java.lang.String typenombre419 = findLista412mtemp.getNombre();
        String tempResultnombre419 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typenombre419));
        %>
        <%= tempResultnombre419 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">categoria:</TD>
<TD>
<%
if(findLista412mtemp != null){
java.lang.String typecategoria421 = findLista412mtemp.getCategoria();
        String tempResultcategoria421 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typecategoria421));
        %>
        <%= tempResultcategoria421 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">id:</TD>
<TD>
<%
if(findLista412mtemp != null){
%>
<%=findLista412mtemp.getId()
%><%}%>
</TD>
</TABLE>
<%
}
break;
case 427:
        gotMethod = true;
        String arg0_125id=  request.getParameter("arg0430");
            java.lang.String arg0_125idTemp = null;
        if(!arg0_125id.equals("")){
         arg0_125idTemp  = arg0_125id;
        }
        boolean altaCategoria427mtemp = sampleWebServicesProxyid.altaCategoria(arg0_125idTemp);
        String tempResultreturnp428 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(altaCategoria427mtemp));
        %>
        <%= tempResultreturnp428 %>
        <%
break;
case 432:
        gotMethod = true;
        String privado_127id=  request.getParameter("privado437");
        boolean privado_127idTemp  = Boolean.valueOf(privado_127id).booleanValue();
        String defecto_128id=  request.getParameter("defecto439");
        boolean defecto_128idTemp  = Boolean.valueOf(defecto_128id).booleanValue();
        String nombre_129id=  request.getParameter("nombre441");
            java.lang.String nombre_129idTemp = null;
        if(!nombre_129id.equals("")){
         nombre_129idTemp  = nombre_129id;
        }
        String categoria_130id=  request.getParameter("categoria443");
            java.lang.String categoria_130idTemp = null;
        if(!categoria_130id.equals("")){
         categoria_130idTemp  = categoria_130id;
        }
        String id_131id=  request.getParameter("id445");
        int id_131idTemp  = Integer.parseInt(id_131id);
        %>
        <jsp:useBean id="WS1DtLista_126id" scope="session" class="WS.DtLista" />
        <%
        WS1DtLista_126id.setPrivado(privado_127idTemp);
        WS1DtLista_126id.setDefecto(defecto_128idTemp);
        WS1DtLista_126id.setNombre(nombre_129idTemp);
        WS1DtLista_126id.setCategoria(categoria_130idTemp);
        WS1DtLista_126id.setId(id_131idTemp);
        WS.DtVideo[] videosEnLista432mtemp = sampleWebServicesProxyid.videosEnLista(WS1DtLista_126id);
if(videosEnLista432mtemp == null){
%>
<%=videosEnLista432mtemp %>
<%
}else{
        String tempreturnp433 = null;
        if(videosEnLista432mtemp != null){
        java.util.List listreturnp433= java.util.Arrays.asList(videosEnLista432mtemp);
        tempreturnp433 = listreturnp433.toString();
        }
        %>
        <%=tempreturnp433%>
        <%
}
break;
case 447:
        gotMethod = true;
        String arg0_132id=  request.getParameter("arg0450");
        int arg0_132idTemp  = Integer.parseInt(arg0_132id);
        java.lang.String findDuenioLista447mtemp = sampleWebServicesProxyid.findDuenioLista(arg0_132idTemp);
if(findDuenioLista447mtemp == null){
%>
<%=findDuenioLista447mtemp %>
<%
}else{
        String tempResultreturnp448 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(findDuenioLista447mtemp));
        %>
        <%= tempResultreturnp448 %>
        <%
}
break;
case 452:
        gotMethod = true;
        String arg0_133id=  request.getParameter("arg0465");
            java.lang.String arg0_133idTemp = null;
        if(!arg0_133id.equals("")){
         arg0_133idTemp  = arg0_133id;
        }
        WS.DtLista seleccionarLista452mtemp = sampleWebServicesProxyid.seleccionarLista(arg0_133idTemp);
if(seleccionarLista452mtemp == null){
%>
<%=seleccionarLista452mtemp %>
<%
}else{
%>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">returnp:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">privado:</TD>
<TD>
<%
if(seleccionarLista452mtemp != null){
%>
<%=seleccionarLista452mtemp.isPrivado()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">defecto:</TD>
<TD>
<%
if(seleccionarLista452mtemp != null){
%>
<%=seleccionarLista452mtemp.isDefecto()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">nombre:</TD>
<TD>
<%
if(seleccionarLista452mtemp != null){
java.lang.String typenombre459 = seleccionarLista452mtemp.getNombre();
        String tempResultnombre459 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typenombre459));
        %>
        <%= tempResultnombre459 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">categoria:</TD>
<TD>
<%
if(seleccionarLista452mtemp != null){
java.lang.String typecategoria461 = seleccionarLista452mtemp.getCategoria();
        String tempResultcategoria461 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typecategoria461));
        %>
        <%= tempResultcategoria461 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">id:</TD>
<TD>
<%
if(seleccionarLista452mtemp != null){
%>
<%=seleccionarLista452mtemp.getId()
%><%}%>
</TD>
</TABLE>
<%
}
break;
case 467:
        gotMethod = true;
        sampleWebServicesProxyid.seguirUsuario();
break;
case 470:
        gotMethod = true;
        java.lang.String[] listarCategorias470mtemp = sampleWebServicesProxyid.listarCategorias();
if(listarCategorias470mtemp == null){
%>
<%=listarCategorias470mtemp %>
<%
}else{
        String tempreturnp471 = null;
        if(listarCategorias470mtemp != null){
        java.util.List listreturnp471= java.util.Arrays.asList(listarCategorias470mtemp);
        tempreturnp471 = listreturnp471.toString();
        }
        %>
        <%=tempreturnp471%>
        <%
}
break;
}
} catch (Exception e) { 
%>
Exception: <%= org.eclipse.jst.ws.util.JspUtils.markup(e.toString()) %>
Message: <%= org.eclipse.jst.ws.util.JspUtils.markup(e.getMessage()) %>
<%
return;
}
if(!gotMethod){
%>
result: N/A
<%
}
%>
</BODY>
</HTML>