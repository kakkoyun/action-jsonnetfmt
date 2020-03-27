#!/bin/sh -l

cd "$GITHUB_WORKSPACE" || exit 1

echo $(find . -name 'vendor' -prune -o -name 'jsonnet/vendor' -prune -o -name '*.libsonnet' -print -o -name '*.jsonnet' -print) | \
    xargs -n 1 -- jsonnetfmt -n 2 --max-blank-lines 2 --string-style s --comment-style s -i
