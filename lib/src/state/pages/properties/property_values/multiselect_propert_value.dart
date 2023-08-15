part of 'property_value.dart';

/// https://developers.notion.com/reference/property-value-object#multi-select-property-values

/// Multi-select property value objects contain an array of multi-select option
/// values within the multi_select property.
class MultiSelectPropertyValue extends PropertyValue {
  const MultiSelectPropertyValue({required this.options});

  final List<MultiSelectOption> options;

  MultiSelectPropertyValue.fromJson(JsonList json)
      : this(
          options: json
              .map<MultiSelectOption>(
                  (e) => MultiSelectOption.fromJson(e as JsonMap))
              .toList(),
        );
}

class MultiSelectOption {
  const MultiSelectOption(this.id, this.name, this.color);

  /// ID of the option.
  /// (UUIDv4)
  final String id;

  /// Name of the option as it appears in Notion.
  final String name;

  /// Color of the option.
  /// Possible values are: "default", "gray", "brown", "red", "orange", "yellow", "green", "blue", "purple", "pink". Defaults to "default".
  ///  Type: 	string (enum)
  final String color;

  MultiSelectOption.fromJson(JsonMap json)
      : this(json['id'] as String, json['name'] as String,
            json['color'] as String);
}
