part of 'block_type.dart';

/// Synced Block blocks
///
/// Similar to the UI, there are two versions of a synced_block -- the original block that was created first and doesn't yet sync with anything else, and the reference blocks that are synced to the original synced block.
/// Original Synced Block
/// To create a synced_block, the developer needs to create an original synced block. Developers will be able to identify the original synced_block because it does not "sync_from" any other block (synced_from property is set to null).
/// This is an example of an "original" synced_block. Note that all of the blocks available to be synced in another synced_block are captured in the children property.
/// "Original" synced block objects contain the following information within the synced_block property:
class OriginalSyncedBlock extends BlockType {
  /// synced_from	null	Value is always null to signify that this is an original synced block and that is not referring to another block
  final SyncedBlock? syncedFrom = null;

  /// children	array of block objects	Any nested children blocks of the synced_block block. These blocks will be synced across this block and references to this synced_block
  final List<Block> children;

  OriginalSyncedBlock.fromJson(JsonMap json)
      : children =
            (json['children'] as List).map((e) => Block.fromJson(e)).toList();
}
