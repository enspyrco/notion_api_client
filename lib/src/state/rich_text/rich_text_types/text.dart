part of '../rich_text.dart';

/// https://developers.notion.com/reference/rich-text#text

/// An object with information about any inline link in this text, if included.
/// If the text contains an inline link, then the object key is url and the value is the URL’s string web address.
/// If the text doesn’t have any inline links, then the value is null.
class Text extends RichTextType {
  /// The actual text content of the text.
  final String content;

  /// An object with information about any inline link in this text, if included.
  final String? url;

  Text.fromJson(JsonMap json)
      : content = json['content'] as String,

        /// If the text contains an inline link, then the object key is url and the value is the URL’s string web address.
        /// If the text doesn’t have any inline links, then the value is null.
        url = (json['link'] as JsonMap?) == null
            ? null
            : (json['link'] as JsonMap)['url'] as String;
}
