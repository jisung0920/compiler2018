%{
  /* count number of chars, words, and lines. */
  int num_lines = 0;
  int num_chars = 0;
  int num_words = 0;
%}

/* definitions */
word	[^ \n\t]+
eol		\n
%%

{word} 	  { num_words++; num_chars += yyleng; }
{eol}     { num_lines++; num_chars++; }
.         { num_chars++; }

%%

int main() {
  yylex();
  printf("# of chars : %d\n", num_chars);
  printf("# of words : %d\n", num_words);
  printf("# of lines : %d\n", num_lines);
  return 0;
}