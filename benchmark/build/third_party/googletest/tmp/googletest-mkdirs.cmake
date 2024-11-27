# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "/home/110550069/final/benchmark/build/third_party/googletest/src")
  file(MAKE_DIRECTORY "/home/110550069/final/benchmark/build/third_party/googletest/src")
endif()
file(MAKE_DIRECTORY
  "/home/110550069/final/benchmark/build/third_party/googletest/build"
  "/home/110550069/final/benchmark/build/third_party/googletest"
  "/home/110550069/final/benchmark/build/third_party/googletest/tmp"
  "/home/110550069/final/benchmark/build/third_party/googletest/stamp"
  "/home/110550069/final/benchmark/build/third_party/googletest/download"
  "/home/110550069/final/benchmark/build/third_party/googletest/stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/110550069/final/benchmark/build/third_party/googletest/stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/110550069/final/benchmark/build/third_party/googletest/stamp${cfgdir}") # cfgdir has leading slash
endif()
