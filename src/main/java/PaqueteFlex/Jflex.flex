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
        }

    {nuevo}
        {   
          this.add("NUEVO");  
        }

    {tipo_booleano}
        {   
          this.add("TIPO BOOLEANO ");
          System.out.println(yytext()+(yyline+1));
          
        }

    {tipo_cadena}
        {   
            this.add("TIPO CADENA");
        }

    {tipo_entero}
        {   
            this.add("TIPO ENTERO");
        }

    {tipo_real}
        {   
            this.add("TIPO REAL");
        }

    {tipo_nulo}
        {   
            this.add("TIPO NULO");
        }

   {raiz} 
        {   
            this.add("RAIZ");
        }

    {logaritmo}
        {   
            this.add("LOGARTIMO");
        }

    {tangente}
        {   
            this.add("TANGENTE");
        }

    {coseno}
        {  
            this.add("COSENO");
        }

    {seno}
        {  
            this.add("SENO");
        }

    {cadenaBooleano}
        {   
            this.add("CADENA:BOOLEANO");
        }

    {cadenaReal}
        {   
            this.add("CADENA:REAL");
        }

    {cadenaEntero}
        {   
            this.add("CADENA:ENTERO");
        }

    {corchete2}
        {   
            
        }

    {corchete1}
        { 

        }

    {dosPuntos}
        {   
            this.add("DOS PUNTOS");
            return new Symbol(sym.DOS_PUNTOS);
        }

    {distintoQue}
        {   
            this.add("DISTINTO QUE");
        }

    {igualQue}
        {   
            this.add("IGUAL QUE");
        }

    {menorQue}
        {   
            this.add("MENOR QUE");
        }

    {mayorQue}
        {   
            this.add("MAYOR QUE");
        }

    {or}
        {  
            this.add("OR");
        }

    {and}
        {   
            this.add("AND");
        }

    {decremento}
        {   
            this.add("DECREMENTO");
        }

    {incremento}
        {   
            this.add("INCREMENTO");
        }

    {igual}
        {   
            this.add("IGUAL");
        }

    {exponente}
        {   
            this.add("EXPONENTE");
        }

    {modulo}
        {   
            this.add("MODULO");
        }

    {division}
        {   
            this.add("DIVISION");
        }

    {multiplicacion}
        {   
            this.add("MULTIPLICACION");
        }

    {resta}
        {   
            this.add("RESTA");
        }

    {suma}
        {   
            this.add("RESTA");
        }

    {coma}
        {   
            this.add("COMA");
        }

    {parentesis1}
        {   

        }

    {parentesis2}
        {   

        }

    {tabulacion}
        {   
           this.tabulaciones++; 
        }

    {incluir}
        {  
            this.add("INCLUIR");
        }
    {eliminar}
        {   
            this.add("ELIMINAR");
        }

    {extiende}
        {  
            this.add("EXTIENDE"); 
        }

    {hacer}
        {  
            this.add("HACER"); 
        }

    {decrementar}
        {  
            this.add("DECREMAR"); 
        }

    {incrementar}
        {  
            this.add("INCREMENTAR"); 
        }

    {mientras}
        {  
            this.add("MIENTRAS"); 
        }

    {desde}
        {  
            this.add("DESDE"); 
        }

    {instanciar}
        {  
            this.add("INSTANCIAR"); 
        }

    {principal}
        {  
            this.add("PRINCIPAL"); 
        }

    {destructor}
        {  
            this.add("DESTRUCTOR"); 
        }

    {constructor}
        {  
            this.add("CONSTRUCTOR"); 
        }

    {devolver}
        {  
            this.add("DEVOLVER"); 
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
            return new Symbol(sym.METODO);
        }

    {tipo_de_metodos}
        {  
            this.add("TIPO DE PROPIEDAD"); 
            return new Symbol(sym.TIPO_DE_METODOS);
        }
    {tipo_clase} 
        { 
         return new Symbol(sym.TIPO_CLASE);
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
        }

    {excepciones_variables}
        {  
            this.add("ERROR"); 
        }

    {variables}
        {  
            this.add("VARIABLE"); 
        }

    {findelinea}     
        {  
            return new Symbol(sym.NUEVA_LINEA);
        }

    {ignorar}     
        {  
            //this.tabulacion = 0; 
        }
. {
      System.err.println("Error Léxico \"" + yytext() + "\" ["+ (yyline+1) + ":"+ (yycolumn+1) + ":"+ yychar + "]");
   }
