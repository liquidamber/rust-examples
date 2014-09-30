RUSTC ?= rustc
RUSTFLAGS ?= -g --opt-level=3

CXXFLAGS ?= -std=c++11 -g -O3
LIBS ?= -lpthread

CILK_CXX ?= g++-4.9
CILK_FLAGS ?= -fcilkplus
CILK_LIBS ?= -lcilkrts

GHC ?= ghc
GHCFLAGS ?= -O3 -Wall

GO ?= go

SRCS_RS := $(wildcard *.rs)
EXES_RS := $(SRCS_RS:%.rs=bin/%_rs)

SRCS_CC := $(filter-out %.cilk.cc,$(wildcard *.cc))
EXES_CC := $(SRCS_CC:%.cc=bin/%_cc)

SRCS_CILK := $(wildcard *.cilk.cc)
EXES_CILK := $(SRCS_CILK:%.cilk.cc=bin/%_cilk)

SRCS_GO := $(wildcard *.go)
EXES_GO := $(SRCS_GO:%.go=bin/%_go)

SRCS_HS := $(wildcard *.hs)
EXES_HS := $(SRCS_HS:%.hs=bin/%_hs)

EXES :=

ENABLE_RUST ?= 1
ENABLE_CC ?= 1
ENABLE_CILK ?= 1
ENABLE_GO ?= 1
ENABLE_HS ?= 1

ifeq ($(ENABLE_RUST),1)
EXES += $(EXES_RS)
endif

ifeq ($(ENABLE_CC),1)
EXES += $(EXES_CC)
endif

ifeq ($(ENABLE_CILK),1)
EXES += $(EXES_CILK)
endif

ifeq ($(ENABLE_GO),1)
EXES += $(EXES_GO)
endif

ifeq ($(ENABLE_HS),1)
EXES += $(EXES_HS)
endif

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

bin/%_go: %.go
	$(GO) build -o $@ $<

bin/%_hs: %.hs
	$(GHC) $(GHCFLAGS) -o $@ $< -outputdir=$@.tmp
