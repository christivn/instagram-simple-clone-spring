package clases;

import java.sql.SQLException;
import java.sql.Statement;

public class eliminar {
    
    public static void foto(String foto) {
        conexion cn=new conexion();
        try {
            Statement st=cn.con.createStatement();
            int i=st.executeUpdate("delete from fotos where foto='"+foto+"'");
        } catch(SQLException e) {}
    }
    
}