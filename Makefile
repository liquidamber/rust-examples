RUSTC ?= rustc
RUSTFLAGS ?= -g

SRCS := $(wildcard *.rs)
EXES := $(SRCS:%.rs=bin/%)

.PHONY: all clean

all: $(EXES)

clean:
	$(RM) -r $(EXES:%=%*)

bin/%: %.rs
	$(RUSTC) $(RUSTFLAGS) -o $@ $<
