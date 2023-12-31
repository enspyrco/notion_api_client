import 'package:api_client_utils/types.dart';
import 'package:notion_api_client/src/state/common/file_object.dart';
import 'package:notion_api_client/src/state/common/file_or_emoji_object.dart';
import 'package:notion_api_client/src/state/rich_text/rich_text.dart';
import 'package:notion_api_client/src/state/databases/properties/database_property.dart';

import '../parent.dart';
import '../users/user_reference.dart';

/// Database objects describe the property schema of a database in Notion. Pages are the items (or children) in a database. Page property values must conform to the property objects laid out in the parent database object.
/// Properties marked with an * are available to integrations with any capabilities. Other properties require read content capabilities in order to be returned from the Notion API. For more information on integration capabilities, see the capabilities guide.
class DatabaseObject {
  DatabaseObject._(JsonMap json)
      : id = json['id'] as String,
        createdTime = json['created_time'] as String,
        createdBy = UserReference.fromJson(json['created_by'] as JsonMap),
        lastEditedTime = json['last_edited_time'] as String,
        lastEditedBy =
            UserReference.fromJson(json['last_edited_by'] as JsonMap),
        title =
            (json['title'] as List).map((e) => RichText.fromJson(e)).toList(),
        icon = FileOrEmojiObject.fromJson(json),
        cover = FileObject.fromJson(json['cover'] as JsonMap),
        properties = (json['properties'] as JsonMap).map((key, value) =>
            MapEntry(key, DatabaseProperty.fromJson(value as JsonMap))),
        parent = PageOrWorkspaceParent.fromJson(json),
        url = json['url'] as String,
        archived = json['archived'] as bool;

  /// object*	string	Always "database".	"database"
  final String object = 'database';

  /// id*	string (UUID)	Unique identifier for the database.	"2f26ee68-df30-4251-aad4-8ddc420cba3d"
  final String id;

  /// created_time	string (ISO 8601 date and time)	Date and time when this database was created. Formatted as an ISO 8601 date time string.	"2020-03-17T19:10:04.968Z"
  final String createdTime;

  /// created_by	Partial User	User who created the database.	{"object": "user","id": "45ee8d13-687b-47ce-a5ca-6e2e45548c4b"}
  UserReference createdBy;

  /// last_edited_time	string (ISO 8601 date and time)	Date and time when this database was updated. Formatted as an ISO 8601 date time string.	"2020-03-17T21:49:37.913Z"
  final String lastEditedTime;

  /// last_edited_by	Partial User	User who last edited the database.	{"object": "user","id": "45ee8d13-687b-47ce-a5ca-6e2e45548c4b"}
  final UserReference lastEditedBy;

  /// title	array of rich text objects	Name of the database as it appears in Notion.
  /// See rich text object) for a breakdown of the properties.
  final List<RichText> title;

  /// icon	File Object or Emoji object	Page icon.
  final FileOrEmojiObject icon;

  /// cover	File object (only type of "external" is supported currently)	Page cover image.
  final FileObject cover;

  /// properties*	Schema of properties for the database as they appear in Notion.
  /// key string
  /// The name of the property as it appears in Notion.
  /// value object
  /// A Property object.
  ///   Type: object
  Map<String, DatabaseProperty> properties;

  /// parent	object	The parent of this page. Can be a page or workspace. Parent types are defined below.
  final PageOrWorkspaceParent parent;

  /// url	string	The URL of the Notion database.	"https://www.notion.so/668d797c76fa49349b05ad288df2d136"
  final String url;

  /// archived	boolean	The archived status of the database.	false
  final bool archived;
}
