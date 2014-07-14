// Copyright (c) 2014 liquid_amber
// This file is distributed under MIT license.
// See LICENSE file.

extern crate green;

#[start]
fn start(argc: int, argv: *const *const u8) -> int {
    green::start(argc, argv, green::basic::event_loop, main)
}

fn fibonacci(n: int) -> int {
    if n < 2 {
        return n;
    }
    let (sink_, source) = channel();
    {
        let sink = sink_.clone();
        spawn(proc() {
            sink.send(fibonacci(n - 2))
        });
    }
    {
        let sink = sink_.clone();
        spawn(proc() {
            sink.send(fibonacci(n - 1))
        });
    }
    source.recv() + source.recv()
}

fn main() {
    println!("{}", fibonacci(10));
}
