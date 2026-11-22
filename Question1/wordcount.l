
%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>

/* Counters for the words and their total character count */
unsigned long long word_count = 0;
unsigned long long total_size = 0;
%}

%%

[A-Za-z]+    {
                 word_count++;
                 total_size += yyleng;
             }

.|\n         {
                 /* Ignore whitespace, digits and punctuation */
             }

%%

int main(int argc, char *argv[])
{
    /* Ensure that the user supplies an input filename */
    if (argc != 2)
    {
        fprintf(stderr, "Usage: %s <input_file>\n", argv[0]);
        return EXIT_FAILURE;
    }

    /* Open the supplied text file */
    yyin = fopen(argv[1], "r");

    if (yyin == NULL)
    {
        perror("Error opening input file");
        return EXIT_FAILURE;
    }

    /* Start lexical analysis */
    yylex();

    /* Close the input file */
    fclose(yyin);

    /* Display the results */
    printf("Total words: %llu\n", word_count);
    printf("Total size of words: %llu characters\n", total_size);

    return EXIT_SUCCESS;
}

