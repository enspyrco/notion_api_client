part of 'block_type.dart';

/// Table row blocks contain the following within the table_row property:
class TableRowBlock extends BlockType {
  /// cells	array of array of Rich text objects	Array of cell contents in horizontal display order. Each cell itself is an array of rich text objects.	[
  /// Example: [{"type": "text","text": {"content": "simple","link": null},"annotations": {"bold": false,"italic": false,"strikethrough": false,"underline": false,"code": false,"color": "default"},"plain_text": "simple","href": null}]]
  final List<RichText> cells;

  TableRowBlock.fromJson(JsonMap json)
      : cells =
            (json['cells'] as List).map((e) => RichText.fromJson(e)).toList();
}
