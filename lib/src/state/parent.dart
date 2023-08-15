import 'package:api_client_utils/types.dart';

import '../exceptions.dart';

/// https://developers.notion.com/reference/parent-object

/// We make an ADT by having a Parent class as a sealed class
/// With classes that extend Parent and Parent just having a member [id], I
/// believe all useful information about the type of the "parent" object, and
/// the relationship between the types, has been captured and the only useful
/// value is the id.
sealed class Parent {
  const Parent({required this.id});

  final String id;

  factory Parent.fromJson(JsonMap json) {
    return switch (json['type']) {
      'database_id' => DatabaseParent.fromJson(json['database_id'] as String),
      'page_id' => PageParent.fromJson(json['page_id'] as String),
      _ => throw UnrecognizedTypeInJsonException(
          'Parent.fromJson', json['type'], json)
    };
  }
}

/// Database parent
/// The ID of the database that this page belongs to.
class DatabaseParent extends Parent {
  DatabaseParent.fromJson(String json) : super(id: json);
}

abstract class PageOrWorkspaceParent extends Parent {
  PageOrWorkspaceParent({required String id}) : super(id: id);
  factory PageOrWorkspaceParent.fromJson(JsonMap json) {
    return (json['type'] == 'page')
        ? PageParent.fromJson(json['page_id'] as String)
        : WorkspaceParent();
  }
}

/// Page parent
/// The ID of the page that this page belongs to.
class PageParent extends PageOrWorkspaceParent {
  PageParent.fromJson(String json) : super(id: json);
}

/// Workspace parent
/// A page with a workspace parent is a top-level page within a Notion workspace. The parent property is an object containing the following keys:
class WorkspaceParent extends PageOrWorkspaceParent {
  WorkspaceParent() : super(id: '');
}
