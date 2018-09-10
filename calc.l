%{
#include "y.tab.h"
void yyerror(char *);
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

%%
[0-9]+ {yylval = atoi(yytext); return INTEGER;} 
(exit|EXIT) return EXIT;
[a-z][a-z]+ yyerror("invalid charachter found!");
[a-z] {yylval = *yytext - 'a'; return VARIABLE;}
\- return MINUS;
\* return MULTIPLY;
\+ return PLUS;
\/ return DIVIDE;
\^ return POWER;
[\n] return NEWLINE;
[()] return *yytext;
[=] return *yytext;
[ \t]+ ;
. yyerror("invalid charachter found!");
%%

int yywrap() {return 1;}
