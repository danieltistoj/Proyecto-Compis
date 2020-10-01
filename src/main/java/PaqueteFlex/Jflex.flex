package Principal;

%%

%class AnalizadorLexico
%standalone 
%line
%column


/*%  PALABRAS RESERVADAS  */

    clase = "Clase"
    propiedades = "Propiedades"
    metodos = "Metodos"
    tipo_propiedades_metodos = "Publicas"|"Publicos"|"Privadas"|"Privados"|"Protegidos"|"Protegidas"

    /*%  PALABRAS RESERVADAS TIPOS DATO Y FUNCIONES */

    tipo_entero = "entero"
    tipo_cadena = "cadena"
    tipo_real = "real"
    tipo_booleano = "booleano"
    tipo_nulo = "nulo"

    /*%  PALABRAS RESERVADAS DE IFS */

    if = "si"|"Si"
    entonces = "entonces"|"Entonces"
    sino = "sino"|"Sino"
    /*%  PALABRAS RESERVADAS LECTURA Y ESCRITURA */

    leer = "Leer"|"leer"
    escribir = "Escribir"|"escribir"
    /*%  PALABRAS RESERVADAS CICLO, FUNCIONES, ETC */

    devolver = "devolver"
    constructor = "Constructor"|"constructor"
    destructor = "Destructor"|"destructor"
    principal = "principal"|"Principal"
    instanciar = "instanciar"
    desde = "desde"|"Desde"
    mientras = "mientras"|"Mientras"
    incrementar = "incrementar"|"Incrementar"
    decrementar = "decrementar"|"Decrementar"
    hacer = "hacer"|"Hacer"
    extiende = "extiende"|"Extiende"
    eliminar ="Eliminar"|"eliminar"
    incluir = "incluir"|"Incluir"
    nuevo = "nuevo"

    /*%   TIPOS DE DATOS  */

    numerosDecimales = [1-9][0-9]* | 0
    numerosReales = [0-9]*[.][0-9]+[1-9]
    booleano = "verdadero"|"falso"
    cadena = ["\""]([a-zA-Z]*[0-9]*["\ "]*)*["\""]
    comentarios = ["#"]([a-zA-Z]*[0-9]*["\ "]*["="]*["+"]*["-"]*["*"]*["/"]*["%"]*["."]*["_"]*["("]*[")"]*["["]*["]"]*)*

%%

{clase} {
                System.out.println("NUMERO BINARIO ENTERO " + yytext());
            }
. {}