part of 'property_value.dart';

/// https://developers.notion.com/reference/property-value-object#status-property-values

///
class StatusPropertyValue extends PropertyValue {
  const StatusPropertyValue({
    required this.id,
    required this.name,
    required this.color,
  });

  /// ID of the option. (UUIDv4)
  final String id;

  /// Name of the option as it appears in Notion.
  final String name;

  /// Color of the option.
  /// Possible values are: "default", "gray", "brown", "red", "orange", "yellow", "green", "blue", "purple", "pink". Defaults to "default".
  ///	 Type: string (enum)
  final String color;

  StatusPropertyValue.fromJson(JsonMap json)
      : this(
          id: json['id'] as String,
          name: json['name'] as String,
          color: json['color'] as String,
        );
}
