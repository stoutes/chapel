#!/usr/bin/env bash
#
# Test valgrind-compatible configuration on full suite with valgrind on linux64.

CWD=$(cd $(dirname $0) ; pwd)
source $CWD/common.bash
source $CWD/common-valgrind.bash
source $CWD/common-localnode-paratest.bash

# Use LLVM-13 to work around https://github.com/Cray/chapel-private/issues/3373
source /cray/css/users/chapelu/setup_system_llvm.bash 13

# valgrind serializes execution, so don't limit to one executable at a time
unset CHPL_TEST_LIMIT_RUNNING_EXECUTABLES

export CHPL_NIGHTLY_TEST_CONFIG_NAME="valgrind"

$CWD/nightly -cron -valgrind -examples ${nightly_args} $(get_nightly_paratest_args 8)
