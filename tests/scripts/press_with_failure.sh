#!/bin/bash
#
# Copyright (c) 2021, [Ribose Inc](https://www.ribose.com).
# All rights reserved.
# This file is a part of tebako
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
# 

# tebako test script
# executes tebako press with given root and entry point expecting failure
# $1  tebako press --root=$1
# $2  tebako press --entry-point=$2
# $3  expected exit code (103 or 104)
# returns 0 - tebako press failed with expeced return code [Test OK]
#         1 - tebako press succeeded [Test failed]
#         2 - tebako press failed with unexpected return code [Test failed]

DIR0="$( cd "$( dirname "$0" )" && pwd )"
DIR="$( cd $DIR0/../../bin && pwd )"
echo Expecting "$DIR/tebako press --root=$1 --entry-point=$2 to fail with exit code $3" 

$DIR/tebako press "--root=$1" --entry-point=$2

res=$?

if  [ $res -eq 0 ] ; then 
  echo "'tebako press' has succeeded unexpectedly [Test failed]"
  exit 1 
else 
  if [ $res -eq $3 ] ; then 
    echo "'tebako press' failed as expected with code $3 [Test OK]"
    exit 0
  else
    echo "'tebako press' failed with code $res but $3 was expected [Test failed]"
    exit 2
  fi
fi
