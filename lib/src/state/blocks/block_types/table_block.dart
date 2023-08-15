part of 'block_type.dart';

/// Table blocks
///
/// Tables are parent blocks for table row children. They can only contain children of type table_row.
/// When creating a table block via the Append block children endpoint, the table must have at least 1 table_row whose cells array has the same length as the table_width.
///
/// To fetch content for a table, fetch the the table_row children via Retrieve block children. The table block itself only contains formatting data, no content.
/// Table blocks contain the following within the table property:
class TableBlock extends BlockType {
  /// table_width	integer	Number of columns in the table. Note that this cannot be changed via the public API once a table is created.	3
  final int tableWidth;

  /// has_column_header	boolean	Whether or not the table has a column header. If true, the first row in the table will appear visually distinct from the other rows.	false
  final bool hasColumnHeader;

  /// has_row_header	boolean	Whether or not the table has a header row. If true, the first column in the table will appear visually distinct from the other columns.	false
  final bool hasRowHeader;

  /// children	array of table_row block objects	List of table_row children for this table.	[{"type": "table_row","table_row": {"cells": [[{"type": "text","text": {"content": "column 1 content"},"plain_text": "column 1 content"}]]}}]
  final List<TableRowBlock> children;

  TableBlock.fromJson(JsonMap json)
      : tableWidth = json['table_width'] as int,
        hasColumnHeader = json['has_column_header'] as bool,
        hasRowHeader = json['has_row_header'] as bool,
        children = (json['children'] as List)
            .map((e) => TableRowBlock.fromJson(e))
            .toList();
}
