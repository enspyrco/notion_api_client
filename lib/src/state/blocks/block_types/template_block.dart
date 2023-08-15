part of 'block_type.dart';

/// Template block objects contain the following information within the template property:
class TemplateBlock extends BlockType {
  /// rich_text	array of rich text objects	rich text in the title of the template
  final List<RichText> richTexts;

  /// children	array of block objects	Any nested children blocks of the template block. These blocks will be duplicated when the template block is used in the UI.
  final List<Block> children;

  TemplateBlock.fromJson(JsonMap json)
      : richTexts = (json['rich_text'] as List)
            .map((e) => RichText.fromJson(e))
            .toList(),
        children =
            (json['children'] as List).map((e) => Block.fromJson(e)).toList();
}
