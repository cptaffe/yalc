#include "c.h"
#include "foo.h"

int main(int argc, char *argv[]) {
  echo(argc, argv, write);
  exit(0);
}
