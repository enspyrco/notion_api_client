part of 'block_type.dart';

/// To do block objects contain the following information within the to_do property:
class ToDoBlock extends BlockType {
  /// rich_text	array of rich text objects	Rich text in the to_do block.
  final List<RichText> richTexts;

  /// checked	boolean (optional)	Whether the to_do is checked or not.
  final bool? checked;

  /// color	string (enum)	Color of the block. Possible values are: "default", "gray", "brown", "orange", "yellow", "green", "blue", "purple", "pink", "red", "gray_background", "brown_background", "orange_background", "yellow_background", "green_background", "blue_background", "purple_background", "pink_background", "red_background".
  final String color;

  /// children	array of block objects	Any nested children blocks of the to_do block.
  final List<Block> children;

  ToDoBlock.fromJson(JsonMap json)
      : richTexts = ((json['to_do'] as JsonMap)['rich_text'] as List)
            .map((e) => RichText.fromJson(e))
            .toList(),
        checked = json['checked'] as bool?,
        color = (json['to_do'] as JsonMap)['color'] as String,
        children = (json['children'] == null)
            ? []
            : (json['children'] as List).map((e) => Block.fromJson(e)).toList();
}
