part of 'property_value.dart';

/// https://developers.notion.com/reference/property-value-object#phone-number-property-values
/// https://developers.notion.com/reference/property-item-object#phone-number-property-values

/// Phone number property value objects contain a string within the phone_number property.
/// No structure is enforced.
class PhoneNumberPropertyValue extends PropertyValue {
  PhoneNumberPropertyValue({required this.value});

  final String value;

  factory PhoneNumberPropertyValue.fromJson(String json) =>
      PhoneNumberPropertyValue(value: json);
}
