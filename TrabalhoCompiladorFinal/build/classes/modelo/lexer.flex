package modelo;

import java_cup.runtime.*;

%%
/*-*
 * LEXICAL FUNCTIONS:
 */

%cup
%line
%column
%unicode
%class MiniJavaLexer
%{
    private Token createToken(String val) {
        Token tk = new Token(val);
        return tk;
    }
%}


/*-*
 * PATTERN DEFINITIONS:
 */
//comentario = \{[^}]*\}
comentario = \/[^\/]*\/
identificador = [a-zA-z][a-zA-z0-9]*
inteiro = [0-9]+
whitespace = [ \n\t]
newline = [\r\n]

%%
/**
 * LEXICAL RULES:
 */
""                      { return new Symbol(sym.VOID,createToken(yytext())); }
"{"             	{ return new Symbol(sym.ACH,createToken(yytext())); }
"}"             	{ return new Symbol(sym.FCH,createToken(yytext())); }
"."             	{ return new Symbol(sym.PTO,createToken(yytext())); }
"!"             	{ return new Symbol(sym.NEG,createToken(yytext())); }
"["             	{ return new Symbol(sym.ACO,createToken(yytext())); }
"]"             	{ return new Symbol(sym.FCO,createToken(yytext())); }
","             	{ return new Symbol(sym.VIR,createToken(yytext())); }
"&&"                    { return new Symbol(sym.AND,createToken(yytext())); }
"||"              	{ return new Symbol(sym.OR,createToken(yytext())); }
"*"             	{ return new Symbol(sym.TIMES,createToken(yytext())); }
"+"             	{ return new Symbol(sym.PLUS,createToken(yytext())); }
"-"             	{ return new Symbol(sym.MINUS,createToken(yytext())); }
"/"             	{ return new Symbol(sym.DIVIDE,createToken(yytext())); }
";"             	{ return new Symbol(sym.SEMI,createToken(yytext())); }
"("             	{ return new Symbol(sym.LEFT_PAREN,createToken(yytext())); }
")"             	{ return new Symbol(sym.RT_PAREN,createToken(yytext())); }
"=="             	{ return new Symbol(sym.EQ,createToken(yytext())); }
"<"             	{ return new Symbol(sym.LESS,createToken(yytext())); }
">"             	{ return new Symbol(sym.GTR,createToken(yytext())); }
"<="            	{ return new Symbol(sym.LESS_EQ,createToken(yytext())); }
">="            	{ return new Symbol(sym.GTR_EQ,createToken(yytext())); }
"!="            	{ return new Symbol(sym.NOT_EQ,createToken(yytext())); }
"="                     { return new Symbol(sym.ASSMNT,createToken(yytext())); }

class            	{ return new Symbol(sym.CLA,createToken(yytext())); }
boolean             	{ return new Symbol(sym.BOO,createToken(yytext())); }
extends             	{ return new Symbol(sym.EXT,createToken(yytext())); }
public             	{ return new Symbol(sym.PUB,createToken(yytext())); }
static             	{ return new Symbol(sym.STA,createToken(yytext())); }
void             	{ return new Symbol(sym.VOI,createToken(yytext())); }
main             	{ return new Symbol(sym.MAI,createToken(yytext())); }
String             	{ return new Symbol(sym.STR,createToken(yytext())); }
return             	{ return new Symbol(sym.RET,createToken(yytext())); }
while             	{ return new Symbol(sym.WHI,createToken(yytext())); }
System.out.println      { return new Symbol(sym.SOP,createToken(yytext())); }
length             	{ return new Symbol(sym.LEN,createToken(yytext())); }
true             	{ return new Symbol(sym.TRU,createToken(yytext())); }
false             	{ return new Symbol(sym.FAL,createToken(yytext())); }
this             	{ return new Symbol(sym.THI,createToken(yytext())); }
new             	{ return new Symbol(sym.NEW,createToken(yytext())); }
null             	{ return new Symbol(sym.NUL,createToken(yytext())); }
else            	{ return new Symbol(sym.ELSE,createToken(yytext())); }
if              	{ return new Symbol(sym.IF,createToken(yytext())); }

{identificador}    	{ return new Symbol(sym.IDENT,createToken(yytext())); }
{inteiro}          	{ return new Symbol(sym.INT,createToken(yytext())); }
{comentario}       	{ /* For this stand-alone lexer, print out comments. */
			System.out.println("Recognized comment: " + yytext()); }
{whitespace}            { /* Ignore whitespace. */ }
{newline}               { /* Ignore whitespace. */ }
