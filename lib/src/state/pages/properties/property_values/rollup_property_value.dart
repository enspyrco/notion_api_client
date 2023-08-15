part of 'property_value.dart';

/// https://developers.notion.com/reference/property-value-object#rollup-property-values
/// https://developers.notion.com/reference/property-item-object#rollup-property-values
///
/// Rollup property value objects represent the result of evaluating a rollup described in the
/// database's properties. These objects contain a type key and a key corresponding with the value of type.
class RollupPropertyValue extends PropertyValue {
  RollupPropertyValue(
      {required this.type, required this.function, this.hasMore});

  /// The type of rollup.
  /// Possible values are "number", "date", "array", "unsupported" and "incomplete".
  ///  Type: string (enum)
  final String type;

  /// Describes the aggregation used.
  /// Possible values include: count, count_values, empty, not_empty, unique, show_unique, percent_empty, percent_not_empty, sum, average, median, min, max, range, earliest_date, latest_date, date_range, checked, unchecked, percent_checked, percent_unchecked, count_per_group, percent_per_group, show_original
  ///  Type: string (enum)
  final String function;

  /// In order to avoid timeouts, if the rollup has a with a large number of aggregations
  /// or properties the endpoint returns a next_cursor value that is used to determinate
  /// the aggregation value so far for the subset of relations that have been paginated through.
  /// Once has_more is false, then the final rollup value is returned.
  /// See the Pagination documentation for more information on pagination in the Notion API.
  final bool? hasMore;

  factory RollupPropertyValue.fromJson(JsonMap json) => RollupPropertyValue(
        type: json['type'] as String,
        function: json['function'] as String,
        hasMore: json['has_more'] as bool,
      );
}
