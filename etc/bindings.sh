#!/bin/bash

cd "$(dirname "$0")"

EXTRA_FLAGS=
if [[ "$1" == "msvc14" ]] ; then
    EXTRA_FLAGS="-use-msvc-mangling --target=x86_64-pc-win32 -DWIN32=1"
    EXTRA_FLAGS="$EXTRA_FLAGS -fms-compatibility-version=19.00"
    EXTRA_FLAGS="$EXTRA_FLAGS -DEXPORT_JS_API=1 -D_CRT_USE_BUILTIN_OFFSETOF"
    EXTRA_FLAGS="$EXTRA_FLAGS -fvisibility=hidden"
fi

$GDB ../../rust-bindgen/target/debug/bindgen \
  ${EXTRA_FLAGS} \
  -no-type-renaming \
  -dtor-attr unsafe_no_drop_flag \
  -allow-unknown-types -x c++ --std=c++11 \
  -I ../libazure \
  wrapper.h \
  -DRUST_BINDGEN=1 \
  -match 2D.h \
  -o ../src/out.rs

#  -no-class-constants 
