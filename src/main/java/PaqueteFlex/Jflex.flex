package Principal;

%%
%class AnalizadorLexico
%standalone 
%line
%column


/*  PALABRAS RESERVADAS  */

    clase = "clase"
    propiedades = "Propiedades"
    metodos = "Metodos"
    tipo_de_metodos = "Publica"|"Publico"|"Privada"|"Privados"|"Protegidos"|"Protegidas"

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
    findelinea = \n|\r|\rn
    ignorar = \n|\r\n|\r\n|"\ "
   
%%
{comentarios}
        {   
            System.out.println("COMENTARIO");
        }

    {punto}
        {   
           }

    {nuevo}
        {   
            }

    {tipo_booleano}
        {   
            }

    {tipo_cadena}
        {   
             }

    {tipo_entero}
        {   
             }

    {tipo_real}
        {   
            }

    {tipo_nulo}
        {   
            }

   {raiz} 
        {   
             }

    {logaritmo}
        {   
             }

    {tangente}
        {   
            }

    {coseno}
        {   
            }

    {seno}
        {   
             }

    {cadenaBooleano}
        {   
             }

    {cadenaReal}
        {   
             }

    {cadenaEntero}
        {   
        }

    {corchete2}
        {   
           }

    {corchete1}
        {   
           }

    {dosPuntos}
        {   
            }

    {distintoQue}
        {   
           }

    {igualQue}
        {   
             }

    {menorQue}
        {   
             }

    {mayorQue}
        {   
             }

    {or}
        {   
             }

    {and}
        {   
             }

    {decremento}
        {   
            }

    {incremento}
        {   
             }

    {igual}
        {   
             }

    {exponente}
        {   
           }

    {modulo}
        {   
             }

    {division}
        {   
         }

    {multiplicacion}
        {   
        }

    {resta}
        {   
             }

    {suma}
        {   
            }

    {coma}
        {   
              }

    {parentesis2}
        {   
             }

    {parentesis1}
        {   
              }

    {tabulacion}
        {   
             }

    {incluir}
        {   
             }
    {eliminar}
        {   
            }

    {extiende}
        {   
             }

    {hacer}
        {   
            }

    {decrementar}
        {   
             }

    {incrementar}
        {   
             }

    {mientras}
        {   
           }

    {desde}
        {   
        }

    {instanciar}
        {   
            }

    {principal}
        {   
        }

    {destructor}
        {   
        }

    {constructor}
        {   
        }

    {devolver}
        {   
          
        }

    {escribir}
        {   
        }

    {leer}
        {   
             }

    {sino}
        {   
             }

    {entonces}
        {   
            }

    {if}
        {   
        }

    {clase}
        {   
        }

    {propiedades}
        {   
        }

    {metodos}
        {   
        }

    {tipo_de_metodos}
        {   
           }

    {booleano}
        {   
             }

    {numeroReal}
        {   
          }

    {numeroDecimale}
        {   
          }

    {cadena}
        {   
            }

    {excepciones_variables_clase}
        {   
            
       }

    {variables_clase}
        {   
            
        }

    {excepciones_variables}
        {   
 
        }

    {variables}
        {   
           
        }

    {findelinea}     
        {
            
        }

    {ignorar}     
        {
           
        }
. {
      System.err.println("Error Léxico \"" + yytext() + "\" ["+ (yyline+1) + ":"+ (yycolumn+1) + ":"+ yychar + "]");
   }
