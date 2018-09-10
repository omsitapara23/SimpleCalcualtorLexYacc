#!/bin/bash
echo "Running Calc (enter 'exit' or 'EXIT' to exit the calc) : "
yacc -d calc.y
lex calc.l
cc lex.yy.c y.tab.c -ll -lm
./a.out

