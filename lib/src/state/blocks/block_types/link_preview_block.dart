part of 'block_type.dart';

/// Link Preview blocks
/// NOTE: The link_preview block will only be returned as part of a response. It cannot be created via the API.
class LinkPreviewBlock extends BlockType {
  /// Link Preview block objects return the originally pasted url.
  final String url;

  LinkPreviewBlock.fromJson(JsonMap json) : url = json['url'] as String;
}
