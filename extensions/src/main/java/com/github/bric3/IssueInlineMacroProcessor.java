package com.github.bric3;

import org.asciidoctor.ast.ContentNode;
import org.asciidoctor.extension.InlineMacroProcessor;
import org.asciidoctor.extension.Name;

import java.util.HashMap;
import java.util.Map;

@Name("issue")
public class IssueInlineMacroProcessor extends InlineMacroProcessor {

    @Override
    public Object process(
            ContentNode parent, String target, Map<String, Object> attributes) {

        String[] parts = target.split("#");

        Object repo = parts.length > 1 && !parts[0].isEmpty() ?
                parts[0] :
                parent.getDocument().getAttribute("repo");
        String issue = parts.length > 1 ? parts[1] : parts[0];

        String href = "https://github.com/" +
                repo +
                "/issues/" +
                target;

        Map<String, Object> options = new HashMap<>();
        options.put("type", ":link");
        options.put("target", href);

        String text = repo + "#" + issue + (attributes.containsKey("comment") ? " (Comment)" : "");
        return createPhraseNode(parent, "anchor", text, attributes, options);
    }

}