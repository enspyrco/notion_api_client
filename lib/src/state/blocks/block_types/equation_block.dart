part of 'block_type.dart';

/// Equation blocks
class EquationBlock extends BlockType {
  /// expression	string	A KaTeX compatible string
  final String expression;

  EquationBlock.fromJson(JsonMap json)
      : expression = json['expression'] as String;
}
