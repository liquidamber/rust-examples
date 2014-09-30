package main

import (
		"fmt";
)

func fib(n int) int {
	if n < 2 {
		return n
	}
	r1 := fib(n - 1)
	r2 := fib(n - 2)
	return r1 + r2
}

func main() {
	ans := fib(40)
	fmt.Printf("%i\n", ans)
}
