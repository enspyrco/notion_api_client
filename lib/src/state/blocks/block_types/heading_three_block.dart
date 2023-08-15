part of 'block_type.dart';

/// Heading three block objects contain the following information within the heading_3 property:
class HeadingThreeBlock extends BlockType {
  /// rich_text	array of rich text objects	Rich text in the heading block.
  final List<RichText> richTexts;

  /// color	string (enum)	Color of the block. Possible values are: "default", "gray", "brown", "orange", "yellow", "green", "blue", "purple", "pink", "red", "gray_background", "brown_background", "orange_background", "yellow_background", "green_background", "blue_background", "purple_background", "pink_background", "red_background".
  final String color;

  /// Whether or not the heading block is a toggle heading or not.
  /// If true, then the heading block toggles and can support children.
  /// If false, then the heading block is a static heading block.
  final bool isToggleable;

  HeadingThreeBlock.fromJson(JsonMap json)
      : richTexts = (json['rich_text'] as List)
            .map((e) => RichText.fromJson(e))
            .toList(),
        color = json['color'] as String,
        isToggleable = json['is_toggleable'] as bool;
}
