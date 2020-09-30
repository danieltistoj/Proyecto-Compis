package Principal;

%%

%class Decimales
%standalone 
%line
%column


Oct=[0-7]
punto = "."
O = "o"
NoOc= [7-9]

/*Octales Entero*/
OCTAL = {Oct}+{O}
NoOc = ({O}+{Oct}+{O} | {O}+{NoOc}+{Oct}+{O})

/*Octales Decimal*/
OCTALD = {Oct}+{punto}{Oct}+{O}
NoOc = ({Oct}+{punto}{Oct}+{O}+ | {O}{Oct}+{punto}{Oct}+{O}+ | {Oct}+{punto}+{Oct}+{O})

%%

{OCTAL} {
                System.out.println("NUMERO BINARIO ENTERO " + yytext());
            }
{NoOc} {
                System.out.println("NUMERO BINARIO ENTERO " + yytext());
            }
{OCTALD} {
                System.out.println("NUMERO BINARIO DECIMAL " + yytext());
            }
. {}