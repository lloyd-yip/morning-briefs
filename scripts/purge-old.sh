#!/usr/bin/env bash
DIR="$(cd "$(dirname "$0")/../docs/morning-briefs" && pwd)"
find "$DIR" -maxdepth 1 -type f -name '*-20[0-9][0-9]-*.html' -mtime +7 -print -delete
