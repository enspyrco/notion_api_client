part of 'block_type.dart';

/// Embed blocks include block types that allow displaying another website within Notion.
class EmbedBlock extends BlockType {
  /// url	string	Link to website the embed block will display.
  final String url;

  EmbedBlock.fromJson(JsonMap json) : url = json['url'] as String;
}
