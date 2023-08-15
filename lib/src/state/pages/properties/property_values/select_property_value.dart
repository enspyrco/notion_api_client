part of 'property_value.dart';

/// https://developers.notion.com/reference/property-value-object#select-property-values

/// Select property value objects contain the following data within the select property
///
/// We use 'selectId' rather than 'id' because we are using inheritance to
/// represent a json structure that has two 'id' keys: in the page property object
/// and also in the property value object that is the value for the
/// 'select' key of the page property object
/// eg. { "object": "page", "id": "be633bf1-dfa0-436d-b259-571129a590e5",
///       ...
///       "properties": {
///          "Option": {
///            "select": {
///              "id": "c3406b80-bda4-45e0-add2-2748ac1527b",
///              ...
class SelectPropertyValue extends PropertyValue {
  const SelectPropertyValue({
    required this.selectId,
    required this.name,
    required this.color,
  });

  /// ID of the option.
  /// When updating a select property, you can use either name or id.
  final String selectId;

  /// Name of the option as it appears in Notion.
  /// If the select database property does not yet have an option by that name, it will be added to the database schema if the integration also has write access to the parent database.
  /// Note: Commas (",") are not valid for select values.	"Fruit"
  final String name;

  /// Color of the option.
  /// Possible values are: "default", "gray", "brown", "red", "orange", "yellow", "green", "blue", "purple", "pink". Defaults to "default".
  ///   Type:	string (enum)
  final String color;

  SelectPropertyValue.fromJson(JsonMap json)
      : this(
          selectId: json['id'] as String,
          name: json['name'] as String,
          color: json['color'] as String,
        );
}
