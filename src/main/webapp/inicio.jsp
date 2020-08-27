<%
    if(session.getAttribute("nick")!=null){
        out.print("<script>window.location.replace('perfil.jsp');</script>");
    }
%>

<%@page import="clases.comprobar"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.security.MessageDigest"%>
<!doctype html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" type="image/png" href="https://image.flaticon.com/icons/png/512/87/87390.png">
    <title>Inicio de sesión</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/sign-in/">

    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/signin.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
  </head>

<body class="text-center">

<form class="form-signin" method="post" action="inicio.jsp">
  <img class="mb-4" src="https://image.flaticon.com/icons/png/512/87/87390.png" alt="" width="72" height="72">
  <h1 class="h3 mb-3 font-weight-normal">Iniciar Sesión</h1>

  <label for="inputEmail" class="sr-only">Nick</label>
  <input type="text" name="nick" class="form-control" placeholder="Nickname" required autofocus>

  <label for="inputPassword" class="sr-only">Contraseña</label>
  <input type="password" name="pass" class="form-control" placeholder="Contraseña" required>

  <button class="btn btn-lg btn-primary btn-block" type="submit">Iniciar</button>
  <a href="registro.jsp" class="badge">Registrar una cuenta</a>

  <p class="mt-5 mb-3 text-muted">By Christian Ramos</p>
  
  
  <% 
    if(request.getParameter("nick")!=null && request.getParameter("pass")!=null){
        String nick=request.getParameter("nick");
        String pass=request.getParameter("pass");
        
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] hash_array = digest.digest(pass.getBytes(StandardCharsets.UTF_8));
        String hash=new String(hash_array);
        
        if(comprobar.login(nick,hash)){
                session.setMaxInactiveInterval(60*999999);
                session.setAttribute("nick", nick);
            out.print("<script>window.location.replace('perfil.jsp');</script>");
        } else {
            out.print("<script>window.location.replace('errores/login_error.jsp');</script>");
        }
    }
%>
</form>


<script src="js/bootstrap.js"></script>
</body>
</html>
