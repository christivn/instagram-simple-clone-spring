package clases;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.sql.ResultSet;
import java.sql.Statement;

public class comprobar {

    
    // Comprueba la longitud del nombre, y que no haya caracteres extraños con una expresión regular
    public static boolean nombre(String nick) {
      String regex = "^([aA-zZ]){3,10}$";
      return nick.matches(regex);
    }
    

    // Comprueba que el email sea correcto con una expresión regular
    public static boolean email(String email) {
      String regex = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
      return email.matches(regex);
   }
    
    
    // Comprueba la longitud de la contraseña
    public static boolean pass(String pass) {
        boolean check=true;
        if(pass.length()<6){check=false;}
        return check;
    }
    
    
    // Comprueba que el nick y emails no existan en la BD
    public static boolean nick_email(String nick, String email) {
        conexion cn=new conexion();
        boolean check=true;
        
        Statement st;
        ResultSet rs;
        try {
            st=cn.con.createStatement();
            rs=st.executeQuery("select * from usuarios");
            
            String nombre;
            String correo;
            while(rs.next()){
                nombre=rs.getString("nick");
                if(nombre.equals(nick)){
                    check=false;
                }
                
                correo=rs.getString("email");
                if(correo.equals(email)){
                    check=false;
                }
            }
            cn.con.close();
            
        } catch (Exception e) {
            System.err.println("Error: "+e);
            check=false;
        }
        return check;
    }
    
    
    // Comprueba que el nick y el hash de la contraseña son los mismos que en la BD
    public static boolean login(String nick, String pass) {
        conexion cn=new conexion();
        boolean check=false;
        
        Statement st;
        ResultSet rs;
        try {
            st=cn.con.createStatement();
            rs=st.executeQuery("select nick,pass from usuarios");
            
            String nombre;
            String contras;
            int cont=0;
            while(rs.next()){
                nombre=rs.getString("nick");
                contras=rs.getString("pass");
                
                MessageDigest digest = MessageDigest.getInstance("SHA-256");
                byte[] hash_array = digest.digest(pass.getBytes(StandardCharsets.UTF_8));
                String hash=new String(hash_array);
                
                if(contras.equals(pass)){
                    cont++;
                }
            }
            if(cont!=0){
                check=true;
            }
            cn.con.close();
            
        } catch (Exception e) {
            System.err.println("Error: "+e);
            check=false;
        }

        return check;
    }
    
    
    // Comprueba si un usuario existe
    public static boolean usuario(String nick) {
        conexion cn=new conexion();
        boolean check=false;

        Statement st;
        ResultSet rs;
        try {
            st=cn.con.createStatement();
            rs=st.executeQuery("select nick from usuarios where nick='"+nick+"'");
            
            String nombre;
            while(rs.next()){
                nombre=rs.getString("nick");
                if(nombre.equals(nick)){
                    check=true;
                }
            }
            cn.con.close();
            
        } catch (Exception e) {
            System.err.println("Error: "+e);
            check=false;
        }

        return check;
    }
    
}
