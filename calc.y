%{
#include <stdio.h>
void yyerror(char *);
int yylex(void);
%}

%token INTEGER
%token NEWLINE
%token PLUS
%token MINUS
%token DIVIDE
%token MULTIPLY
%left PLUS MINUS
%left MULTIPLY DIVIDE

%%

program : program exp NEWLINE {printf(" the result is : %d\n", $2);}
	|
	;

exp : INTEGER {$$ = $1;}
    | exp MINUS exp {$$ = $1 - $3;}
    | exp MULTIPLY exp {$$ = $1 * $3;}
    | exp DIVIDE exp {$$ = $1 / $3;}
    | exp PLUS exp {$$ = $1 + $3;}
    | '(' exp ')'  {$$ = $2;}
    ;

%%

void yyerror(char *s) { 
    fprintf(stderr, "%s \n", s); 
} 

int main(void)
{
	yyparse();
	return 0;
}
