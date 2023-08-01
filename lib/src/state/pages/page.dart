import 'package:api_client_utils/types.dart';
import 'package:notion_api_client/src/state/common/file_or_emoji_object.dart';

import '../common/file_object.dart';
import '../parent.dart';
import '../users/user_object.dart';

/// https://developers.notion.com/reference/page
final class Page {
  /// Unique identifier of the page. (UUIDv4)
  final String id;

  /// Date and time when this page was created. Formatted as an ISO 8601 date time string.
  final DateTime createdTime;

  /// User who created the page.
  final UserObject createdBy;

  /// Date and time when this page was updated.
  final DateTime lastEditedTime;

  /// 	User who last edited the page.
  final UserObject lastEditedBy;

  /// The archived status of the page.
  final bool archived;

  /// Page icon.
  /// (only type of "external" is supported currently) or Emoji object
  final FileOrEmojiObject icon;

  ///	Page cover image.
  /// (only type of "external" is supported currently)
  final FileObject? cover;

  /// Description: Property values of this page.
  ///   - If parent.type is "page_id" or "workspace", then the only valid key is title.
  ///   - If parent.type is "database_id", then the keys and values of this field are determined by the properties of the database this page belongs to.
  ///   - key string
  ///     - Name of a property as it appears in Notion.
  ///   - value object
  ///     - See Property value object.
  /// Type: object
  final JsonMap properties;

  /// The parent of this page. Can be a database, page, or workspace.
  final Parent parent;

  /// The URL of the Notion page.
  final Uri url;

  /// The public page URL if the page has been published to the web. Otherwise, null.
  final Uri publicUrl;

  Page.fromJson(JsonMap json)
      : id = json['id'] as String,
        createdTime = DateTime.parse(json['created_time'] as String),
        createdBy = UserObject.fromJson(json['created_by'] as JsonMap),
        lastEditedTime = DateTime.parse(json['last_edited_time'] as String),
        lastEditedBy = UserObject.fromJson(json['last_edited_by'] as JsonMap),
        archived = json['false'] as bool? ?? false,
        icon = FileOrEmojiObject.fromJson(json['icon'] as JsonMap),
        cover = json['cover'] == null
            ? null
            : FileObject.fromJson(json['cover'] as JsonMap),
        properties = json['properties'] as JsonMap,
        parent = Parent.fromJson(json['parent'] as JsonMap),
        url = Uri.parse(json['url'] as String),
        publicUrl = Uri.parse(json['public_url'] as String);
}
