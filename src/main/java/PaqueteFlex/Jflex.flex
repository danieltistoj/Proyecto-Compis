package Principal;
import java.util.ArrayList;
import java_cup.runtime.Symbol;

%%
%class AnalizadorLexico
%standalone 
%line
%column
%cup
// %eofval{
//   System.out.println("Fin de archivo encontrado");
//   return new Symbol(sym.EOF);
// %eofval}
%eofval{
  return new Symbol(sym.EOF);
%eofval}

/*INRGESO DE CODIGO (FUNCION QUE CUENTA LOS SIMBOLOS)*/
%{

public int tabulaciones;
public ArrayList<Simbolos> sim;

public void add(String nuevo) {

        boolean bandera = false;
        String a = nuevo;
       
        int numero = 0;
        if (sim.size() == 0) {
            Simbolos sim2 = new Simbolos();
            sim2.setCantidad(1);
            sim2.setValor(a);
            sim.add(sim2);
        } else {
            
            for (int x = 0; x < sim.size(); x++) {
                    
                Simbolos sim1 = sim.get(x);

                if (sim1.getValor().equals(a)) {
                    bandera = true;
                    numero = x;

                    x = sim.size();
                } else {
                    bandera = false;
                }
            }

            if (bandera == true) {
               
                Simbolos val = sim.get(numero);
                int n = val.getCantidad();
                n = n + 1;
                val.setCantidad(n);
                sim.remove(numero);
                sim.add(val);
                   
            } else {
              
                Simbolos sim2 = new Simbolos();
                sim2.setCantidad(1);
                sim2.setValor(a);
                sim.add(sim2);
            }
        }  
    }
%}
/*INIT*/
%init{
    this.sim = new ArrayList<>();
    this.tabulaciones = 0;
%init}
%eofclose

/*  PALABRAS RESERVADAS  */

    clase = "clase" | "Clase"
    propiedades = "Propiedades"
    metodos = "Metodos"
    tipo_de_metodos = "Publica"|"Publico"|"Privada"|"Privados"|"Protegidos"|"Protegidas"
    tipo_clase = "Impar"|"Par"

    /*  PALABRAS RESERVADAS TIPOS DATO Y FUNCIONES */

    tipo_entero = "entero" 
    tipo_cadena = "cadena"
    tipo_real = "real"
    tipo_booleano = "booleano"
    tipo_nulo = "nulo"

    /*  PALABRAS RESERVADAS DE IFS */

    if = "si"
    entonces = "entonces"
    sino = "sino"
    /*  PALABRAS RESERVADAS LECTURA Y ESCRITURA */

    leer = "leer"
    escribir = "escribir"

    /*  PALABRAS RESERVADAS CICLO, FUNCIONES, ETC */

    devolver = "devolver"
    constructor = "Constructor"
    destructor = "Destructor"
    principal = "principal"
    instanciar = "instanciar"
    desde = "desde"
    mientras = "mientras"
    incrementar = "incrementar"
    decrementar = "decrementar"
    hacer = "hacer"
    extiende = "extiende"
    eliminar ="Eliminar"
    incluir = "incluir"
    nuevo = "nuevo"
    
    /*Signos*/
    verdadero = "verdadero"
    falso = "falso"
    parentesis1 = "("
    parentesis2 = ")"
    coma = ","
    suma = "+"
    resta = "-"
    multiplicacion = "*"
    division = "/"
    modulo = "%"
    exponente = "ˆ"
    igual = "="
    incremento = "++"
    decremento = "--"
    and = "AND" 
    or = "OR"
    mayorQue = ">"
    menorQue = "<"
    igualQue = "=="
    distintoQue = "!="
    dosPuntos = ":"
    corchete1 = "["
    corchete2 = "]"
    punto = "."

    /*   TIPOS DE DATOS  */

    numeroDecimale = [1-9][0-9]* | 0
    numeroReal = [0-9]*[.][0-9]+[1-9]
    booleano = [verdadero|falso]
    cadena = ["\""]([a-zA-Z]*[0-9]*["\ "]*)*["\""]
    comentarios = ["$"]([a-zA-Z]|[0-9]|["\ "]|["="]|["+"]|["-"]|["*"]|["/"]|["%"]|["."]|["_"]|["("]|[")"]|["["]|["]"])*["$"]

    /*   REGLAS EXTRAS */

    tabulacion = ["\ "]{4}|\t
    variables = [a-z]+{reglas_variablesextra}
    reglas_variablesextra = [[a-z]|[0-9]|[A-Z]]*|[[a-z]|[0-9]|[A-Z]]* "_" [[a-z]|[0-9]|[A-Z]]+
    excepciones_variables = [a-z]+[[a-z]|[0-9]|[A-Z]]* "_"  | [A-Z]+ {variables}
    variables_clase = [A-Z]+{reglas_variablesextra}
    excepciones_variables_clase = [a-z]+[[a-z]|[0-9]|[A-Z]]* "_"

    /*Funcion especial*/
    cadenaEntero = "cadenaAEntero"
    cadenaReal = "cadenaAReal"
    cadenaBooleano = "cadenaABoleano"
    seno = "seno"
    coseno = "coseno"
    tangente = "tangente"
    logaritmo = "logaritmo"
    raiz = "raiz"

    /*   IGNORAR  */
    findelinea = \n|\r|\r\n
    ignorar = \n|\r\n|\r\n|"\ "
   
%%
{comentarios}
        {   
            this.add("COMENTARIO");
        }

    {punto}
        {   
            this.add("PUNTO");
            return new Symbol(sym.SIGNOS);
        }

    {nuevo}
        {   
          this.add("NUEVO");  
          return new Symbol(sym.FUNCIONES_CLICLOS_ETC);
        }

    {tipo_booleano}
        {   
          this.add("TIPO BOOLEANO ");
          return new Symbol(sym.TIPO_DATO);
          
        }

    {tipo_cadena}
        {   
            this.add("TIPO CADENA");
            return new Symbol(sym.TIPO_DATO);
        }

    {tipo_entero}
        {   
            this.add("TIPO ENTERO");
            return new Symbol(sym.TIPO_DATO);
        }

    {tipo_real}
        {   
            this.add("TIPO REAL");
            return new Symbol(sym.TIPO_DATO);
        }

    {tipo_nulo}
        {   
            this.add("TIPO NULO");
            
        }

   {raiz} 
        {   
            this.add("RAIZ");
           return new Symbol(sym.FUNCION_ESPECIAL);
        }

    {logaritmo}
        {   
            this.add("LOGARTIMO");
            return new Symbol(sym.FUNCION_ESPECIAL);
        }

    {tangente}
        {   
            this.add("TANGENTE");
            return new Symbol(sym.FUNCION_ESPECIAL);
        }

    {coseno}
        {  
            this.add("COSENO");
            return new Symbol(sym.FUNCION_ESPECIAL);
        }

    {seno}
        {  
            this.add("SENO");
            return new Symbol(sym.FUNCION_ESPECIAL);
        }

    {cadenaBooleano}
        {   
            this.add("CADENA:BOOLEANO");
            return new Symbol(sym.FUNCION_ESPECIAL);
        }

    {cadenaReal}
        {   
            this.add("CADENA:REAL");
            return new Symbol(sym.FUNCION_ESPECIAL);
        }

    {cadenaEntero}
        {   
            this.add("CADENA:ENTERO");
            return new Symbol(sym.FUNCION_ESPECIAL);
        }

    {corchete2}
        {   
            this.add("CORCHETE 2");
            return new Symbol(sym.SIGNOS);
        }

    {corchete1}
        { 
           this.add("CORCHETE 1");
           return new Symbol(sym.SIGNOS);
        }

    {dosPuntos}
        {   
            this.add("DOS PUNTOS");
            return new Symbol(sym.DOS_PUNTOS);
        }

    {distintoQue}
        {   
            this.add("DISTINTO QUE");
            return new Symbol(sym.SIGNOS);
        }

    {igualQue}
        {   
            this.add("IGUAL QUE");
            return new Symbol(sym.SIGNOS);
        }

    {menorQue}
        {   
            this.add("MENOR QUE");
            return new Symbol(sym.SIGNOS);
        }

    {mayorQue}
        {   
            this.add("MAYOR QUE");
            return new Symbol(sym.SIGNOS);
        }

    {or}
        {  
            this.add("OR");
            return new Symbol(sym.SIGNOS);
        }

    {and}
        {   
            this.add("AND");
            return new Symbol(sym.SIGNOS);
        }

    {decremento}
        {   
            this.add("DECREMENTO");
            return new Symbol(sym.SIGNOS);
        }

    {incremento}
        {   
            this.add("INCREMENTO");
            return new Symbol(sym.SIGNOS);
        }

    {igual}
        {   
            this.add("IGUAL");
            return new Symbol(sym.SIGNOS);
        }

    {exponente}
        {   
            this.add("EXPONENTE");
            return new Symbol(sym.SIGNOS);
        }

    {modulo}
        {   
            this.add("MODULO");
            return new Symbol(sym.SIGNOS);
        }

    {division}
        {   
            this.add("DIVISION");
            return new Symbol(sym.SIGNOS);
        }

    {multiplicacion}
        {   
            this.add("MULTIPLICACION");
            return new Symbol(sym.SIGNOS);
        }

    {resta}
        {   
            this.add("RESTA");
            return new Symbol(sym.SIGNOS);
        }

    {suma}
        {   
            this.add("RESTA");
            return new Symbol(sym.SIGNOS);
        }

    {coma}
        {   
            this.add("COMA");
            return new Symbol(sym.COMA);
        }

    {parentesis1}
        {   
            this.add("PARENTESIS (");
            return new Symbol(sym.PARENTESIS1);
        }

    {parentesis2}
        {   
            this.add("PARENTESIS )");
            return new Symbol(sym.PARENTESIS2);
        }
    {falso} 
        {
            this.add("FALSO");
            return new Symbol(sym.SIGNOS);
        }
    {verdadero} 
        {
           this.add("VERDADERO");
           return new Symbol(sym.SIGNOS);
        }

    {tabulacion}
        {   
           this.tabulaciones++; 
        }

    {incluir}
        {  
            this.add("INCLUIR");
            return new Symbol(sym.FUNCIONES_CLICLOS_ETC);
        }
    {eliminar}
        {   
            this.add("ELIMINAR"); 
            return new Symbol(sym.FUNCIONES_CLICLOS_ETC);
        }

    {extiende}
        {  
            this.add("EXTIENDE"); 
            return new Symbol(sym.FUNCIONES_CLICLOS_ETC);
        }

    {hacer}
        {  
            this.add("HACER"); 
            return new Symbol(sym.FUNCIONES_CLICLOS_ETC);
        }

    {decrementar}
        {  
            this.add("DECREMAR"); 
            return new Symbol(sym.FUNCIONES_CLICLOS_ETC);
        }

    {incrementar}
        {  
            this.add("INCREMENTAR"); 
            return new Symbol(sym.FUNCIONES_CLICLOS_ETC);
        }

    {mientras}
        {  
            this.add("MIENTRAS"); 
            return new Symbol(sym.FUNCIONES_CLICLOS_ETC);
        }

    {desde}
        {  
            this.add("DESDE"); 
            return new Symbol(sym.FUNCIONES_CLICLOS_ETC);
        }

    {instanciar}
        {  
            this.add("INSTANCIAR"); 
            return new Symbol(sym.FUNCIONES_CLICLOS_ETC);
        }

    {principal}
        {  
            this.add("PRINCIPAL"); 
            return new Symbol(sym.FUNCIONES_CLICLOS_ETC);
        }

    {destructor}
        {  
            this.add("DESTRUCTOR"); 
            return new Symbol(sym.FUNCIONES_CLICLOS_ETC);
        }

    {constructor}
        {  
            this.add("CONSTRUCTOR"); 
            return new Symbol(sym.TIPO_DATO);
        }

    {devolver}
        {  
            this.add("DEVOLVER"); 
            return new Symbol(sym.FUNCIONES_CLICLOS_ETC);
        }

    {escribir}
        {  
            this.add("ESCRIBIR"); 
        }

    {leer}
        {  
            this.add("LEER"); 
        }

    {sino}
        {  
            this.add("SINO"); 
        }

    {entonces}
        {  
            this.add("ENCONCES"); 
        }

    {if}
        {  
            this.add("IF"); 
        }

    {clase}
        {  
            this.add("CLASE");
            return new Symbol(sym.CLASE);
        }

    {propiedades}
        {  
            this.add("PROPIEDADES"); 
            return new Symbol(sym.PROPIEDADES);
        }

    {metodos}
        {  
            this.add("METODOS");
            return new Symbol(sym.METODOS);
        }

    {tipo_de_metodos}
        {  
            this.add("TIPO DE PROPIEDAD");
            return new Symbol(sym.TIPO_DE_METODOS);
            
        }
    {tipo_clase} 
        { 
         
        }
    {booleano}
        {  
            this.add("TIPO BOOLEANO"); 
        }

    {numeroReal}
        {  
            this.add("NUMEROS REALES"); 
        }

    {numeroDecimale}
        {  
            this.add("NUMEROS DECIMALES"); 
        }

    {cadena}
        {  
            this.add("TIPO_DATO_CUP"); 
        }

    {excepciones_variables_clase}
        {  
            this.add("ERROR"); 
            
        }

    {variables_clase}
        {  
            this.add("VARIABLE CLASE");
            return new Symbol(sym.VARIABLE_CLASE);
        }

    {excepciones_variables}
        {  
            this.add("ERROR"); 
        }

    {variables}
        {  
            this.add("VARIABLE"); 
            return new Symbol(sym.VARIABLE);
        }

    {findelinea}     
        {  
          
        }

    {ignorar}     
        {  
            //this.tabulacion = 0; 
        }
. {
      System.err.println("Error Léxico \"" + yytext() + "\" ["+ (yyline+1) + ":"+ (yycolumn+1) + ":"+ yychar + "]");
   }
