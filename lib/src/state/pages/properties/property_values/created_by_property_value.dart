part of 'property_value.dart';

/// https://developers.notion.com/reference/property-value-object#created-by-property-values

/// Created by property value objects contain a user object within the created_by property.
/// The user object describes the user who created this page.
class CreatedByPropertyValue extends PropertyValue {
  const CreatedByPropertyValue({required this.user});

  ///
  final User user;

  CreatedByPropertyValue.fromJson(JsonMap json)
      : this(user: User.fromJson(json));
}
