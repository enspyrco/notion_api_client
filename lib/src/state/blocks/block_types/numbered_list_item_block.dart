part of 'block_type.dart';

/// Numbered list item block objects contain the following information within the numbered_list_item property:
class NumberedListItemBlock extends BlockType {
  /// rich_text	array of rich text objects	Rich text in the numbered_list_item block.
  final List<RichText> richTexts;

  /// color	string (enum)	Color of the block. Possible values are: "default", "gray", "brown", "orange", "yellow", "green", "blue", "purple", "pink", "red", "gray_background", "brown_background", "orange_background", "yellow_background", "green_background", "blue_background", "purple_background", "pink_background", "red_background".
  final String color;

  /// children	array of block objects	Any nested children blocks of the numbered_list_item block.
  final List<Block> children;

  NumberedListItemBlock.fromJson(JsonMap json)
      : richTexts = (json['rich_text'] as List)
            .map((e) => RichText.fromJson(e))
            .toList(),
        color = json['color'] as String,
        children = (json['children'] == null)
            ? []
            : (json['children'] as List).map((e) => Block.fromJson(e)).toList();
}
