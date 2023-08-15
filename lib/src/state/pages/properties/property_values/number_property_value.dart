part of 'property_value.dart';

/// https://developers.notion.com/reference/property-value-object#number-property-values
/// https://developers.notion.com/reference/property-item-object#number-property-values

/// Number property value objects contain a number within the number property.
class NumberPropertyValue extends PropertyValue {
  NumberPropertyValue({required this.number});

  final num number;

  factory NumberPropertyValue.fromJson(num json) =>
      NumberPropertyValue(number: json);
}
