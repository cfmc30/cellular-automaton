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
	/opt/spack/var/spack/environments/pp-env/.spack-env/view/bin/g++ -I/opt/spack/opt/spack/linux-debian12-skylake/gcc-12.2.0/openmpi-4.1.6-cxrqmm7gyk2y65x6ulz7dydlvwqsvau4/include -L/opt/spack/opt/spack/linux-debian12-skylake/gcc-12.2.0/openmpi-4.1.6-cxrqmm7gyk2y65x6ulz7dydlvwqsvau4/lib -L/opt/spack/opt/spack/linux-debian12-skylake/gcc-12.2.0/hwloc-2.11.1-cr2fh6264rjcqx664o74nwepb44s2fzw/lib -L/opt/spack/opt/spack/linux-debian12-skylake/gcc-12.2.0/libevent-2.1.12-3bvsd4pvrpw6gamcnmwuj4olpda5cprc/lib -Wl,-rpath -Wl,/opt/spack/opt/spack/linux-debian12-skylake/gcc-12.2.0/openmpi-4.1.6-cxrqmm7gyk2y65x6ulz7dydlvwqsvau4/lib -Wl,-rpath -Wl,/opt/spack/opt/spack/linux-debian12-skylake/gcc-12.2.0/hwloc-2.11.1-cr2fh6264rjcqx664o74nwepb44s2fzw/lib -Wl,-rpath -Wl,/opt/spack/opt/spack/linux-debian12-skylake/gcc-12.2.0/libevent-2.1.12-3bvsd4pvrpw6gamcnmwuj4olpda5cprc/lib -lmpi $< -isystem $(BENCHMARK_DIR) $(CXXFLAGS) -o $@

clean:
	rm -rf $(TARGET)
