// Copyright (c) 2014 liquid_amber
// This file is distributed under MIT license.
// See LICENSE file.

fn to_fizz_buzz(i: int) -> (int, &str) {
    let message = match i {
        _ if i % 15 == 0 => "FizzBuzz",
        _ if i % 3 == 0 => "Fizz",
        _ if i % 5 == 0 => "Buzz",
        _ => ""
    };
    (i, message)
}

fn print_elem((i, x): (int, &str)) {
    let istr = i.to_str();
    std::io::stdio::println(if x == "" { istr.as_slice() } else { x });
}

fn fizz_buzz(n: int, m: int) {
    // It can be compiled, but none was printed !!
    // range(n, m).map(to_fizz_buzz).map(print_elem);
    for ix in range(n, m).map(to_fizz_buzz) {
        print_elem(ix);
    }
}

fn main() {
    fizz_buzz(1, 20);
}
