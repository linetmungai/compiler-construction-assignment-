%{
#include <stdio.h>
%}

%%
is|am|are|were|was|be|being|been|do|does|did|will|would|should|can|could|has|have|had|go   {
    printf("Verb recognized: %s\n", yytext);
}

[a-zA-Z]+   {
    printf("Not a target verb: %s\n", yytext);
}

[ \t\r\n]+  { /* Ignore whitespace */ }
.           { /* Ignore punctuation and digits */ }
%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}