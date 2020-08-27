package clases;

import java.sql.SQLException;
import java.sql.Statement;

public class registro {

    public static void usuario(String nick, String email, String hash) {
        conexion cn=new conexion();
        try {
            Statement st=cn.con.createStatement();
            int i=st.executeUpdate("insert into usuarios(nick,email,pass,foto)values('"+nick+"','"+email+"','"+hash+"','img/default.png')");
        } catch(SQLException e) {}
    }
    
    public static void fotoPerfil(String nombrefoto,String nick) {
        conexion cn=new conexion();
        try {
            Statement st=cn.con.createStatement();
            int i=st.executeUpdate("update usuarios set foto='img/"+nombrefoto+"' where nick='"+nick+"'");
        } catch(SQLException e) {}
    }
    
    public static void foto(String nick,String foto,String fecha) {
        conexion cn=new conexion();
        try {
            Statement st=cn.con.createStatement();
            int i=st.executeUpdate("insert into fotos(nick,foto,fecha)values('"+nick+"','img/"+foto+"','"+fecha+"')");
        } catch(SQLException e) {}
    }

}
