%{
#include <stdio.h>
#include <math.h>
void yyerror(char *);
int yylex(void);
%}

%token INTEGER
%token NEWLINE
%token PLUS
%token MINUS
%token DIVIDE
%token MULTIPLY
%token POWER
%left PLUS MINUS
%left MULTIPLY DIVIDE
%right POWER

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
    | exp POWER exp {$$ = pow($1,$3);}
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
