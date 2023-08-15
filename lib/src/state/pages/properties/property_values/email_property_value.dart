part of 'property_value.dart';

/// https://developers.notion.com/reference/property-value-object#email-property-values
/// https://developers.notion.com/reference/property-item-object#email-property-values

/// Email property value objects contain a string within the email property.
/// The string describes an email address (i.e. "hello@example.org").
class EmailPropertyValue extends PropertyValue {
  const EmailPropertyValue({required this.email});

  ///
  final String email;

  EmailPropertyValue.fromJson(String json) : this(email: json);
}
