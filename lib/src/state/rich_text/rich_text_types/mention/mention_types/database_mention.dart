part of '../../../rich_text.dart';

/// https://developers.notion.com/reference/rich-text#database-mention-type-object

/// Database mentions contain a database reference within the database property.
class DatabaseMention extends Mention {
  final DatabaseReference database;

  DatabaseMention.fromJson(JsonMap json)
      : database = DatabaseReference.fromJson(json['database'] as JsonMap);
}
