import 'package:api_client_utils/types.dart';

import '../common/file_object.dart';
import '../common/file_or_emoji_object.dart';
import '../parent.dart';
import '../users/user.dart';
import 'properties/page_property.dart';
import 'properties/property_values/property_value.dart';

/// **Page**
/// https://developers.notion.com/reference/page
/// The Page object contains the page properties of a single Notion page.
///
/// **Page Properties**
/// https://developers.notion.com/reference/page-property-values
/// Each page property contains one or more property values (called property items
/// when retrieved individually).
///
/// **Property Values** (part of a Page object when retrieving and updating pages)
/// https://developers.notion.com/reference/property-value-object
/// Defines the identifier, type, and value of a page property _in_a_page_object_.
/// Each page property contains 'id' and 'type' keys, as well as a *key* which
/// is the same as the 'type' *value*, eg. {'type': 'rich_text', 'rich_text': ...}
/// This value is the 'property value' and is an object containing type-specific data.
///
/// **Property Items** (returned from the "Retrieve a page property item" endpoint)
/// https://developers.notion.com/reference/property-item-object
/// Describes the identifier, type, and value of a page property _retrieved_individually_.
final class Page {
  /// Unique identifier of the page. (UUIDv4)
  final String id;

  /// Date and time when this page was created. Formatted as an ISO 8601 date time string.
  final DateTime createdTime;

  /// User who created the page.
  final User createdBy;

  /// Date and time when this page was updated.
  final DateTime lastEditedTime;

  /// 	User who last edited the page.
  final User lastEditedBy;

  /// The archived status of the page.
  final bool archived;

  /// Page icon.
  /// (only type of "external" is supported currently) or Emoji object
  final FileOrEmojiObject icon;

  ///	Page cover image.
  /// (only type of "external" is supported currently)
  final FileObject? cover;

  /// Property values of this page.
  ///   key: Name of property as it appears in Notion.
  ///   value: See Property value object.
  final Map<String, PageProperty> properties;

  /// The parent of this page. Can be a database, page, or workspace.
  final Parent parent;

  /// The URL of the Notion page.
  final Uri url;

  /// The public page URL if the page has been published to the web. Otherwise, null.
  final Uri publicUrl;

  Page.fromJson(JsonMap json)
      : id = json['id'] as String,
        createdTime = DateTime.parse(json['created_time'] as String),
        createdBy = User.fromJson(json['created_by'] as JsonMap),
        lastEditedTime = DateTime.parse(json['last_edited_time'] as String),
        lastEditedBy = User.fromJson(json['last_edited_by'] as JsonMap),
        archived = json['archived'] as bool? ?? false,
        icon = FileOrEmojiObject.fromJson(json['icon'] as JsonMap),
        cover = json['cover'] == null
            ? null
            : FileObject.fromJson(json['cover'] as JsonMap),

        /// If parent.type is "page_id" or "workspace", then the only valid key is title.
        /// If parent.type is "database_id", then the keys and values of this field are determined by the properties of the database this page belongs to.
        properties = Map.fromEntries((json['properties'] as JsonMap)
            .entries
            .map((MapEntry<String, Object?> e) =>
                MapEntry(e.key, PageProperty.fromJson(e.value as JsonMap)))),
        parent = Parent.fromJson(json['parent'] as JsonMap),
        url = Uri.parse(json['url'] as String),
        publicUrl = Uri.parse(json['public_url'] as String);
}
