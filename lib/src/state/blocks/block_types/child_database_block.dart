part of 'block_type.dart';

/// Child database block objects contain the following information within the child_database property:
class ChildDatabaseBlock extends BlockType {
  /// title	string	Plain text of the database title
  final String title;

  ChildDatabaseBlock.fromJson(JsonMap json) : title = json['title'] as String;
}
