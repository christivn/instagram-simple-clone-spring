package clases;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class obtener {

    public static String fotoPerfil(String nick) {
        conexion cn=new conexion();
        String img="";
        
        Statement st;
        ResultSet rs;
        try {
            st=cn.con.createStatement();
            rs=st.executeQuery("select foto from usuarios where nick='"+nick+"'");
            while(rs.next()){
                img=rs.getString("foto");
            }
            cn.con.close();
        } catch(SQLException e) {}
        return img;
    }
    
    
    public static String[] galeria(String nick) {
        conexion cn=new conexion();
        ArrayList<String> fotos=new ArrayList<>();
        
        Statement st;
        ResultSet rs;
        try {
            st=cn.con.createStatement();
            rs=st.executeQuery("select foto from fotos where nick='"+nick+"' order by fecha desc");
            while(rs.next()){
                fotos.add(rs.getString("foto"));
            }
            cn.con.close();
        } catch(SQLException e) {}
        
        String img[]=new String[fotos.size()];
        for(int i=0;i<fotos.size();i++){
            img[i]=fotos.get(i);
        }
        return img;
    }

}
