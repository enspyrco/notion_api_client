part of 'property_value.dart';

/// https://developers.notion.com/reference/property-value-object#url-property-values
/// https://developers.notion.com/reference/property-item-object#url-property-values

/// URL property value objects contain a non-empty string within the url property.
/// The string describes a web address (i.e. "http://worrydream.com/EarlyHistoryOfSmalltalk/").
class UrlPropertyValue extends PropertyValue {
  const UrlPropertyValue({required this.url});

  final String url;

  UrlPropertyValue.fromJson(String json) : this(url: json);
}
