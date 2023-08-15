part of '../../../rich_text.dart';

/// https://developers.notion.com/reference/rich-text#page-mention-type-object

/// Page mentions contain a page reference within the corresponding page field.
class PageMention extends Mention {
  final PageReference page;

  PageMention.fromJson(JsonMap json)
      : page = PageReference.fromJson(json['page'] as JsonMap);
}
