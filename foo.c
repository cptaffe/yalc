#include "foo.h"

static int slen(char *s);

int slen(char *s) {
  int c;

  c = 0;
  while (*s++)
    c++;

  return c;
}

int echo(int n, char *v[], int(callback)(int f, char *b, int c)) {
  int i, err;

  for (i = 1; i < n; i++)
    if ((err = callback(1, v[i], slen(v[i]))) < 0)
      return err;

  return 0;
}
