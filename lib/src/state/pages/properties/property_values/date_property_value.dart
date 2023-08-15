part of 'property_value.dart';

/// https://developers.notion.com/reference/property-value-object#date-property-values

/// Date property value objects contain the following data within the date property
class DatePropertyValue extends PropertyValue {
  const DatePropertyValue({required this.start, this.end, this.timeZone});

  /// An ISO 8601 format date, with optional time.
  final DateTime start;

  /// An ISO 8601 formatted date, with optional time. Represents the end of a date range.
  /// If null, this property's date value is not a range.	"2020-12-08T12:00:00Z"
  final DateTime? end;

  /// Time zone information for start and end.
  /// Possible values are extracted from the IANA database (https://www.iana.org/time-zones)
  /// and they are based on the time zones from Moment.js.
  /// When time zone is provided, start and end should not have any UTC offset.
  /// In addition, when time zone is provided, start and end cannot be dates
  /// without time information.
  /// If null, time zone information will be contained in UTC offsets in start
  /// and end.
  final String? timeZone;

  DatePropertyValue.fromJson(JsonMap json)
      : this(
          start: DateTime.parse(json['start'] as String),
          end: json['end'] == null
              ? null
              : DateTime.parse(json['end'] as String),
          timeZone: json['time_zone'] as String?,
        );
}
