part of 'property_value.dart';

/// https://developers.notion.com/reference/property-value-object#checkbox-property-values
/// https://developers.notion.com/reference/property-item-object#checkbox-property-values

/// Checkbox property value objects contain a boolean within the checkbox property.
class CheckboxPropertyValue extends PropertyValue {
  const CheckboxPropertyValue({required this.value});

  ///
  final bool value;

  CheckboxPropertyValue.fromJson(JsonMap json)
      : this(value: json['checkbox'] as bool);
}
