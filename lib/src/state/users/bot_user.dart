import 'package:api_client_utils/types.dart';

import 'user.dart';

/// https://developers.notion.com/reference/user#bots

/// User objects that represent bots have the type property set to "bot".
class BotUser extends User {
  BotUser(
      {required String id,
      String? name,
      String? avatarUrl,
      required this.ownerType,
      this.workspaceName,
      this.ownerUser})
      : super(id: id, name: name, avatarUrl: avatarUrl);

  /// The type of owner - either "workspace" or "user".
  /// 	Type: string enum
  final String ownerType;

  /// If the owner.type is "workspace", then workspace.name identifies the name
  /// of the workspace that owns the bot.
  /// If the owner.type is "user", then workspace.name is null.
  final String? workspaceName;

  ///	A user object describing who owns this bot.
  /// Currently only "person" users can own bots.
  final User? ownerUser;

  factory BotUser.fromJson(JsonMap json) {
    final JsonMap botMap = json['bot'] as JsonMap;
    final JsonMap ownerMap = botMap['owner'] as JsonMap;
    final String ownerType = ownerMap['type'] as String;
    final String? workspaceName = ownerMap['workspace'] as String?;
    final JsonMap? ownerUserMap = ownerMap['user'] as JsonMap?;

    return BotUser(
      id: json['id'] as String,
      name: json['name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      ownerType: ownerType,
      workspaceName: workspaceName,
      ownerUser: ownerUserMap == null ? null : User.fromJson(ownerUserMap),
    );
  }
}
