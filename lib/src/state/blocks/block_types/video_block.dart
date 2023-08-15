part of 'block_type.dart';

/// Video blocks
/// Includes supported video urls (e.g. ending in .mkv, .flv, .gifv, .avi, .mov, .qt, .wmv, .asf, .amv, .mp4, .m4v, .mpeg, .mpv, .mpg, .f4v, etc.)
class VideoBlock extends BlockType {
  /// video	File Object	Video file reference
  final FileObject video;

  VideoBlock.fromJson(JsonMap json)
      : video = FileObject.fromJson(json['video'] as JsonMap);
}
