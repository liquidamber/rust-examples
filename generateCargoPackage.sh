cat <<EOS
[package]
name = "rust-example-rs"
version = "0.1.0"
authors = ["liquid_amber <liquid_amber@liquid.amber.ja@gmail.com>"]
EOS

for i in $@; do
	cat <<EOS

[[bin]]
name = "`basename $i .rs`"
path = "$i"
EOS
done
