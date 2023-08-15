part of 'block_type.dart';

/// Table of contents blocks
class TableOfContentsBlock extends BlockType {
  /// color	string (enum)	Color of the block. Possible values are: "default", "gray", "brown", "orange", "yellow", "green", "blue", "purple", "pink", "red", "gray_background", "brown_background", "orange_background", "yellow_background", "green_background", "blue_background", "purple_background", "pink_background", "red_background".
  final String color;

  TableOfContentsBlock.fromJson(JsonMap json) : color = json['color'] as String;
}
