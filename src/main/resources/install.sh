#!/usr/bin/env bash

prefix="$1"

# default config file
cp deps.edn "$prefix"
cp example-deps.edn "$prefix"

# jar needed by scripts
mkdir -p "$prefix/libexec"
cp ./*.jar "$prefix/libexec"

# scripts
ruby -pi.bak -e "gsub(/PREFIX/, '$prefix')" clojure
mkdir -p "$prefix/bin"
cp clojure "$prefix/bin"
cp clj "$prefix/bin"

# man pages
mkdir -p "$prefix/share/man/man1"
cp clojure.1 "$prefix/share/man/man1"
cp clj.1 "$prefix/share/man/man1"
