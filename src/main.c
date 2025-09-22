#include <stdio.h>
#include "../include/mystrfunctions.h"
#include "../include/myfilefunctions.h"

int main() {
    printf("--- Testing String Functions ---\n");
    char src[] = "hello";
    char dest[20];

    printf("Length of '%s' = %d\n", src, mystrlen(src));
    mystrcpy(dest, src);
    printf("Copy: %s\n", dest);
    mystrcat(dest, " world");
    printf("Concat: %s\n", dest);

    printf("\n--- Testing File Functions ---\n");
    FILE* f = fopen("test.txt", "r");
    if (f) {
        int lines, words, chars;
        if (wordCount(f, &lines, &words, &chars) == 0) {
            printf("Lines: %d, Words: %d, Chars: %d\n", lines, words, chars);
        }
        fclose(f);
    } else {
        printf("Cannot open test.txt\n");
    }

    return 0;
}

