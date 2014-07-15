// Copyright (c) 2014 liquid_amber
// This file is distributed under MIT license.
// See LICENSE file.

#include <iostream>
#include <cilk/cilk.h>

int fibonacci(int n) {
  if(n < 2){
    return n;
  }
  int n1 = cilk_spawn fibonacci(n - 1);
  int n2 = fibonacci(n - 2);
  cilk_sync;
  return n1 + n2;
}

int main() {
  std::cout << fibonacci(40) << "\n";
  return 0;
}
