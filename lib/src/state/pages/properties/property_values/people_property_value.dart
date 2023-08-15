part of 'property_value.dart';

/// https://developers.notion.com/reference/property-value-object#people-property-values
/// https://developers.notion.com/reference/property-item-object#people-property-values

/// People property value objects contain an array of user objects within the people property.
class PeoplePropertyValue extends PropertyValue {
  PeoplePropertyValue({required this.people});

  final List<User> people;

  factory PeoplePropertyValue.fromJson(JsonList json) => PeoplePropertyValue(
        people: json.map<User>((e) => User.fromJson(e as JsonMap)).toList(),
      );
}
