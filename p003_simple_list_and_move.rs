// Copyright (c) 2014 liquid_amber
// This file is distributed under MIT license.
// See LICENSE file.

enum SimpleList<T> {
    Cons(T, Box<SimpleList<T>>),
    Nil,
}

fn length<T>(xs: &SimpleList<T>) -> int {
    match xs {
        &Cons(_, box ref ys) => 1 + length(ys),
        &Nil => 0,
    }
}

fn main() {
    let mut xs = box Nil;
    xs = box Cons(3i, xs);
    xs = box Cons(2, xs);
    xs = box Cons(1, xs);
    let ys = xs;
    println!("{}", length(&*ys)); // OK
    // xs is moved. It will be compiler error.
    // println!("{}", length(xs)); // NG!
}
