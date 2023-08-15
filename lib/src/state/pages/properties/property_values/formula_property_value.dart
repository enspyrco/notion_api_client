part of 'property_value.dart';

/// https://developers.notion.com/reference/property-value-object#formula-property-values
/// https://developers.notion.com/reference/property-item-object#formula-property-values
///
/// Formula property value objects represent the result of evaluating a formula described in the database's properties.
/// These objects contain a type key and a key corresponding with the value of type.
class FormulaPropertyValue extends PropertyValue {
  const FormulaPropertyValue({required this.formula});

  ///
  final FormulaPropertyValueType formula;

  FormulaPropertyValue.fromJson(JsonMap json)
      : this(
          formula: switch (json['type']) {
            'string' => StringFormulaPropertyValue(json['string'] as String),
            'number' => NumberFormulaPropertyValue(json['number'] as num),
            'boolean' => BooleanFormulaPropertyValue(json['boolean'] as bool),
            'date' =>
              DateFormulaPropertyValue(DateTime.parse(json['date'] as String)),
            _ => throw FormulaPropertyValueTypeException(json)
          },
        );
}

sealed class FormulaPropertyValueType {}

class StringFormulaPropertyValue extends FormulaPropertyValueType {
  StringFormulaPropertyValue(this.value);
  final String? value;
}

class NumberFormulaPropertyValue extends FormulaPropertyValueType {
  NumberFormulaPropertyValue(this.value);
  final num value;
}

class BooleanFormulaPropertyValue extends FormulaPropertyValueType {
  BooleanFormulaPropertyValue(this.value);
  final bool value;
}

class DateFormulaPropertyValue extends FormulaPropertyValueType {
  DateFormulaPropertyValue(this.value);
  final DateTime value;
}

class FormulaPropertyValueTypeException implements Exception {
  FormulaPropertyValueTypeException(this.json);
  final Json json;

  @override
  String toString() {
    return 'FormulaPropertyValue must be string, number, boolean or date.\n'
        'The json was: $json';
  }
}
