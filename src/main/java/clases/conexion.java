package clases;

import java.sql.Connection;
import java.sql.DriverManager;

public class conexion {

    Connection con;
    public conexion(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mysql://localhost/proyectojsp?user=root&password=");
        } catch (Exception e){
            System.err.println("Error: "+e);
        }
    }

}
