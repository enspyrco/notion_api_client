part of 'property_value.dart';

/// https://developers.notion.com/reference/property-value-object#last-edited-time-property-values
/// https://developers.notion.com/reference/property-item-object#last-edited-time-property-values
///
/// Last edited time property value objects contain a string within the last_edited_time property.
/// The string contains the date and time when this page was last updated.
/// It is formatted as an ISO 8601 date time string (i.e. "2020-03-17T19:10:04.968Z").
class LastEditedTimePropertyValue extends PropertyValue {
  const LastEditedTimePropertyValue({required this.time});

  ///
  final DateTime time;

  LastEditedTimePropertyValue.fromJson(String json)
      : this(time: DateTime.parse(json));
}
