<%@page import="clases.comprobar"%>
<%@page import="clases.obtener"%>
<%@page import="java.sql.Statement"%>
<%@page import="clases.conexion"%>

 <% response.setHeader("Cache-Control","no-cache"); //HTTP 1.1 
 response.setHeader("Pragma","no-cache"); //HTTP 1.0 
 response.setDateHeader ("Expires", 0); //prevents caching at the proxy server  
%>

<%
    if(request.getParameter("nombre")==null){
        out.print("<script>window.location.replace('perfil.jsp?nombre="+session.getAttribute("nick")+"');</script>");
    }
%>

<html lang="es" >
<head>
  <meta charset="UTF-8">
  <title>Perfil - <%= request.getParameter("nombre") %></title>
  <link rel="icon" type="image/png" href="https://image.flaticon.com/icons/png/512/87/87390.png">
  <link href="css/modal.css" rel="stylesheet">
  <link href="css/navbar.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Lobster+Two|Poppins" rel="stylesheet">
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"><link rel="stylesheet" href="css/style.css">
</head>
<body>
<header>
  <h1> <i class="fa fa-instagram" aria-hidden="true"></i> ProyectoJSP</h1>
  <div class="header-links">
    <ul>
        <nav style="margin-right:15px;margin-top:-3px;">
            <form class="form-inline" method="post" action="buscar.jsp">
            <input class="form-control mr-sm-2" type="search" placeholder="Buscar..." aria-label="Search" name="buscar">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="display:none;">Buscar</button>
        </form>
        </nav>
          
    </ul>
    <ul>
      <%
      if(session.getAttribute("nick")!=null){
          out.print("<a href='salir.jsp'><button style='width:100px;background-color:#ad3128;'>Cerrar sesión</button></a>");
      } else {
          out.print("<li><a href='inicio.jsp'>Iniciar</a></li><li><a href='registro.jsp'>Registrarse</a></li>");
      }
      %>
    </ul>
  </div> 
</header>

<section class="profile">
    <%
        if(session.getAttribute("nick")!=null){
            if(comprobar.usuario(request.getParameter("nombre"))){
                String imagen=obtener.fotoPerfil(request.getParameter("nombre").toString());
                out.print("<img class='avatar' src='"+imagen+"' />");
            } else {
                out.print("<img class='avatar' src='img/default.png' />");
            }
        } else {
            if(comprobar.usuario(request.getParameter("nombre"))){
                String imagen=obtener.fotoPerfil(request.getParameter("nombre").toString());
                out.print("<img class='avatar' src='"+imagen+"' />");
            } else {
                out.print("<img class='avatar' src='img/default.png' />");
            }
        }
    %>
  
  <div class="profile-info">

        <!-- Modal -->
        <div class="modal fade" id="fotoperfil" tabindex="-1" role="dialog" aria-labelledby="fotoperfil" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" style="font-size:15px;" id="exampleModalLongTitle">Subir Foto de Perfil</h5>
                    <button type="button" class="close" style="color:black;font-size:20px;background-color:transparent;" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form method="post" enctype="multipart/form-data" action="subirfotoperfil.jsp">
                <div class="modal-body">
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="file" name="file">
                            <label class="custom-file-label" for="customFile"></label>
                        </div>
                </div>
                
                <div class="modal-footer" style="border-top:0px">
                    <button type="submit" class="btn btn-primary">Subir</button>
                </div>
                </form>
            </div>
        </div>
        </div>
        
        
        <!-- Modal -->
        <div class="modal fade" id="foto" tabindex="-1" role="dialog" aria-labelledby="fotoperfil" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" style="font-size:15px;" id="exampleModalLongTitle">Subir Foto</h5>
                    <button type="button" class="close" style="color:black;font-size:20px;background-color:transparent;" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form method="post" enctype="multipart/form-data" action="subirfoto.jsp">
                <div class="modal-body">
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="file" name="file">
                            <label class="custom-file-label" for="customFile"></label>
                        </div>
                </div>
                
                <div class="modal-footer" style="border-top:0px">
                    <button type="submit" class="btn btn-primary">Subir</button>
                </div>
                </form>
            </div>
        </div>
        </div>
        
        <!-- Modal -->
        <div class="modal fade" id="eliminar" tabindex="-1" role="dialog" aria-labelledby="fotoperfil" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" style="font-size:15px;" id="exampleModalLongTitle">Eliminar Foto</h5>
                    <button type="button" class="close" style="color:black;font-size:20px;background-color:transparent;" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                    <br><center><p>¿Estás seguro de que quieres eliminar esta foto?</p></center>
                
                <div class="modal-footer" style="border-top:0px">
                      <form method="post" action="eliminar.jsp">
                        <input type="hidden" value="nada" name="foto" id="foto_eliminar">
                        <button type="submit" class="btn btn-danger" style="background-color:#AD3128;">Eliminar</button>
                     </form>
                </div>
            </div>
        </div>
        </div>

      
      <%
      try{
          
      if(session.getAttribute("nick")!=null){
        if(request.getParameter("nombre").equals(session.getAttribute("nick").toString())){
            out.print("<h1 style='padding-bottom:10px;'>@"+session.getAttribute("nick")+"</h1>");
            out.print("<button style='width:180px;' data-toggle='modal' data-target='#fotoperfil'>Cambiar imagen de perfil</button> <button  style='width:100px;' data-toggle='modal' data-target='#foto'>Subir foto</button>");
        } else {
          out.print("<h1 style='padding-bottom:20px;padding-top:1.5vw;'>@"+request.getParameter("nombre")+"</h1>");
      }
      } else {
          out.print("<h1 style='padding-bottom:20px;padding-top:1.5vw;'>@"+request.getParameter("nombre")+"</h1>");
      }
      
      } catch (Exception e){
        out.print("<script>window.location.replace('index.jsp');</script>");
      }
      %>
      

  </div>
</section>
    
<section class="gallery">
    
    <%
        if(!comprobar.usuario(request.getParameter("nombre"))){
            out.print("<center><h2>El usuario que estás buscando no existe.</h2></center><br>");
        }
    %>
    
    <%
        if(comprobar.usuario(request.getParameter("nombre"))){
        String[] galeria=obtener.galeria(request.getParameter("nombre"));
        if(galeria.length!=0){
        for(int i=0;i<galeria.length;i++){
            if(session.getAttribute("nick")!=null && request.getParameter("nombre").equals(session.getAttribute("nick").toString())){
               out.print("<style>.image-container:hover {cursor:pointer!important;}</style>");
               out.print("<script>function eliminar(){document.getElementById('foto_eliminar').value='"+galeria[i]+"';}</script>");
               out.print("<div onclick='eliminar()' class='image-container tooltip' data-toggle='modal' data-target='#eliminar'><span class='tooltiptext'>Eliminar</span>");
            } else {
                out.print("<div class='image-container container'>");
            }
            out.print("<img src='"+galeria[i]+"'/></div>");
        }
        } else {
            out.print("<center><h2>Este usuario aún no ha publicado nada.</h2></center><br>");
        }
        }
    %>
   
</section>

    <footer>2020 By <b>Christian Ramos</b></footer>
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
  <script  src="js/script.js"></script>
  <script  src="js/bootstrap.min.js"></script>
  
<script>
// Add the following code if you want the name of the file appear on select
$(".custom-file-input").on("change", function() {
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});
</script>

</body>
</html>
