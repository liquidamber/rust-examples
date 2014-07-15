// Copyright (c) 2014 liquid_amber
// This file is distributed under MIT license.
// See LICENSE file.

extern crate green;
extern crate rustuv;

fn fibonacci(n: int) -> int {
    if n < 2 {
        n
    } else {
        let mut n1 = std::sync::Future::spawn(
            proc () fibonacci(n - 1));
        let mut n2 = std::sync::Future::spawn(
            proc () fibonacci(n - 2));
        n1.get() + n2.get()
    }
}

#[start]
fn start(argc: int, argv: *const *const u8) -> int {
    // I don't know the reason, however, green::basic::event_loop cause error.
    // task '<main>' failed at 'called `Result::unwrap()` on an `Err` value: invalid argument', /home/rustbuild/src/rust-buildbot/slave/nightly-linux/build/src/libcore/result.rs:545
    green::start(argc, argv, rustuv::event_loop, main)
}

fn main() {
    println!("{}", fibonacci(40));
}
