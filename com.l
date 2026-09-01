%{
#include <stdio.h>
%}

%%
.*COM$    { printf("Line ends with COM\n"); }
.*        { printf("Line does not end with COM\n"); }
\n        ;
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter the line: ");
    yylex();
    return 0;
}
