part of 'block_type.dart';

/// Toggle block objects contain the following information within the toggle property:
class ToggleBlock extends BlockType {
  /// rich_text	array of rich text objects	Rich text in the toggle block.
  final List<RichText> richTexts;

  /// color	string (enum)	Color of the block. Possible values are: "default", "gray", "brown", "orange", "yellow", "green", "blue", "purple", "pink", "red", "gray_background", "brown_background", "orange_background", "yellow_background", "green_background", "blue_background", "purple_background", "pink_background", "red_background".
  final String color;

  /// children	array of block objects	Any nested children blocks of the toggle block.
  final List<Block> children;

  ToggleBlock.fromJson(JsonMap json)
      : richTexts = ((json['toggle'] as JsonMap)['rich_text'] as List)
            .map((e) => RichText.fromJson(e))
            .toList(),
        color = (json['toggle'] as JsonMap)['color'] as String,
        children = (json['children'] == null)
            ? []
            : (json['children'] as List).map((e) => Block.fromJson(e)).toList();
}
