part of 'block_type.dart';

/// Reference Synced Blocks
/// To sync the content of the original synced_block with another synced_block, the developer simply needs to refer to that synced_block using the synced_from property.
/// Below is an example of a synced_block referring to another synced_block. Note that only "original" synced blocks can be referenced in the synced_from property.
/// "References" synced block objects contain the following information within the synced_block property:
class ReferenceSyncedBlock extends BlockType {
  /// synced_from	Synced From Object	Object that contains the id of the original synced_block
  final SyncedBlock syncedFrom;

  ReferenceSyncedBlock.fromJson(JsonMap json)
      : syncedFrom = SyncedBlock.fromJson(json['synced_from'] as JsonMap);
}
