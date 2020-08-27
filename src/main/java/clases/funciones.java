package clases;

import java.math.BigInteger;
import java.security.SecureRandom;

public class funciones {

    
    // Genera una cadena aleatoria de caracteres
    public static String generarCadena() {
        SecureRandom random = new SecureRandom();
        String text = new BigInteger(130, random).toString(32);
        return text;
    }
    
    
    

}
