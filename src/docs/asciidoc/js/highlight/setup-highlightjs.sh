#!/usr/bin/env bash

curl 'https://highlightjs.org/download/' \
  --output highlight.zip \
  --header 'Accept-Encoding: gzip' \
  --header 'Referer: https://highlightjs.org/download/' \
  --header 'Cookie: csrftoken=cfBcvjoqAdruMah5sA6ZHrcATpIJFLc7O2SPmf64zC6dG7mDcKLAyOAbp9RhWMYr' \
  --data 'csrfmiddlewaretoken=mZ1WKfekSSBxQ87CohX3DsZ5pd2KWcZiYMizBbWYRhggK5ca8rCEuPnGVXbiddLC' \
  --data 'apache.js=on' \
  --data 'bash.js=on' \
  --data 'cs.js=on' \
  --data 'cpp.js=on' \
  --data 'css.js=on' \
  --data 'coffeescript.js=on' \
  --data 'diff.js=on' \
  --data 'xml.js=on' \
  --data 'http.js=on' \
  --data 'ini.js=on' \
  --data 'json.js=on' \
  --data 'java.js=on' \
  --data 'javascript.js=on' \
  --data 'makefile.js=on' \
  --data 'markdown.js=on' \
  --data 'nginx.js=on' \
  --data 'objectivec.js=on' \
  --data 'php.js=on' \
  --data 'perl.js=on' \
  --data 'properties.js=on' \
  --data 'python.js=on' \
  --data 'ruby.js=on' \
  --data 'sql.js=on' \
  --data 'shell.js=on' \
  --data 'yaml.js=on' \
  --data 'applescript.js=on' \
  --data 'arduino.js=on' \
  --data 'asciidoc.js=on' \
  --data 'aspectj.js=on' \
  --data 'abnf.js=on' \
  --data 'awk.js=on' \
  --data 'bnf.js=on' \
  --data 'basic.js=on' \
  --data 'cmake.js=on' \
  --data 'capnproto.js=on' \
  --data 'dart.js=on' \
  --data 'dockerfile.js=on' \
  --data 'elm.js=on' \
  --data 'erlang.js=on' \
  --data 'erlang-repl.js=on' \
  --data 'ebnf.js=on' \
  --data 'fsharp.js=on' \
  --data 'gherkin.js=on' \
  --data 'go.js=on' \
  --data 'golo.js=on' \
  --data 'gradle.js=on' \
  --data 'groovy.js=on' \
  --data 'haml.js=on' \
  --data 'kotlin.js=on' \
  --data 'less.js=on' \
  --data 'lua.js=on' \
  --data 'mathematica.js=on' \
  --data 'matlab.js=on' \
  --data 'pgsql.js=on' \
  --data 'powershell.js=on' \
  --data 'protobuf.js=on' \
  --data 'r.js=on' \
  --data 'rust.js=on' \
  --data 'scss.js=on' \
  --data 'scala.js=on' \
  --data 'thrift.js=on' \
  --data 'vim.js=on' \
  --data 'plaintext.js=on' \
  --silent

unzip -d highlight_tmp highlight.zip > /dev/null
mv highlight_tmp/highlight.pack.js ./highlight.min.js

styles=(highlight_tmp/styles/{darcula,github,gruvbox-dark,gruvbox-light,ocean,solarized-dark,solarized-light}.css)
for css in "${styles[@]}"; do mv "$css" "./styles/$(basename "$css" .css).min.css"; done

rm -rf highlight_tmp
rm -rf highlight.zip

curl https://raw.githubusercontent.com/highlightjs/highlightjs-terraform/master/terraform.js \
  --output terraform.js \
  --silent
