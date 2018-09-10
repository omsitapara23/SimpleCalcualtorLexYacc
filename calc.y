%{
#include <stdio.h>
#include <math.h>
void yyerror(char *);
int yylex(void);
int sym_tab[26];
%}

%token INTEGER
%token VARIABLE
%token NEWLINE
%token PLUS
%token MINUS
%token DIVIDE
%token MULTIPLY
%token POWER
%token EXIT
%left PLUS MINUS
%left MULTIPLY DIVIDE
%right POWER

%%

program : program stmt NEWLINE
        |	
	;

stmt : exp 		{printf("%d\n", $1);}
     | VARIABLE '=' exp { sym_tab[$1] = $3;}
     |
     ;


exp : INTEGER 
    | VARIABLE 		{$$ = sym_tab[$1];} 
    | exp MINUS exp 	{$$ = $1 - $3;}
    | exp MULTIPLY exp	{$$ = $1 * $3;}
    | exp DIVIDE exp 	{$$ = $1 / $3;}
    | exp PLUS exp 	{$$ = $1 + $3;}
    | '(' exp ')'  	{$$ = $2;}
    | exp POWER exp 	{$$ = pow($1,$3);}
    | EXIT		{ return 0;}
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
