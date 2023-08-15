part of '../../../rich_text.dart';

// https://developers.notion.com/reference/rich-text#template-mention-type-object

/// The content inside a template button in the Notion UI can include placeholder
/// date and user mentions that populate when a template is duplicated.
/// Template mention type objects contain these populated values.
sealed class TemplateMention extends Mention {
  const TemplateMention();

  factory TemplateMention.fromJson(JsonMap json) {
    return switch (json['type']) {
      'template_mention_date' =>
        TemplateMentionDate.fromJson(json['template_mention_date'] as JsonMap),
      'template_mention_user' =>
        TemplateMentionUser.fromJson(json['template_mention_user'] as JsonMap),
      _ => throw UnrecognizedTypeInJsonException(
          'TemplateMention.fromJson', json['type'], json)
    };
  }
}

class TemplateMentionDate extends TemplateMention {
  const TemplateMentionDate({required this.templateMentionDate});

  final String templateMentionDate;

  TemplateMentionDate.fromJson(JsonMap json)
      : templateMentionDate = json['template_mention_date'] as String;
}

class TemplateMentionUser extends TemplateMention {
  const TemplateMentionUser({required this.templateMentionUser});

  final String templateMentionUser;

  TemplateMentionUser.fromJson(JsonMap json)
      : templateMentionUser = json['template_mention_user'] as String;
}
