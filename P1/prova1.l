%{
#include "prova1.tab.h"
#include <stdlib.h>
#include <string.h>

void yyerror(const char *msg);
int yylex();
%}

%option noyywrap

%%

"//".*      
[0-9][0-9]* { return NUMBER;}
[ \t\r\n]+    /* ignora espaços em branco e tabs */
"("          {return LPAREN;}
")"          {return RPAREN;}
"print"      {return PRINT;}
"="          {return ASSIGN;}
[a-zA-Z_][a-zA-Z0-9_]* { return IDENT; }
\"[^\"]*\"     { return STRING; }
[-+*/,]       { return yytext[0]; }   
.            { return ERROR; }

%%
