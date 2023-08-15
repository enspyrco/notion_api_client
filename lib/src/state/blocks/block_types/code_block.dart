part of 'block_type.dart';

/// Code block objects contain the following information within the code property:
class CodeBlock extends BlockType {
  /// Rich text in code block
  final List<RichText> richTexts;

  /// Rich text in caption of the code block
  final List<RichText> caption;

  /// Type of block.
  /// Possible values include: "abap", "arduino", "bash", "basic", "c", "clojure", "coffeescript", "c++", "c#", "css", "dart", "diff", "docker", "elixir", "elm", "erlang", "flow", "fortran", "f#", "gherkin", "glsl", "go", "graphql", "groovy", "haskell", "html", "java", "javascript", "json", "julia", "kotlin", "latex", "less", "lisp", "livescript", "lua", "makefile", "markdown", "markup", "matlab", "mermaid", "nix", "objective-c", "ocaml", "pascal", "perl", "php", "plain text", "powershell", "prolog", "protobuf", "python", "r", "reason", "ruby", "rust", "sass", "scala", "scheme", "scss", "shell", "sql", "swift", "typescript", "vb.net", "verilog", "vhdl", "visual basic", "webassembly", "xml", "yaml", and "java/c/c++/c#"
  ///   Type: string (enum)
  final String language;

  CodeBlock.fromJson(JsonMap json)
      : richTexts = (json['rich_text'] as List)
            .map((e) => RichText.fromJson(e))
            .toList(),
        caption =
            (json['caption'] as List).map((e) => RichText.fromJson(e)).toList(),
        language = json['language'] as String;
}
