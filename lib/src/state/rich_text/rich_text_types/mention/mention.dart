part of '../../rich_text.dart';

/// https://developers.notion.com/reference/rich-text#mention

/// Possible values include:
/// - "database"
/// - "date"
/// - "link_preview"
/// - "page"
/// - "template_mention"
/// - "user"
sealed class Mention extends RichTextType {
  const Mention();

  factory Mention.fromJson(JsonMap json) {
    return switch (json['type']) {
      'database' => DatabaseMention.fromJson(json['database'] as JsonMap),
      'date' => DateMention.fromJson(json['date'] as JsonMap),
      'link_preview' =>
        LinkPreviewMention.fromJson(json['link_preview'] as JsonMap),
      'template_mention' =>
        TemplateMention.fromJson(json['template_mention'] as JsonMap),
      'user' => UserMention.fromJson(json['user'] as JsonMap),
      _ => throw UnrecognizedTypeInJsonException(
          'Mention.fromJson', json['type'], json)
    };
  }
}
