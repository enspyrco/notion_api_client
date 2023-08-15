part of 'block_type.dart';

/// https://developers.notion.com/reference/block#synced-block
/// https://developers.notion.com/reference/block#original-synced-block
/// https://developers.notion.com/reference/block#duplicate-synced-block

/// Similar to the Notion UI, there are two versions of a synced_block object:
/// the original block that was created first and doesn't yet sync with anything
/// else, and the duplicate block or blocks synced to the original.
class SyncedBlock extends BlockType {
  /// null signifies that this is an original synced block that does not refer to another block.
  final String? fromBlockId;

  /// The nested child blocks, if any, of the synced_block block.
  /// These blocks will be mirrored in the duplicate synced_block.
  final List<Block>? children;

  SyncedBlock.fromJson(JsonMap json)
      : fromBlockId = (json['synced_from'] as JsonMap?) == null
            ? null
            : (json['synced_from'] as JsonMap)['block_id'] as String,
        children = (json['children'] as JsonMap?) == null
            ? null
            : (json['children'] as JsonList)
                .map<Block>((e) => Block.fromJson(e as JsonMap))
                .toList();
}
