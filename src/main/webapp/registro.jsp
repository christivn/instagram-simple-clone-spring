<%@page import="clases.registro"%>
<%
    if(session.getAttribute("nick")!=null){
        out.print("<script>window.location.replace('perfil.jsp');</script>");
    }
%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="clases.comprobar"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.security.MessageDigest"%>
<!doctype html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" type="image/png" href="https://image.flaticon.com/icons/png/512/87/87390.png">
    <title>Registro</title>
    
    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/sign-in/">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <script src="js/bootstrap.js"></script>
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

<form id="registro" class="form-signin" method="post" action="registro.jsp">
  <img class="mb-4" src="https://image.flaticon.com/icons/png/512/87/87390.png" alt="" width="72" height="72">
  <h1 class="h3 mb-3 font-weight-normal">Registro</h1>
  
  <label for="inputNick" class="sr-only">Nick</label>
  <input type="text" name="nick" class="form-control" placeholder="Nick" required>

  <label for="inputEmail" class="sr-only">Correo Electrónico</label>
  <input type="email" name="email" class="form-control" placeholder="Correo Electrónico" required autofocus>

  <label for="inputPassword" class="sr-only">Contraseña</label>
  <input type="password" name="pass" class="form-control" placeholder="Contraseña" required>

  <button class="btn btn-lg btn-primary btn-block" type="submit">Registrar</button>

  <p class="mt-5 mb-3 text-muted">By Christian Ramos</p>
  
  <% 
    if(request.getParameter("email")!=null && request.getParameter("pass")!=null && request.getParameter("nick")!=null){
        String email=request.getParameter("email");
        String pass=request.getParameter("pass");
        String nick=request.getParameter("nick");
        
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] hash_array = digest.digest(pass.getBytes(StandardCharsets.UTF_8));
        String hash=new String(hash_array);
        
        if(comprobar.nick_email(nick,email)){
        if(comprobar.nombre(nick) && comprobar.email(email) && comprobar.pass(pass)){
            
                //Class.forName("com.mysql.jdbc.Driver");
                //Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/proyectojsp?user=root&password=");
                
                //PreparedStatement p1 = conexion.prepareStatement("insert into usuarios (nick,email,pass,foto) values ('"+nick+"','"+email+"','"+hash+"'),'img/default.png'");
                //int result = p1.executeUpdate();
                //conexion.close();
                
                registro.usuario(nick, email, hash);
                
                String nombre = request.getParameter("nick");
                session.setMaxInactiveInterval(60*999999);
                session.setAttribute("nick", nombre);
                
            out.print("<script>window.location.replace('index.jsp');</script>");
        } else {
            out.print("<script>window.location.replace('errores/registro_error.jsp');</script>");
        }
        
        } else {
            out.print("<script>window.location.replace('errores/registro_error_existe.jsp');</script>");
        }
    }
%>
</form>


</body>
</html>



