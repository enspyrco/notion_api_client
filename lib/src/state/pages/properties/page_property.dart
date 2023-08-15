import 'package:api_client_utils/types.dart';

import 'property_values/property_value.dart';

/// A page object is made up of page properties that contain data about the page.
/// When you send a request to Create a page, you set the page properties in the properties object body param.
/// Retrieve a page gets the identifier, type, and value of a page’s properties. Retrieve a page property item returns information about a single property ID.
/// An Update page query modifies the page property values specified in the properties object body param.
class PageProperty {
  const PageProperty(this.id, {this.value});

  /// An underlying identifier for the property.
  /// id may be used in place of name when creating or updating pages.
  /// id remains constant when the property name changes.
  final String id;

  /// Properties only contains the ID of the property (as of version 2022-06-28)
  final PropertyValue? value;

  PageProperty.fromJson(JsonMap json)
      : id = json['id'] as String,
        value = PropertyValue.fromJson(json);
}
