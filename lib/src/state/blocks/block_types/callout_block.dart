part of 'block_type.dart';

/// Callout block objects contain the following information within the callout property:
class CalloutBlock extends BlockType {
  /// rich_text	array of rich text objects	Rich text in the heading block.
  final List<RichText> richTexts;

  /// Page icon.
  ///   Type: File Object or Emoji object
  final FileOrEmojiObject? icon;

  ///	Color of the block. Possible values are: "default", "gray", "brown", "orange", "yellow", "green", "blue", "purple", "pink", "red", "gray_background", "brown_background", "orange_background", "yellow_background", "green_background", "blue_background", "purple_background", "pink_background", "red_background".
  ///   Type: string (enum)
  final String color;

  ///	Any nested children blocks of the callout block.
  ///   Type: array of block objects
  final List<Block> children;

  CalloutBlock.fromJson(JsonMap json)
      : richTexts = (json['rich_text'] as List)
            .map((e) => RichText.fromJson(e))
            .toList(),
        icon = FileOrEmojiObject.fromJson(json),
        color = json['color'] as String,
        children = (json['children'] == null)
            ? []
            : (json['children'] as List).map((e) => Block.fromJson(e)).toList();
}
