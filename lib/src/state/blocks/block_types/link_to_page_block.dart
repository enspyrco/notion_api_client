part of 'block_type.dart';

/// Link to page objects contain a key corresponding with the value of type. The value is a type-specific string as described below.
class LinkToPageBlock extends BlockType {
  /// Type of this link to page object.
  ///   string (enum) Possible values are: "page_id", "database_id".
  ///   Example: "page_id"
  ///   Wirename: type
  final String linkType;

  /// Identifier for a page
  ///   Type: string (UUIDv4)
  ///   Example: "7af38973-3787-41b3-bd75-0ed3a1edfac9"
  ///   Wirename: page_id
  final String pageId;

  /// Identifier for a database page
  ///   Type: string (UUIDv4)
  ///   Example: "7af38973-3787-41b3-bd75-0ed3a1edfac9"
  ///   Wirename: database_id
  final String databaseId;

  LinkToPageBlock.fromJson(JsonMap json)
      : linkType = json['type'] as String,
        pageId = json['page_id'] as String,
        databaseId = json['database_id'] as String;
}
