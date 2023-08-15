library rich_text;

import 'package:api_client_utils/types.dart';

import '../../exceptions.dart';
import '../common/page_reference.dart';
import '../databases/database_reference.dart';
import '../pages/properties/property_values/property_value.dart';
import '../users/user.dart';
import 'annotions.dart';

part 'rich_text_types/rich_text_type.dart';
part 'rich_text_types/text.dart';
part 'rich_text_types/equation.dart';
part 'rich_text_types/mention/mention.dart';
part 'rich_text_types/mention/mention_types/database_mention.dart';
part 'rich_text_types/mention/mention_types/date_mention.dart';
part 'rich_text_types/mention/mention_types/link_preview_mention.dart';
part 'rich_text_types/mention/mention_types/page_mention.dart';
part 'rich_text_types/mention/mention_types/template_mention.dart';
part 'rich_text_types/mention/mention_types/user_mention.dart';

/// https://developers.notion.com/reference/rich-text

/// Notion uses rich text to allow users to customize their content.
/// Rich text refers to a type of document where content can be styled and
/// formatted in a variety of customizable ways.
/// This includes styling decisions, such as the use of italics, font size, and
/// font color, as well as formatting, such as the use of hyperlinks or code blocks.
class RichText {
  RichText({
    required this.plainText,
    this.href,
    required this.annotations,
    required this.subtype,
  });

  /// The plain text without annotations.
  final String plainText;

  /// The URL of any link or internal Notion mention in this text, if any.
  final String? href;

  /// All annotations that apply to this rich text.
  /// Annotations include colors and bold/italics/underline/strikethrough.
  final Annotations annotations;

  /// The type of this rich text object via composition, meaning the RichTextType
  /// object describes the type and carries values relevant to that type.
  final RichTextType subtype;

  factory RichText.fromJson(JsonMap json) {
    final richTextType = switch (json['type']) {
      'text' => Text.fromJson(json['text'] as JsonMap),
      'mention' => Mention.fromJson(json['mention'] as JsonMap),
      'equation' => Equation.fromJson(json['equation'] as String),
      _ => throw UnrecognizedTypeInJsonException(
          'RichTextObject.fromJson', json['type'], json)
    };

    return RichText(
      plainText: json['plain_text'] as String,
      href: json['href'] as String?,
      annotations: Annotations.fromJson(json['annotations'] as JsonMap),
      subtype: richTextType,
    );
  }
}
