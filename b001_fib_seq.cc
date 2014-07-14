// Copyright (c) 2014 liquid_amber
// This file is distributed under MIT license.
// See LICENSE file.

#include <iostream>

int fibonacci(int n) {
  if( n < 2){
    return n;
  }
  return fibonacci(n - 1) + fibonacci(n - 2);
}

int main() {
  std::cout << fibonacci(40) << "\n";
  return 0;
}
