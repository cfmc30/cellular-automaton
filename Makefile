# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -Iinclude -g -mavx2 -fopenmp -pthread

# Directories
SRCDIR = src
INCDIR = include
BUILDDIR = build
TARGET = main

# Files
SOURCES = $(wildcard $(SRCDIR)/*.cpp)
INCLUDES = $(wildcard $(INCDIR)/*.hpp)

# Rules
.PHONY: all clean

all: $(TARGET)

$(TARGET): $(SOURCES) $(INCLUDES)
	$(CXX) $(CXXFLAGS) -o $@ $<

clean:
	rm -rf $(TARGET)
