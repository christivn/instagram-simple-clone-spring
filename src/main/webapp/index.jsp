<%
    boolean login;
    
    if(session.getAttribute("nick")==null){
        login=false;
    } else {
        login=true;
    }
    
    if(login){
        out.print("<script>window.location.replace('perfil.jsp');</script>");
    } else {
        out.print("<script>window.location.replace('inicio.jsp');</script>");
    }
%>