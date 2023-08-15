part of '../../../rich_text.dart';

/// https://developers.notion.com/reference/rich-text#link-preview-mention-type-object

/// If a user opts to share a Link Preview as a mention, then the API handles
/// the Link Preview mention as a rich text object with a type value of link_preview.
/// Link preview rich text mentions contain a corresponding link_preview object
/// that includes the url that is used to create the Link Preview mention.
class LinkPreviewMention extends Mention {
  final String url;

  LinkPreviewMention.fromJson(JsonMap json) : url = json['url'] as String;
}
