/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analizadorphp;

import java.io.File;

/**
 *
 * @author danil
 */
public class AnalizadorPHP {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String path = "C:/Users/danil/Desktop/Proyecto de LFA/AnalizadorPHP/src/analizadorphp/Expresiones.flex";
        generarLexer(path);
        vista abrir = new vista();
        abrir.setVisible(true);
    }
    public static void generarLexer(String path){
        File file = new File(path);
        jflex.Main.generate(file);
    }
}
