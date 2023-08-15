part of 'block_type.dart';

/// Bookmark blocks
class BookmarkBlock extends BlockType {
  /// url	string	Bookmark link
  final String url;

  /// caption	array of Rich text object text objects	Caption of the bookmark block
  final List<RichText> caption;

  BookmarkBlock.fromJson(JsonMap json)
      : url = json['url'] as String,
        caption =
            (json['caption'] as List).map((e) => RichText.fromJson(e)).toList();
}
