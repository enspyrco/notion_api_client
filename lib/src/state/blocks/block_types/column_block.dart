part of 'block_type.dart';

/// Column blocks contain the following information in the column property.
class ColumnBlock extends BlockType {
  /// children	array of block objects	List of blocks in a single column.
  final List<Block> children;

  ColumnBlock.fromJson(JsonMap json)
      : children =
            (json['children'] as List).map((e) => Block.fromJson(e)).toList();
}
