%{
#include<stdio.h>

int keywords = 0;
int identifiers = 0;
int comments = 0;
int words = 0;
int lines = 0;
int spaces = 0;

char *kw[] = {
    "auto","break","case","char","const","continue","default","do",
    "double","else","enum","extern","float","for","goto","if","int",
    "long","register","return","short","signed","sizeof","static",
    "struct","switch","typedef","union","unsigned","void","volatile","while"
};

int isKeyword(char *str)
{
    int i;
    for(i = 0; i < 32; i++)
    {
        if(strcmp(str, kw[i]) == 0)
            return 1;
    }
    return 0;
}
%}

ID      [a-zA-Z_][a-zA-Z0-9_]*
WORD    [a-zA-Z0-9_]+

%%

"//".*                          { comments++; }
"/*"([^*]|\*+[^*/])*\*+"/"      { comments++; }

\n                              { lines++; }
[ \t]                           { spaces++; }

{ID}                            {
                                    words++;
                                    if(isKeyword(yytext))
                                        keywords++;
                                    else
                                        identifiers++;
                                }

{WORD}                          { words++; }

.                               ;

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter the input (Press Ctrl+D to stop):\n\n");
    yylex();

    printf("\n----- RESULT -----\n");
    printf("Comments    : %d\n", comments);
    printf("Keywords    : %d\n", keywords);
    printf("Identifiers : %d\n", identifiers);
    printf("Words       : %d\n", words);
    printf("Lines       : %d\n", lines + 1);
    printf("Spaces      : %d\n", spaces);

    return 0;
}
