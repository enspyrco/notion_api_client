import 'package:api_client_utils/types.dart';

/// https://developers.notion.com/reference/rich-text#the-annotation-object

/// All rich text objects contain an annotations object that sets the styling
/// for the rich text.
class Annotations {
  /// Whether the text is bolded.
  final bool bold;

  ///	Whether the text is italicized.
  final bool italic;

  ///	Whether the text is struck through.
  final bool strikethrough;

  /// Whether the text is underlined.
  final bool underline;

  /// Whether the text is code style.
  final bool code;

  /// Color of the text.
  /// Possible values are: "default", "gray", "brown", "orange", "yellow", "green", "blue", "purple", "pink", "red", "gray_background", "brown_background", "orange_background", "yellow_background", "green_background", "blue_background", "purple_background", "pink_background", "red_background".	"green"
  ///   Type: string (enum)
  final String color;

  Annotations.fromJson(JsonMap json)
      : bold = json['bold'] as bool,
        italic = json['italic'] as bool,
        strikethrough = json['strikethrough'] as bool,
        underline = json['underline'] as bool,
        code = json['code'] as bool,
        color = json['color'] as String;
}
