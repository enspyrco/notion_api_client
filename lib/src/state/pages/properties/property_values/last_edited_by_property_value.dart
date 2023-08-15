part of 'property_value.dart';

/// https://developers.notion.com/reference/property-value-object#last-edited-by-property-values
/// https://developers.notion.com/reference/property-item-object#last-edited-by-property-values

/// Last edited by property value objects contain a user object within the last_edited_by property.
/// The user object describes the user who last updated this page.
class LastEditedByPropertyValue extends PropertyValue {
  const LastEditedByPropertyValue({required this.user});

  ///
  final User user;

  LastEditedByPropertyValue.fromJson(JsonMap json)
      : this(user: User.fromJson(json));
}
