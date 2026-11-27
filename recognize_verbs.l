%{
#include <stdio.h>
int count = 0;
%}

%%
is|am|are|were|was|be|being|been|do|does|did|will|would|should|can|could|has|have|had|go {
    printf("VERB: %s\n", yytext);
    count++;
}
[A-Za-z]+       ;
.|\n            ;
%%

int yywrap(void) { return 1; }

int main(void) {
    yylex();
    printf("Verbs recognised: %d\n", count);
    return 0;
}
