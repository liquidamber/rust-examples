RUSTC ?= rustc
RUSTFLAGS ?= -g --opt-level=3

CXXFLAGS ?= -std=c++11 -g -O3
LIBS ?= -lpthread

CILK_CXX ?= g++-4.9
CILK_FLAGS ?= -fcilkplus
CILK_LIBS ?= -lcilkrts

GHC ?= ghc
GHCFLAGS ?= -O3 -Wall

SRCS_RS := $(wildcard *.rs)
EXES_RS := $(SRCS_RS:%.rs=bin/%_rs)

SRCS_CC := $(filter-out %.cilk.cc,$(wildcard *.cc))
EXES_CC := $(SRCS_CC:%.cc=bin/%_cc)

SRCS_CILK := $(wildcard *.cilk.cc)
EXES_CILK := $(SRCS_CILK:%.cilk.cc=bin/%_cilk)

SRCS_HS := $(wildcard *.hs)
EXES_HS := $(SRCS_HS:%.hs=bin/%_hs)

EXES := $(EXES_RS) $(EXES_CC) $(EXES_CILK) $(EXES_HS)

.PHONY: all clean

all: $(EXES)

clean:
	$(RM) -r $(EXES:%=%*)

bin/%_rs: %.rs
	$(RUSTC) $(RUSTFLAGS) -o $@ $<

bin/%_cc: %.cc
	$(CXX) $(CXXFLAGS) -o $@ $< $(LDFLAGS) $(LIBS)

bin/%_cilk: %.cilk.cc
	$(CILK_CXX) $(CXXFLAGS) $(CILK_FLAGS) -o $@ $< $(LDFLAGS) $(LIBS) $(CILK_LIBS)

bin/%_hs: %.hs
	$(GHC) $(GHCFLAGS) -o $@ $< -outputdir=$@.tmp
