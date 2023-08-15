part of '../../../rich_text.dart';

/// https://developers.notion.com/reference/rich-text#date-mention-type-object

/// Date mentions contain a date property value object within the date property.
class DateMention extends Mention {
  final DatePropertyValue date;

  DateMention.fromJson(JsonMap json)
      : date = DatePropertyValue.fromJson(json['date'] as JsonMap);
}
