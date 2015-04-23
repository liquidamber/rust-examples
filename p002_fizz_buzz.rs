// Copyright (c) 2014 liquid_amber
// This file is distributed under MIT license.
// See LICENSE file.

fn to_fizz_buzz(i: i32) -> (i32, &'static str) {
    let message = match i {
        _ if i % 15 == 0 => "FizzBuzz",
        _ if i % 3 == 0 => "Fizz",
        _ if i % 5 == 0 => "Buzz",
        _ => ""
    };
    (i, message)
}

fn print_elem((i, x): (i32, &str)) {
    if x == "" {
        println!("{}", i.to_string());
    }else{
        println!("{}", x);
    }
}

fn fizz_buzz(n: i32, m: i32) {
    (n..m).map(to_fizz_buzz).map(print_elem).count();
}

fn main() {
    fizz_buzz(1, 20);
}
