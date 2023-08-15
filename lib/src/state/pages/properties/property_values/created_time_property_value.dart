part of 'property_value.dart';

/// https://developers.notion.com/reference/property-value-object#created-time-property-values
/// https://developers.notion.com/reference/property-item-object#created-time-property-values

/// Created time property value objects contain a string within the created_time property.
/// The string contains the date and time when this page was created.
/// It is formatted as an ISO 8601 date time string (i.e. "2020-03-17T19:10:04.968Z").
class CreatedTimePropertyValue extends PropertyValue {
  const CreatedTimePropertyValue({required this.time});

  ///
  final DateTime time;

  CreatedTimePropertyValue.fromJson(String json)
      : this(time: DateTime.parse(json));
}
