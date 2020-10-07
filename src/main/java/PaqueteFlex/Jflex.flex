package Principal;

%%
%class AnalizadorLexico
%standalone 
%line
%column


/*%  PALABRAS RESERVADAS  */

    clase = "clase"
    propiedades = "Propiedades"
    metodos = "Metodos"
    tipo_de_metodos = "Publica"|"Publico"|"Privada"|"Privados"|"Protegidos"|"Protegidas"

    /*%  PALABRAS RESERVADAS TIPOS DATO Y FUNCIONES */

    tipo_entero = "entero" 
    tipo_cadena = "cadena"
    tipo_real = "real"
    tipo_booleano = "booleano"
    tipo_nulo = "nulo"

    /*%  PALABRAS RESERVADAS DE IFS */

    if = "si"
    entonces = "entonces"
    sino = "sino"
    /*%  PALABRAS RESERVADAS LECTURA Y ESCRITURA */

    leer = "leer"
    escribir = "escribir"
    /*%  PALABRAS RESERVADAS CICLO, FUNCIONES, ETC */

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

    /*%   TIPOS DE DATOS  */

    numeroDecimale = [1-9][0-9]* | 0
    numeroReal = [0-9]*[.][0-9]+[1-9]
    booleano = [verdadero|falso]
    cadena = ["\""]([a-zA-Z]*[0-9]*["\ "]*)*["\""]
    comentario = ["$"]([a-zA-Z]|[0-9]|["\ "]|["="]|["+"]|["-"]|["*"]|["/"]|["%"]|["."]|["_"]|["("]|[")"]|["["]|["]"])*["$"]

/*Funcion espacial*/
    seno = "seno"
    coseno = "coseno"
    tangente = "tangente"
    logaritmo = "logaritmo"
   
%%

{clase} {
                System.out.println("NUMERO BINARIO ENTERO " + yytext());
            }
{comentarios} {
                System.out.println("COMENTARIO " + yytext());
            }

. {}