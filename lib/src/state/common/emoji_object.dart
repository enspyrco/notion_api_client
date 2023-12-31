import 'package:api_client_utils/types.dart';

import 'file_or_emoji_object.dart';

/// https://developers.notion.com/reference/emoji-object

/// Emoji objects contain emoji data for page icons.
/// Emoji objects are used to set the page icon to an emoji.
class EmojiObject implements FileOrEmojiObject {
  /// Type of page icon. Possible values are: "emoji".
  ///   Type: string (enum)
  @override
  final String type = 'emoji';

  /// Emoji character.
  final String emoji;

  EmojiObject.fromJson(JsonMap json) : emoji = json['emoji'] as String;
}
