part of 'block_type.dart';

/// Child page block objects contain the following information within the child_page property:
class ChildPageBlock extends BlockType {
  /// title	string	Plain text of page title.
  final String title;

  ChildPageBlock.fromJson(JsonMap json)
      : title = (json['child_page'] as JsonMap)['title'] as String;
}
