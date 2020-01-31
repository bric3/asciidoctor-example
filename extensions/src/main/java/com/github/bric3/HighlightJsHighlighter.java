package com.github.bric3;

import org.asciidoctor.ast.Block;
import org.asciidoctor.ast.Document;
import org.asciidoctor.extension.LocationType;
import org.asciidoctor.log.LogHandler;
import org.asciidoctor.log.Logging;
import org.asciidoctor.syntaxhighlighter.Formatter;
import org.asciidoctor.syntaxhighlighter.SyntaxHighlighterAdapter;

import java.util.Map;

/**
 * Provides a specific configuration of highlightjs
 * 
 * https://github.com/asciidoctor/asciidoctorj/blob/master/docs/integrator-guide.adoc#implement-a-syntax-highlighter-adapter
 */
public class HighlightJsHighlighter implements SyntaxHighlighterAdapter, Formatter, Logging {

    private LogHandler logHandler;

    @Override
    public boolean hasDocInfo(LocationType location) {
        return location == LocationType.FOOTER;
    }

    @Override
    public String getDocinfo(LocationType location, Document document, Map<String, Object> options) {
        String highlightjsDir = ensureTrailingSlash(document.getAttribute("highlightjsdir").toString());
        Object theme = document.getAttribute("highlightjs-theme");
        return "<link rel=\"stylesheet\" href=\"" + highlightjsDir + "styles/" + theme + ".min.css\">\n" +
                "<script src=\"" + highlightjsDir + "highlight.min.js\"></script>\n" +
                "<script src=\"" + highlightjsDir + "terraform.js\"></script>\n" +
                "<script>\n" +
                "  hljs.registerLanguage('terraform', window.hljsDefineTerraform);\n" +
                "  hljs.initHighlightingOnLoad();\n" +
                "</script>";
    }

    @Override
    public String format(Block node, String lang, Map<String, Object> opts) {
        String language = lang == null || lang.length() == 0 ? "none" : lang;

        return "<pre class=\"highlightjs highlight\">" +
                "<code data-lang=\"" + language + "\" " +
                "class=\"language-" + language + " hljs\">" +
                node.getContent() +
                "</code></pre>"
                ;
    }

    @Override
    public void setLogHandler(LogHandler logHandler) {
        this.logHandler = logHandler;
    }

    private String ensureTrailingSlash(String highlightjsDir) {
        return highlightjsDir.endsWith("/") ? highlightjsDir : highlightjsDir + "/";
    }
}