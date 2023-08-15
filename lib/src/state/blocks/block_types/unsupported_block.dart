part of 'block_type.dart';

/// https://developers.notion.com/docs/working-with-page-content#modeling-content-as-blocks
/// The Notion API currently supports a subset of Notion block types, with support for more coming soon. When an unsupported block type appears in a page, it will have the type "unsupported".
class UnsupportedBlock extends BlockType {}
