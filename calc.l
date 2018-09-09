%{
#include "y.tab.h"
void yyerror(char *);
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

%%
[ \t]+ ;
[0-9]+ {yylval = atoi(yytext); return INTEGER;} 
\- return MINUS;
\* return MULTIPLY;
\+ return PLUS;
\/ return DIVIDE;
\^ return POWER;
[\n] return NEWLINE;
[()] return *yytext;
. yyerror("invalid charachter found!");
%%

int yywrap() {return 1;}
