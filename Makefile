RUSTC ?= rustc
RUSTFLAGS ?= -g --opt-level=3

CXXFLAGS ?= -std=c++11 -g -O3
LIBS ?= -lpthread

SRCS_RS := $(wildcard *.rs)
EXES_RS := $(SRCS_RS:%.rs=bin/%_rs)

SRCS_CC := $(wildcard *.cc)
EXES_CC := $(SRCS_CC:%.cc=bin/%_cc)

EXES := $(EXES_RS) $(EXES_CC)

.PHONY: all clean

all: $(EXES)

clean:
	$(RM) -r $(EXES:%=%*)

bin/%_rs: %.rs
	$(RUSTC) $(RUSTFLAGS) -o $@ $<

bin/%_cc: %.cc
	$(CXX) $(CXXFLAGS) -o $@ $< $(LDFLAGS) $(LIBS)
