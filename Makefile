# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -Iinclude -g -mavx2 -fopenmp -pthread -w -Lbenchmark/build/src -lbenchmark

# Directories
SRCDIR = src
INCDIR = include
BUILDDIR = build
TARGET = main
BENCHMARK_DIR = benchmark/include

# Files
SOURCES = $(wildcard $(SRCDIR)/*.cpp)
INCLUDES = $(wildcard $(INCDIR)/*.hpp)
# Rules
.PHONY: all clean

all: $(TARGET)

$(TARGET): $(SOURCES) $(INCLUDES)
	mpicxx $< -isystem $(BENCHMARK_DIR) $(CXXFLAGS) -o $@

clean:
	rm -rf $(TARGET)
