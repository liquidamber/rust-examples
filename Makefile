RUSTC ?= rustc
RUSTFLAGS ?= -g --opt-level=3

CXXFLAGS ?= -std=c++11 -g -O3
LIBS ?= -lpthread

GHC ?= ghc
GHCFLAGS ?= -O3 -Wall

SRCS_RS := $(wildcard *.rs)
EXES_RS := $(SRCS_RS:%.rs=bin/%_rs)

SRCS_CC := $(wildcard *.cc)
EXES_CC := $(SRCS_CC:%.cc=bin/%_cc)

SRCS_HS := $(wildcard *.hs)
EXES_HS := $(SRCS_HS:%.hs=bin/%_hs)

EXES := $(EXES_RS) $(EXES_CC) $(EXES_HS)

.PHONY: all clean

all: $(EXES)

clean:
	$(RM) -r $(EXES:%=%*)

bin/%_rs: %.rs
	$(RUSTC) $(RUSTFLAGS) -o $@ $<

bin/%_cc: %.cc
	$(CXX) $(CXXFLAGS) -o $@ $< $(LDFLAGS) $(LIBS)

bin/%_hs: %.hs
	$(GHC) $(GHCFLAGS) -o $@ $< -outputdir=$@.tmp
