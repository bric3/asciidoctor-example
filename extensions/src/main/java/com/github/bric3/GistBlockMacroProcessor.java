package com.github.bric3;

import org.asciidoctor.ast.StructuralNode;
import org.asciidoctor.extension.BlockMacroProcessor;
import org.asciidoctor.extension.Name;

import java.util.Map;

@Name("gist")
public class GistBlockMacroProcessor extends BlockMacroProcessor {
    @Override
    public Object process(
            StructuralNode parent, String target, Map<String, Object> attributes) {

        String content = "<div class=\"openblock gist\">" +
                "<div class=\"content\">" +
                "<script src=\"https://gist.github.com/" +
                target +
                ".js\"></script>" +
                "</div>" +
                "</div>";

        return createBlock(parent, "pass", content);
    }
}