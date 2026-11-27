%{
#include <stdio.h>
int words = 0;
int chars = 0;
%}

%%
[A-Za-z0-9]+       { words++; chars += yyleng; }
[ \t\n]            ;
.                  ;
%%

int yywrap(void) { return 1; }

int main(void) {
    yylex();
    printf("Words: %d\n", words);
    printf("Total characters in words: %d\n", chars);
    return 0;
}
