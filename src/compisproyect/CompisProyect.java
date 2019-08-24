/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compisproyect;

import java.io.File;
/**
 *
 * @author herma
 */
public class CompisProyect {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        String path ="casdad";
        File file = new File(path);
        jflex.Main.generate(file);
    }
    
}
