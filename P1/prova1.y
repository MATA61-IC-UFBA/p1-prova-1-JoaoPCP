%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern int yyparse();
void yyerror(const char *msg);

%}

%token ERROR
%token NUMBER
%token IDENT
%token ASSIGN
%token LPAREN
%token RPAREN
%token PRINT
%token STRING

%left '+' '-'
%left '*' '/'

%start program

%%

/* programa */
program
: stmt_list 
;

stmt_list
: stmt
| stmt_list stmt
;

stmt
: IDENT ASSIGN expr
| PRINT LPAREN exprlist RPAREN
| expr
;

exprlist
    : expr
    | exprlist ',' expr
    ;

expr
: NUMBER
| STRING
| IDENT
| IDENT LPAREN exprlist RPAREN
| expr '+' expr
| expr '-' expr
| expr '*' expr
| expr '/' expr
| LPAREN expr RPAREN
;

%%

