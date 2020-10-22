/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Principal;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.logging.Level;
import java_cup.runtime.Scanner;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            String[] archivo  = new String[1];
            archivo[0] = "Codigo.loop";
            AnalizadorLexico.main(archivo);
            ArrayList <Simbolos> sim = AnalizadorLexico.sim;
            EscribirenFichero es = new EscribirenFichero();
            es.escribir(sim);
        } catch (Exception ex) {
            System.out.println("entro2");
            System.out.println("ERROR: "+ex.getMessage());
        }
    }
    
}
