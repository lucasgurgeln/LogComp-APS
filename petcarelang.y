%{
#include <stdio.h>
void yyerror(const char *s);
extern int yylex();
%}

%token NUMBER IDENTIFIER PET LBRACE RBRACE SEMICOLON

%%
program:
    statements
    ;

statements:
    statement
    | statements statement
    ;

statement:
    PET IDENTIFIER LBRACE RBRACE SEMICOLON
    ;

%%

void yyerror(const char *s) {
  extern int yylineno;
  fprintf(stderr, "%s na linhaa %d/n", s, yylineno);
}

int main(void) {
  printf("Digite seu programa:\n");
  yyparse();
  return 0;
}

