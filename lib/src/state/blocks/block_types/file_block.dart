part of 'block_type.dart';

/// File blocks
class FileBlock extends BlockType {
  /// file	File Object	File reference
  final FileObject file;

  /// caption	array of Rich text object text objects	Caption of the file block
  final List<RichText> caption;

  FileBlock.fromJson(JsonMap json)
      : file = FileObject.fromJson(json['file'] as JsonMap),
        caption =
            (json['caption'] as List).map((e) => RichText.fromJson(e)).toList();
}
