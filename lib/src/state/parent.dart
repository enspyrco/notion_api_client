import 'package:api_client_utils/types.dart';

/// https://developers.notion.com/reference/parent-object

/// We make an ADT by having a Parent class as a sealed class
/// With classes that extend Parent and Parent just having a member [id], I
/// believe all useful information about the type of the "parent" object, and
/// the relationship between the types, has been captured and the only useful
/// value is the id.
class Parent {
  final String id;

  Parent.fromJson(JsonMap json)
      : id = (json['database_id'] as String?) ??
            (json['page_id'] as String?) ??
            '';
}

/// Database parent
class DatabaseParent implements Parent {
  /// The ID of the database that this page belongs to.
  @override
  final String id;

  DatabaseParent.fromJson(JsonMap json) : id = json['database_id'] as String;
}

abstract class PageOrWorkspaceParent implements Parent {
  factory PageOrWorkspaceParent.fromJson(JsonMap json) {
    return (json['type'] == 'page')
        ? PageParent.fromJson(json)
        : WorkspaceParent.fromJson(json);
  }
}

/// Page parent
/// The parent property is an object containing the following keys:
class PageParent implements PageOrWorkspaceParent {
  /// The ID of the page that this page belongs to.	"b8595b75-abd1-4cad-8dfe-f935a8ef57cb"
  @override
  final String id;

  PageParent.fromJson(JsonMap json) : id = json['page_id'] as String;
}

/// Workspace parent
/// A page with a workspace parent is a top-level page within a Notion workspace. The parent property is an object containing the following keys:
class WorkspaceParent implements PageOrWorkspaceParent {
  @override
  String get id => '';

  WorkspaceParent.fromJson(JsonMap json);
}
