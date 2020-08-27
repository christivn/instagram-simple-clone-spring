<%@page import="clases.eliminar"%>
<%
    if(session.getAttribute("nick")!=null){
        String foto=request.getParameter("foto");
        out.print(foto);
        eliminar.foto(foto);
        out.print("<script>window.location.replace('perfil.jsp?nombre="+session.getAttribute("nick")+"');</script>");
    } else {
        out.print("<script>window.location.replace('index.jsp;</script>");
    }
    
%>