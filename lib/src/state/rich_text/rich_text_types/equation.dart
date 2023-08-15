part of '../rich_text.dart';

/// https://developers.notion.com/reference/rich-text#equation

/// Notion supports inline LaTeX equations as rich text object’s with a type
/// value of "equation".
class Equation extends RichTextType {
  final String expression;

  Equation.fromJson(String json) : expression = json;
}
