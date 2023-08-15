part of 'property_value.dart';

/// https://developers.notion.com/reference/property-value-object#rich-text-property-values

/// Rich Text property value objects contain an array of rich text objects
/// within the rich_text property.
class RichTextPropertyValue extends PropertyValue {
  RichTextPropertyValue({required this.values});

  final List<RichText> values;

  RichTextPropertyValue.fromJson(JsonList json)
      : this(
          values: json
              .map<RichText>((e) => RichText.fromJson(e as JsonMap))
              .toList(),
        );
}
