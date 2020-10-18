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
            AnalizadorLexico lex = new AnalizadorLexico(new FileReader("Codigo.txt"));  
            Sintactico sintactico = new Sintactico((Scanner) lex);
            sintactico.parse();
            ArrayList <Simbolos> sim = lex.sim;
            EscribirenFichero es = new EscribirenFichero();
            es.escribir(sim);
        } catch (FileNotFoundException ex) {
            System.out.println("entro");
            java.util.logging.Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            System.out.println("entro2");
            java.util.logging.Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
