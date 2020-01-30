#!/usr/bin/env bash

curl 'https://highlightjs.org/download/' \
  -o highlight.zip \
  -H 'Accept-Encoding: gzip' \
  -H 'Referer: https://highlightjs.org/download/' \
  -H 'Cookie: csrftoken=cfBcvjoqAdruMah5sA6ZHrcATpIJFLc7O2SPmf64zC6dG7mDcKLAyOAbp9RhWMYr' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  --data 'csrfmiddlewaretoken=mZ1WKfekSSBxQ87CohX3DsZ5pd2KWcZiYMizBbWYRhggK5ca8rCEuPnGVXbiddLC&apache.js=on&bash.js=on&cs.js=on&cpp.js=on&css.js=on&coffeescript.js=on&diff.js=on&xml.js=on&http.js=on&ini.js=on&json.js=on&java.js=on&javascript.js=on&makefile.js=on&markdown.js=on&nginx.js=on&objectivec.js=on&php.js=on&perl.js=on&properties.js=on&python.js=on&ruby.js=on&sql.js=on&shell.js=on&yaml.js=on&applescript.js=on&arduino.js=on&asciidoc.js=on&aspectj.js=on&abnf.js=on&awk.js=on&bnf.js=on&basic.js=on&cmake.js=on&capnproto.js=on&dart.js=on&dockerfile.js=on&elm.js=on&erlang.js=on&erlang-repl.js=on&ebnf.js=on&fsharp.js=on&gherkin.js=on&go.js=on&golo.js=on&gradle.js=on&groovy.js=on&haml.js=on&kotlin.js=on&less.js=on&lua.js=on&mathematica.js=on&matlab.js=on&pgsql.js=on&powershell.js=on&protobuf.js=on&r.js=on&rust.js=on&scss.js=on&scala.js=on&thrift.js=on&vim.js=on&plaintext.js=on'
unzip -d highlight highlight.zip
mv highlight/highlight.pack.js highlight/highlight.min.js
for css in highlight/style/*.css; do mv "$css" "highlight/style/$(basename "$css" .css).min.css"; done

