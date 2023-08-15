part of 'block_type.dart';

/// Image blocks
/// Includes supported image urls (i.e. ending in .png, .jpg, .jpeg, .gif, .tif, .tiff, .bmp, .svg, or .heic)
class ImageBlock extends BlockType {
  /// image	File Object	Image file reference
  final FileObject image;

  ImageBlock.fromJson(JsonMap json)
      : image = FileObject.fromJson(json['image'] as JsonMap);
}
