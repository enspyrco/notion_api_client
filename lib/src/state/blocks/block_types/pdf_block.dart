part of 'block_type.dart';

/// PDF blocks
class PdfBlock extends BlockType {
  /// pdf	File Object	PDF file reference
  final FileObject pdf;

  PdfBlock.fromJson(JsonMap json)
      : pdf = FileObject.fromJson(json['pdf'] as JsonMap);
}
