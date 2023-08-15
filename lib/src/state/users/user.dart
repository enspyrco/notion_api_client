import 'package:api_client_utils/types.dart';
import 'package:notion_api_client/src/exceptions.dart';

import 'bot_user.dart';
import 'person_user.dart';

/// https://developers.notion.com/reference/user

class User {
  User({required this.id, this.name, this.avatarUrl});

  /// Unique identifier for this user.
  final String id;

  /// User's name, as displayed in Notion.
  final String? name;

  /// Chosen avatar image.
  final String? avatarUrl;

  factory User.fromJson(JsonMap json) {
    var type = json['type'] as String?;

    if (type == null) {
      return User(
          id: json['id'] as String,
          name: json['name'] as String?,
          avatarUrl: json['avatar_url'] as String?);
    }
    if (type == 'person') {
      return PersonUser.fromJson(json);
    }
    if (type == 'bot') {
      return BotUser.fromJson(json);
    }

    throw UnrecognizedTypeInJsonException('UserObject.fromJson', type, json);
  }
}
