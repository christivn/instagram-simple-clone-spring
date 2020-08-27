<%@page import="clases.comprobar"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.security.MessageDigest"%>
<!doctype html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Error de subida</title>
    
    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/sign-in/">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <script src="../js/bootstrap.js"></script>
    <link href="../css/bootstrap.css" rel="stylesheet">
    <link href="../css/signin.css" rel="stylesheet">

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
    
<form class="form-signin">
  <img class="mb-4" src="https://image.flaticon.com/icons/png/512/87/87390.png" alt="" width="72" height="72">
  <h1 class="h3 mb-3 font-weight-normal">Ha habido un fallo con la subida</h1>
  
  <div class="list-group">
  <div class="list-group-item list-group-item-action flex-column align-items-start">
    <p class="mb-1">Puede que el formato del archivo sea incorrecto.</p>
  </div>
      
  <br>
  <a style="text-decoration:none;" href="../inicio.jsp"><button class="btn btn-lg btn-primary btn-block" type="button">Intentar de nuevo</button></a>

  <p class="mt-5 mb-3 text-muted">By Christian Ramos</p>
</form>


</body>
</html>



