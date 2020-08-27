<%
    try{
        session.invalidate(); 
        response.sendRedirect("index.jsp");
    } catch(Exception e){
        out.print("<script>window.location.replace('index.jsp');</script>");
    }
%>