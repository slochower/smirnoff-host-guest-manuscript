#!/usr/bin/bash

## Diff from manuscript.md
pandiff \
  --output=pandiff/pandiff-from-md.html \
  --reference-links \
  --standalone \
  --resource-path=pandiff \
  --wrap=preserve \
  old/manuscript.md new/manuscript.md

cat ../build/themes/default.html >> pandiff/pandiff-from-md.html
cat pandiff/pandiff-theme.html >> pandiff/pandiff-from-md.html

docker run \
  --rm \
  --volume `pwd`/pandiff:/converted/ \
  --security-opt seccomp:unconfined \
  arachnysdocker/athenapdf:2.16.0 \
  athenapdf \
  --delay=2000 \
  pandiff-from-md.html pandiff-from-md.pdf


## Diff from manuscript.html
pandiff \
  --output=pandiff/pandiff-from-html.html \
  --resource-path=pandiff \
  --reference-links \
  --standalone \
  old/manuscript.html new/manuscript.html

# cat ../build/themes/default.html >> pandiff/pandiff-from-html.pdf
# cat pandiff/pandiff-theme.html >> pandiff/pandiff-from-html.pdf

docker run \
  --rm \
  --volume `pwd`/pandiff:/converted/ \
  --security-opt seccomp:unconfined \
  arachnysdocker/athenapdf:2.16.0 \
  athenapdf \
  --delay=2000 \
  pandiff-from-html.html pandiff-from-html.pdf
