<%
    String nick=request.getParameter("buscar");
    out.print("<script>window.location.replace('perfil.jsp?nombre="+nick+"');</script>");
%>
