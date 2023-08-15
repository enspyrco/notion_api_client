import 'package:api_client_utils/types.dart';

/// From https://developers.notion.com/reference/page-property-values#relation
/// A page reference is an object with an id key and a string value corresponding to a page ID in another database.
/// Eg.
/// {
///   "properties": {
///     "Related tasks": {
///       "relation": [
///         {
///           "id": "dd456007-6c66-4bba-957e-ea501dcda3a6"
///         }
///       ]
///     }
///   }
/// }
class PageReference {
  PageReference(this.id);

  final String id;

  PageReference.fromJson(JsonMap json) : this(json['id'] as String);
}
