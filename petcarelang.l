%{
#include "petcarelang.tab.h"  // Inclui o arquivo gerado pelo Bison
%}

%%
[0-9]+                { yylval = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]* { return IDENTIFIER; }
"pet"                 { return PET; }
"{"                   { return LBRACE; }
"}"                   { return RBRACE; }
";"                   { return SEMICOLON; }
[ \t\n]+              { /* Ignora espaços em branco */ }
.                     { return *yytext; }
%%

int yywrap() { return 1; }
