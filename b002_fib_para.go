package main

import (
		"fmt";
)

func fib(n int) int {
	if n < 2 {
		return n
	}
	ch1 := make(chan int)
	ch2 := make(chan int)
	go func(){
		ch1 <- fib(n - 1)
	}()
	go func(){
		ch2 <- fib(n - 2)
	}()
	r1 := <- ch1
	r2 := <- ch2
	return r1 + r2
}

func main() {
	ans := fib(40)
	fmt.Printf("%i\n", ans)
}
