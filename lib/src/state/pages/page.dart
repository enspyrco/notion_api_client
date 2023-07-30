import 'package:api_client_utils/types.dart';

import '../parent.dart';
import '../users/user_object.dart';

// https://developers.notion.com/reference/page
class Page {
  // Always "page".
  final String object = 'page';

  // (UUIDv4)	Unique identifier of the page.
  final String id;

  // Date and time when this page was created. Formatted as an ISO 8601 date time string.
  final String createdTime;

  // User who created the page.
  final UserObject createdBy;

  // last_edited _time	string (ISO 8601 date and time)	Date and time when this page was updated. Formatted as an ISO 8601 date time string.	"2020-03-17T19:10:04.968Z"

  // last_edited_by	Partial User	User who last edited the page.	{"object": "user","id": "45ee8d13-687b-47ce-a5ca-6e2e45548c4b"}

  // archived	boolean	The archived status of the page.	false

  // icon	File Object (only type of "external" is supported currently) or Emoji object	Page icon.

  // cover	File object (only type of "external" is supported currently)	Page cover image.

  // Description: Property values of this page.
  //   - If parent.type is "page_id" or "workspace", then the only valid key is title.
  //   - If parent.type is "database_id", then the keys and values of this field are determined by the properties of the database this page belongs to.
  //   - key string
  //     - Name of a property as it appears in Notion.
  //   - value object
  //     - See Property value object.
  // Type: object
  final JsonMap properties;

  // The parent of this page. Can be a database, page, or workspace.
  final Parent parent;

  // The URL of the Notion page.
  final String url;

  Page.fromJson(JsonMap json)
      : id = json['id'] as String,
        createdTime = json['created_time'] as String,
        createdBy = UserObject.fromJson(json['created_by'] as JsonMap),
        properties = json['properties'] as JsonMap,
        parent = Parent.fromJson(json['parent'] as JsonMap),
        url = json['url'] as String;
}

// The following documentation is taken from https://developers.notion.com/reference/page:

// Database parent
// The parent property is an object containing the following keys:
//   - Property	Type	Description	Example values
//   - type	string	Always "database_id".	"database_id"
//   - database_id	string (UUIDv4)	The ID of the database that this page belongs to.	"b8595b75-abd1-4cad-8dfe-f935a8ef57cb"

// Page parent
// The parent property is an object containing the following keys:
//   - Property	Type	Description	Example values
//   - type	string	Always "page_id".	"page_id"
//   - page_id	string (UUIDv4)	The ID of the page that this page belongs to.	"b8595b75-abd1-4cad-8dfe-f935a8ef57cb"

// Workspace parent
// A page with a workspace parent is a top-level page within a Notion workspace. The parent property is an object containing the following keys:
//   - Property	Type	Description	Example values
//   - type	string	Always "workspace".	"workspace"
//   - workspace	boolean	Always true.	true
