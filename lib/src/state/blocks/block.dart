import 'package:api_client_utils/types.dart';

import '../../exceptions.dart';
import '../parent.dart';
import '../users/user.dart';
import 'block_types/block_type.dart';

/// https://developers.notion.com/reference/block

/// A block object represents a piece of content within Notion.
/// The API translates the headings, toggles, paragraphs, lists, media, and more
/// that you can interact with in the Notion UI as different block type objects.
final class Block {
  const Block._({
    required this.id,
    required this.parent,
    required this.createdTime,
    required this.createdBy,
    required this.lastEditedTime,
    required this.lastEditedBy,
    required this.archived,
    required this.hasChildren,
    required this.subtype,
  });

  /// Identifier for the block.
  final String id;

  /// Information about the block's parent.
  final Parent parent;

  /// Date and time when this block was created.
  final DateTime createdTime;

  /// User who created the block.
  final User createdBy;

  /// Date and time when this block was last updated.
  final DateTime lastEditedTime;

  /// User who last edited the block.
  final User lastEditedBy;

  /// The archived status of the block.
  final bool archived;

  /// Whether or not the block has children blocks nested within it.
  final bool hasChildren;

  final BlockType subtype;

  factory Block.fromJson(JsonMap json) {
    String type = json['type'] as String;
    final BlockType blockType = switch (type) {
      'bookmark' => BookmarkBlock.fromJson(json['bookmark'] as JsonMap),
      'breadcrumb' => BreadcrumbBlock.fromJson(json['breadcrumb'] as JsonMap),
      'bulleted_list_item' =>
        BulletedListItemBlock.fromJson(json['bulleted_list_item'] as JsonMap),
      'callout' => CalloutBlock.fromJson(json['callout'] as JsonMap),
      'child_database' =>
        ChildDatabaseBlock.fromJson(json['child_database'] as JsonMap),
      'child_page' =>
        ChildDatabaseBlock.fromJson(json['child_page'] as JsonMap),
      'column' => ColumnBlock.fromJson(json['column'] as JsonMap),
      'column_list' => ColumnListBlock.fromJson(json['column_list'] as JsonMap),
      'divider' => DividerBlock.fromJson(json['divider'] as JsonMap),
      'embed' => EmbedBlock.fromJson(json['embed'] as JsonMap),
      'equation' => EquationBlock.fromJson(json['equation'] as JsonMap),
      'file' => FileBlock.fromJson(json['file'] as JsonMap),
      'heading_1' => HeadingOneBlock.fromJson(json['heading_1'] as JsonMap),
      'heading_2' => HeadingTwoBlock.fromJson(json['heading_2'] as JsonMap),
      'heading_3' => HeadingThreeBlock.fromJson(json['heading_3'] as JsonMap),
      'image' => ImageBlock.fromJson(json['image'] as JsonMap),
      'link_preview' =>
        LinkPreviewBlock.fromJson(json['link_preview'] as JsonMap),
      'link_to_page' =>
        LinkToPageBlock.fromJson(json['link_to_page'] as JsonMap),
      'numbered_list_item' =>
        NumberedListItemBlock.fromJson(json['numbered_list_item'] as JsonMap),
      'paragraph' => ParagraphBlock.fromJson(json['paragraph'] as JsonMap),
      'pdf' => PdfBlock.fromJson(json['pdf'] as JsonMap),
      'quote' => QuoteBlock.fromJson(json['quote'] as JsonMap),
      'synced_block' => SyncedBlock.fromJson(json['synced_block'] as JsonMap),
      'table' => TableBlock.fromJson(json['table'] as JsonMap),
      'table_of_contents' =>
        TableOfContentsBlock.fromJson(json['table_of_contents'] as JsonMap),
      'table_row' => TableRowBlock.fromJson(json['table_row'] as JsonMap),
      'template' => TemplateBlock.fromJson(json['template'] as JsonMap),
      'to_do' => ToDoBlock.fromJson(json['to_do'] as JsonMap),
      'toggle' => ToggleBlock.fromJson(json['toggle'] as JsonMap),
      'unsupported' => UnsupportedBlock(),
      'video' => VideoBlock.fromJson(json['video'] as JsonMap),
      _ => throw UnrecognizedTypeInJsonException('BlockObject', type, json)
    };

    return Block._(
      id: json['id'] as String,
      parent: Parent.fromJson(json['parent'] as JsonMap),
      createdTime: DateTime.parse(json['created_time'] as String),
      createdBy: User.fromJson(json['created_by'] as JsonMap),
      lastEditedTime: DateTime.parse(json['last_edited_time'] as String),
      lastEditedBy: User.fromJson(json['last_edited_by'] as JsonMap),
      archived: json['archived'] as bool,
      hasChildren: json['has_children'] as bool,
      subtype: blockType,
    );
  }
}
