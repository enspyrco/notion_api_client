part of 'block_type.dart';

/// Column List and Column Blocks
///
/// Column Lists are parent blocks for column children. They do not contain any information within the column_list property and can only contain children of type column.
/// Columns are parent blocks for any supported block children, excluding columns. They do not contain any information within the column property. They can only be appended to column_lists.
/// When creating a column list block via Append block children, the column_list must have at least 2 columns, and those columns must have at least one child each.
/// When fetching content for a column_list, first fetch the the column children via Retrieve block children. Then fetch the children for each column block.
/// Column List blocks contain the following information in the column_list property:
class ColumnListBlock extends BlockType {
  /// children	array of column_list block objects	List of columns in the column_list block.
  final List<ColumnBlock> children;

  ColumnListBlock.fromJson(JsonMap json)
      : children = (json['children'] as List)
            .map((e) => ColumnBlock.fromJson(e))
            .toList();
}
