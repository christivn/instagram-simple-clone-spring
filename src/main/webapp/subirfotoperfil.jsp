<%@page import="clases.registro"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="java.nio.charset.Charset"%>
<%@page import="java.util.Random"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

 <% response.setHeader("Cache-Control","no-cache"); //HTTP 1.1 
 response.setHeader("Pragma","no-cache"); //HTTP 1.0 
 response.setDateHeader ("Expires", 0); //prevents caching at the proxy server  
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subiendo imagen...</title>
    </head>
    <body>
        <%
            String ruta="C:\\Users\\chris\\Dropbox\\Programación\\ProyectoJSP\\ProyectoJSP\\src\\main\\webapp\\img";
            
            DiskFileItemFactory factory=new DiskFileItemFactory();
            factory.setSizeThreshold(1024);
            
            factory.setRepository(new File(ruta));
            ServletFileUpload upload=new ServletFileUpload(factory);
               
            try{
                List<FileItem> partes=upload.parseRequest(request);
                File file=new File("");
                
                for(FileItem items:partes){
                    file=new File(ruta,items.getName());
                    items.write(file);
                }
                
                
                String extension=FilenameUtils.getExtension(file.getName().toString());
                if(!extension.equals("png") && !extension.equals("jpg") && !extension.equals("jpge")){
                    throw new Exception("El formato de archivo introducido no es válido");
                }
                
                SecureRandom random = new SecureRandom();
                String aleatorio = new BigInteger(130, random).toString(32);
                
                String path=file.getAbsolutePath().toString();
                path=path.replace(file.getName(),"");
                File f2 = new File(path+aleatorio+"."+extension);

                if (!file.renameTo(f2)) { out.println("error"); }
                
                String nick=session.getAttribute("nick").toString();
                registro.fotoPerfil(aleatorio+"."+extension,nick);

                out.print("<script>window.location.replace('perfil.jsp');</script>");
                
            }catch(Exception e){
                out.print("<script>window.location.replace('errores/subida_error.jsp');</script>");
            }

        %>
    </body>
</html>
