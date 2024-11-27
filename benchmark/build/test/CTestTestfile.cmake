# CMake generated Testfile for 
# Source directory: /home/110550069/final/benchmark/test
# Build directory: /home/110550069/final/benchmark/build/test
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test([=[benchmark]=] "/home/110550069/final/benchmark/build/test/benchmark_test" "--benchmark_min_time=0.01s")
set_tests_properties([=[benchmark]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;77;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[spec_arg]=] "/home/110550069/final/benchmark/build/test/spec_arg_test" "--benchmark_filter=BM_NotChosen")
set_tests_properties([=[spec_arg]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;80;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[spec_arg_verbosity]=] "/home/110550069/final/benchmark/build/test/spec_arg_verbosity_test" "--v=42")
set_tests_properties([=[spec_arg_verbosity]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;83;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[benchmark_setup_teardown]=] "/home/110550069/final/benchmark/build/test/benchmark_setup_teardown_test")
set_tests_properties([=[benchmark_setup_teardown]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;86;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[min_time_flag_time]=] "/home/110550069/final/benchmark/build/test/benchmark_min_time_flag_time_test")
set_tests_properties([=[min_time_flag_time]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;95;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[min_time_flag_iters]=] "/home/110550069/final/benchmark/build/test/benchmark_min_time_flag_iters_test")
set_tests_properties([=[min_time_flag_iters]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;98;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_simple]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_min_time=0.01s" "--benchmark_filter=Foo" "3")
set_tests_properties([=[filter_simple]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;90;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;100;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_simple_list_only]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_list_tests" "--benchmark_filter=Foo" "3")
set_tests_properties([=[filter_simple_list_only]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;91;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;100;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_simple_negative]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_min_time=0.01s" "--benchmark_filter=-Foo" "2")
set_tests_properties([=[filter_simple_negative]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;90;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;101;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_simple_negative_list_only]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_list_tests" "--benchmark_filter=-Foo" "2")
set_tests_properties([=[filter_simple_negative_list_only]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;91;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;101;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_suffix]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_min_time=0.01s" "--benchmark_filter=BM_.*" "4")
set_tests_properties([=[filter_suffix]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;90;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;102;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_suffix_list_only]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_list_tests" "--benchmark_filter=BM_.*" "4")
set_tests_properties([=[filter_suffix_list_only]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;91;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;102;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_suffix_negative]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_min_time=0.01s" "--benchmark_filter=-BM_.*" "1")
set_tests_properties([=[filter_suffix_negative]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;90;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;103;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_suffix_negative_list_only]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_list_tests" "--benchmark_filter=-BM_.*" "1")
set_tests_properties([=[filter_suffix_negative_list_only]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;91;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;103;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_regex_all]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_min_time=0.01s" "--benchmark_filter=.*" "5")
set_tests_properties([=[filter_regex_all]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;90;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;104;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_regex_all_list_only]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_list_tests" "--benchmark_filter=.*" "5")
set_tests_properties([=[filter_regex_all_list_only]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;91;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;104;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_regex_all_negative]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_min_time=0.01s" "--benchmark_filter=-.*" "0")
set_tests_properties([=[filter_regex_all_negative]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;90;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;105;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_regex_all_negative_list_only]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_list_tests" "--benchmark_filter=-.*" "0")
set_tests_properties([=[filter_regex_all_negative_list_only]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;91;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;105;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_regex_blank]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_min_time=0.01s" "--benchmark_filter=" "5")
set_tests_properties([=[filter_regex_blank]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;90;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;106;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_regex_blank_list_only]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_list_tests" "--benchmark_filter=" "5")
set_tests_properties([=[filter_regex_blank_list_only]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;91;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;106;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_regex_blank_negative]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_min_time=0.01s" "--benchmark_filter=-" "0")
set_tests_properties([=[filter_regex_blank_negative]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;90;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;107;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_regex_blank_negative_list_only]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_list_tests" "--benchmark_filter=-" "0")
set_tests_properties([=[filter_regex_blank_negative_list_only]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;91;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;107;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_regex_none]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_min_time=0.01s" "--benchmark_filter=monkey" "0")
set_tests_properties([=[filter_regex_none]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;90;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;108;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_regex_none_list_only]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_list_tests" "--benchmark_filter=monkey" "0")
set_tests_properties([=[filter_regex_none_list_only]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;91;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;108;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_regex_none_negative]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_min_time=0.01s" "--benchmark_filter=-monkey" "5")
set_tests_properties([=[filter_regex_none_negative]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;90;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;109;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_regex_none_negative_list_only]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_list_tests" "--benchmark_filter=-monkey" "5")
set_tests_properties([=[filter_regex_none_negative_list_only]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;91;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;109;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_regex_wildcard]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_min_time=0.01s" "--benchmark_filter=.*Foo.*" "3")
set_tests_properties([=[filter_regex_wildcard]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;90;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;110;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_regex_wildcard_list_only]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_list_tests" "--benchmark_filter=.*Foo.*" "3")
set_tests_properties([=[filter_regex_wildcard_list_only]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;91;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;110;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_regex_wildcard_negative]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_min_time=0.01s" "--benchmark_filter=-.*Foo.*" "2")
set_tests_properties([=[filter_regex_wildcard_negative]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;90;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;111;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_regex_wildcard_negative_list_only]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_list_tests" "--benchmark_filter=-.*Foo.*" "2")
set_tests_properties([=[filter_regex_wildcard_negative_list_only]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;91;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;111;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_regex_begin]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_min_time=0.01s" "--benchmark_filter=^BM_.*" "4")
set_tests_properties([=[filter_regex_begin]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;90;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;112;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_regex_begin_list_only]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_list_tests" "--benchmark_filter=^BM_.*" "4")
set_tests_properties([=[filter_regex_begin_list_only]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;91;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;112;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_regex_begin_negative]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_min_time=0.01s" "--benchmark_filter=-^BM_.*" "1")
set_tests_properties([=[filter_regex_begin_negative]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;90;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;113;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_regex_begin_negative_list_only]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_list_tests" "--benchmark_filter=-^BM_.*" "1")
set_tests_properties([=[filter_regex_begin_negative_list_only]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;91;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;113;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_regex_begin2]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_min_time=0.01s" "--benchmark_filter=^N" "1")
set_tests_properties([=[filter_regex_begin2]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;90;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;114;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_regex_begin2_list_only]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_list_tests" "--benchmark_filter=^N" "1")
set_tests_properties([=[filter_regex_begin2_list_only]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;91;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;114;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_regex_begin2_negative]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_min_time=0.01s" "--benchmark_filter=-^N" "4")
set_tests_properties([=[filter_regex_begin2_negative]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;90;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;115;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_regex_begin2_negative_list_only]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_list_tests" "--benchmark_filter=-^N" "4")
set_tests_properties([=[filter_regex_begin2_negative_list_only]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;91;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;115;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_regex_end]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_min_time=0.01s" "--benchmark_filter=.*Ba\$" "1")
set_tests_properties([=[filter_regex_end]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;90;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;116;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_regex_end_list_only]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_list_tests" "--benchmark_filter=.*Ba\$" "1")
set_tests_properties([=[filter_regex_end_list_only]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;91;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;116;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_regex_end_negative]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_min_time=0.01s" "--benchmark_filter=-.*Ba\$" "4")
set_tests_properties([=[filter_regex_end_negative]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;90;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;117;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[filter_regex_end_negative_list_only]=] "/home/110550069/final/benchmark/build/test/filter_test" "--benchmark_list_tests" "--benchmark_filter=-.*Ba\$" "4")
set_tests_properties([=[filter_regex_end_negative_list_only]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;91;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;117;add_filter_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[options_benchmarks]=] "/home/110550069/final/benchmark/build/test/options_test" "--benchmark_min_time=0.01s")
set_tests_properties([=[options_benchmarks]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;120;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[basic_benchmark]=] "/home/110550069/final/benchmark/build/test/basic_test" "--benchmark_min_time=0.01s")
set_tests_properties([=[basic_benchmark]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;123;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[repetitions_benchmark]=] "/home/110550069/final/benchmark/build/test/repetitions_test" "--benchmark_min_time=0.01s" "--benchmark_repetitions=3")
set_tests_properties([=[repetitions_benchmark]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;126;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[diagnostics_test]=] "/home/110550069/final/benchmark/build/test/diagnostics_test" "--benchmark_min_time=0.01s")
set_tests_properties([=[diagnostics_test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;129;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[skip_with_error_test]=] "/home/110550069/final/benchmark/build/test/skip_with_error_test" "--benchmark_min_time=0.01s")
set_tests_properties([=[skip_with_error_test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;132;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[donotoptimize_test]=] "/home/110550069/final/benchmark/build/test/donotoptimize_test" "--benchmark_min_time=0.01s")
set_tests_properties([=[donotoptimize_test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;145;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[fixture_test]=] "/home/110550069/final/benchmark/build/test/fixture_test" "--benchmark_min_time=0.01s")
set_tests_properties([=[fixture_test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;148;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[register_benchmark_test]=] "/home/110550069/final/benchmark/build/test/register_benchmark_test" "--benchmark_min_time=0.01s")
set_tests_properties([=[register_benchmark_test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;151;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[map_test]=] "/home/110550069/final/benchmark/build/test/map_test" "--benchmark_min_time=0.01s")
set_tests_properties([=[map_test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;154;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[multiple_ranges_test]=] "/home/110550069/final/benchmark/build/test/multiple_ranges_test" "--benchmark_min_time=0.01s")
set_tests_properties([=[multiple_ranges_test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;157;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[args_product_test]=] "/home/110550069/final/benchmark/build/test/args_product_test" "--benchmark_min_time=0.01s")
set_tests_properties([=[args_product_test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;160;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[link_main_test]=] "/home/110550069/final/benchmark/build/test/link_main_test" "--benchmark_min_time=0.01s")
set_tests_properties([=[link_main_test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;163;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[reporter_output_test]=] "/home/110550069/final/benchmark/build/test/reporter_output_test" "--benchmark_min_time=0.01s")
set_tests_properties([=[reporter_output_test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;166;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[templated_fixture_test]=] "/home/110550069/final/benchmark/build/test/templated_fixture_test" "--benchmark_min_time=0.01s")
set_tests_properties([=[templated_fixture_test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;169;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[user_counters_test]=] "/home/110550069/final/benchmark/build/test/user_counters_test" "--benchmark_min_time=0.01s")
set_tests_properties([=[user_counters_test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;172;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[perf_counters_test]=] "/home/110550069/final/benchmark/build/test/perf_counters_test" "--benchmark_min_time=0.01s" "--benchmark_perf_counters=CYCLES,INSTRUCTIONS")
set_tests_properties([=[perf_counters_test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;175;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[internal_threading_test]=] "/home/110550069/final/benchmark/build/test/internal_threading_test" "--benchmark_min_time=0.01s")
set_tests_properties([=[internal_threading_test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;178;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[report_aggregates_only_test]=] "/home/110550069/final/benchmark/build/test/report_aggregates_only_test" "--benchmark_min_time=0.01s")
set_tests_properties([=[report_aggregates_only_test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;181;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[display_aggregates_only_test]=] "/home/110550069/final/benchmark/build/test/display_aggregates_only_test" "--benchmark_min_time=0.01s")
set_tests_properties([=[display_aggregates_only_test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;184;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[user_counters_tabular_test]=] "/home/110550069/final/benchmark/build/test/user_counters_tabular_test" "--benchmark_counters_tabular=true" "--benchmark_min_time=0.01s")
set_tests_properties([=[user_counters_tabular_test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;187;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[user_counters_thousands_test]=] "/home/110550069/final/benchmark/build/test/user_counters_thousands_test" "--benchmark_min_time=0.01s")
set_tests_properties([=[user_counters_thousands_test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;190;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[memory_manager_test]=] "/home/110550069/final/benchmark/build/test/memory_manager_test" "--benchmark_min_time=0.01s")
set_tests_properties([=[memory_manager_test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;193;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[profiler_manager_test]=] "/home/110550069/final/benchmark/build/test/profiler_manager_test" "--benchmark_min_time=0.01s")
set_tests_properties([=[profiler_manager_test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;196;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[cxx03]=] "/home/110550069/final/benchmark/build/test/cxx03_test" "--benchmark_min_time=0.01s")
set_tests_properties([=[cxx03]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;221;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[complexity_benchmark]=] "/home/110550069/final/benchmark/build/test/complexity_test" "--benchmark_min_time=1000000x")
set_tests_properties([=[complexity_benchmark]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;225;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[benchmark_gtest]=] "/home/110550069/final/benchmark/build/test/benchmark_gtest")
set_tests_properties([=[benchmark_gtest]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;240;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;248;add_gtest;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[benchmark_name_gtest]=] "/home/110550069/final/benchmark/build/test/benchmark_name_gtest")
set_tests_properties([=[benchmark_name_gtest]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;240;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;249;add_gtest;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[benchmark_random_interleaving_gtest]=] "/home/110550069/final/benchmark/build/test/benchmark_random_interleaving_gtest")
set_tests_properties([=[benchmark_random_interleaving_gtest]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;240;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;250;add_gtest;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[commandlineflags_gtest]=] "/home/110550069/final/benchmark/build/test/commandlineflags_gtest")
set_tests_properties([=[commandlineflags_gtest]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;240;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;251;add_gtest;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[statistics_gtest]=] "/home/110550069/final/benchmark/build/test/statistics_gtest")
set_tests_properties([=[statistics_gtest]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;240;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;252;add_gtest;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[string_util_gtest]=] "/home/110550069/final/benchmark/build/test/string_util_gtest")
set_tests_properties([=[string_util_gtest]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;240;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;253;add_gtest;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[perf_counters_gtest]=] "/home/110550069/final/benchmark/build/test/perf_counters_gtest")
set_tests_properties([=[perf_counters_gtest]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;240;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;254;add_gtest;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[time_unit_gtest]=] "/home/110550069/final/benchmark/build/test/time_unit_gtest")
set_tests_properties([=[time_unit_gtest]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;240;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;255;add_gtest;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[min_time_parse_gtest]=] "/home/110550069/final/benchmark/build/test/min_time_parse_gtest")
set_tests_properties([=[min_time_parse_gtest]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;240;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;256;add_gtest;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
add_test([=[profiler_manager_gtest]=] "/home/110550069/final/benchmark/build/test/profiler_manager_gtest")
set_tests_properties([=[profiler_manager_gtest]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/110550069/final/benchmark/test/CMakeLists.txt;68;add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;240;benchmark_add_test;/home/110550069/final/benchmark/test/CMakeLists.txt;257;add_gtest;/home/110550069/final/benchmark/test/CMakeLists.txt;0;")
