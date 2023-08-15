part of '../../../rich_text.dart';

/// https://developers.notion.com/reference/rich-text#user-mention-type-object

//// User mentions contain a user object within the user property.
class UserMention extends Mention {
  final User user;

  UserMention.fromJson(JsonMap json)
      : user = User.fromJson(json['user'] as JsonMap);
}
