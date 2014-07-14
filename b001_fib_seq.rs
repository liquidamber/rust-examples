// Copyright (c) 2014 liquid_amber
// This file is distributed under MIT license.
// See LICENSE file.

extern crate time;

fn fibonacci(n: int) -> int {
    if n < 2 {
        n
    } else {
        fibonacci(n - 2) + fibonacci(n - 1)
    }
}

fn main() {
    let beg = time::precise_time_s();
    println!("{}", fibonacci(40));
    let end = time::precise_time_s();
    println!("time: {}s", end - beg);
}
