// Copyright (c) 2014 liquid_amber
// This file is distributed under MIT license.
// See LICENSE file.

enum SimpleList<T> {
    Cons(T, Box<SimpleList<T>>),
    Nil,
}

fn length<T>(xs: &SimpleList<T>) -> i32 {
    match xs {
        &SimpleList::Cons(_, ref ys) => 1 + length(ys),
        &SimpleList::Nil => 0,
    }
}

fn main() {
    let mut xs = Box::new(SimpleList::Nil);
    xs = Box::new(SimpleList::Cons(3, xs));
    xs = Box::new(SimpleList::Cons(2, xs));
    xs = Box::new(SimpleList::Cons(1, xs));
    let ys = xs;
    println!("{}", length(&*ys)); // OK
    // xs is moved. It will be compiler error.
    // println!("{}", length(xs)); // NG!
}
