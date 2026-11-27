# Question 1(i): Word Counter

This LEX program reads a text file, counts the words, and calculates the total number of characters in those words. It uses `[A-Za-z]+` to identify words and `yyleng` to determine their character lengths.

**To compile and run:**
```bash
flex wordcount.l
gcc lex.yy.c -o wordcount
./wordcount test_inputs/traffic_report.txt
```

The program displays the total number of words and the total number of characters.
