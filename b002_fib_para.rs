// Copyright (c) 2014 liquid_amber
// This file is distributed under MIT license.
// See LICENSE file.

fn fibonacci(n: i32) -> i32 {
    let n_ = n;
    if n < 2 {
        n
    } else {
        let n1 = std::thread::spawn(
            move || { fibonacci(n - 1) } );
        let n2 = std::thread::spawn(
            move || { fibonacci(n_ - 2) } );
        n1.join().unwrap() + n2.join().unwrap()
    }
}

fn main() {
    println!("{}", fibonacci(40));
}
