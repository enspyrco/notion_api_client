part of 'property_value.dart';

/// https://developers.notion.com/reference/property-value-object#title-property-values

/// Title property value objects contain an array of rich text objects within
/// the title property.
class TitlePropertyValue extends PropertyValue {
  const TitlePropertyValue({required this.values});

  final List<RichText> values;

  TitlePropertyValue.fromJson(JsonList json)
      : this(
          values: json
              .map<RichText>((e) => RichText.fromJson(e as JsonMap))
              .toList(),
        );
}
