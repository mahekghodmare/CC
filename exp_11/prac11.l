%{
#include "y.tab.h"
#include <stdlib.h>
#include <string.h>
%}

%%
[0-9]+      { yylval.str = strdup(yytext); return NUM; }
"+"         { return '+'; }
"-"         { return '-'; }
"*"         { return '*'; }
[ \t\n]     ;
.           { return yytext[0]; }
%%

int yywrap()
{
    return 1;
}
