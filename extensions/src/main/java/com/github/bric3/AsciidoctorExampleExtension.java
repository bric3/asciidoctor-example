package com.github.bric3;

import org.asciidoctor.Asciidoctor;
import org.asciidoctor.extension.JavaExtensionRegistry;
import org.asciidoctor.jruby.extension.spi.ExtensionRegistry;
import org.asciidoctor.syntaxhighlighter.SyntaxHighlighterRegistry;

public class AsciidoctorExampleExtension implements ExtensionRegistry {
  @Override
  public void register(Asciidoctor asciidoctor) {
    SyntaxHighlighterRegistry syntaxHighlighterRegistry = asciidoctor.syntaxHighlighterRegistry();
    syntaxHighlighterRegistry.register(HighlightJsHighlighter.class,
            "highlightjs",
            "highlight.js");
  }
}