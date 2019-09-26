/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package compisproyect;

import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author herma
 */
public class Sintaxis {
    int numero = 0;
    String token ="";
    boolean validado = true;
    List<String> tokens;
    String validando2="";
    
// <editor-fold defaultstate="collapsed" desc="Funciones y metodos">
 public Sintaxis(List<String> ListaTokens)
   {
       tokens = ListaTokens;
       token = getToken();
       Truncate();
       retorno();
   }
   public void match(String tokenValidar)
   {
       if(tokenValidar.compareTo(token)==0)
       {
           validando2 = validando2 + token;
           token = getToken();
       }
       else  
       {
           validado = false;
       }
       
   }
   public String getToken()
   {
       if (numero==0) {
           numero=numero+1;
           return tokens.get(numero-1);
       }
       else
       {
           numero=numero+1;
           return tokens.get(numero-1);
       }
   }

// </editor-fold>
    
    
    
   // <editor-fold defaultstate="collapsed" desc="Sintaxis Create">

   public void Create()
   {
       if (token.compareTo("CREATE")==0) 
       {
           match("CREATE");
           match("TABLE");
           match("Identificador");
           hacerTablas();
           Create();
       }
       
   }
   
   public void hacerTablas()
   {
       if (token.compareTo("(")==0) 
       {
           match("(");
           hacerAtributos();
           match(")");
       }
       else
       {
           match("(");
       }
           
       
   }
   public void hacerAtributos()
   {
       if (token.compareTo("Identificador")==0)
       {
           match("Identificador");
           match("INT");
           match("(");
           match("Entero");
           match(")");
       }
       
       
   }

// </editor-fold>
    
// <editor-fold defaultstate="collapsed" desc="Sintaxis Truncate">

// </editor-fold>
   
   
// <editor-fold defaultstate="collapsed" desc="Sintaxis TRUNCATE">
public void Truncate()
{
    if (token.compareTo("TRUNCATE")==0)
    {
        match("TRUNCATE");
        match("TABLE");
        TablasTruncate();
    }
}
public void TablasTruncate()
{
    if (token.compareTo("Identificador")==0) 
    {
         match("Identificador");
         TablasTruncate();
    }
   
    else if (token.compareTo(".")==0) 
    {
        match(".");
        TablasTruncate();
    }
}
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="DELETE">

// </editor-fold>
  public String retorno()
  {
      return validando2;
  }
   
   
}