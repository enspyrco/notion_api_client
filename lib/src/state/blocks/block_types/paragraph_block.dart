part of 'block_type.dart';

class ParagraphBlock extends BlockType {
  /// Rich text in the paragraph block.
  /// Wirename: rich_text
  /// Type: Array of rich text objects
  final List<RichText> richText;

  ///	Color of the block. Possible values are: "default", "gray", "brown",
  /// "orange", "yellow", "green", "blue", "purple", "pink", "red",
  /// "gray_background", "brown_background", "orange_background",
  /// "yellow_background", "green_background", "blue_background",
  /// "purple_background", "pink_background", "red_background".
  /// Type: string (enum)
  final String color;

  /// Any nested children blocks of the paragraph block.
  /// Type: Array of block objects
  final List<Block> children;

  ParagraphBlock.fromJson(JsonMap json)
      : richText = ((json['paragraph'] as JsonMap)['rich_text'] as List)
            .map((e) => RichText.fromJson(e))
            .toList(),
        color = (json['paragraph'] as JsonMap)['color'] as String,
        children = (json['children'] == null)
            ? []
            : (json['children'] as List).map((e) => Block.fromJson(e)).toList();
}
