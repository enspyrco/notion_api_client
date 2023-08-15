library block_type;

import 'package:api_client_utils/types.dart';

import '../../common/file_object.dart';
import '../../common/file_or_emoji_object.dart';
import '../../rich_text/rich_text.dart';
import '../block.dart';

part 'bookmark_block.dart';
part 'breadcrumb_block.dart';
part 'bulleted_list_item_block.dart';
part 'callout_block.dart';
part 'child_database_block.dart';
part 'child_page_block.dart';
part 'code_block.dart';
part 'column_block.dart';
part 'column_list_block.dart';
part 'divider_block.dart';
part 'embed_block.dart';
part 'equation_block.dart';
part 'file_block.dart';
part 'heading_one_block.dart';
part 'heading_three_block.dart';
part 'heading_two_block.dart';
part 'image_block.dart';
part 'link_preview_block.dart';
part 'link_to_page_block.dart';
part 'numbered_list_item_block.dart';
part 'original_synced_block.dart';
part 'paragraph_block.dart';
part 'pdf_block.dart';
part 'quote_block.dart';
part 'reference_synced_block.dart';
part 'synced_block.dart';
part 'table_block.dart';
part 'table_of_contents_block.dart';
part 'table_row_block.dart';
part 'template_block.dart';
part 'to_do_block.dart';
part 'toggle_block.dart';
part 'video_block.dart';
part 'unsupported_block.dart';

/// We use composition to allow for different types of blocks so a Block
/// object contains a BlockType object, and the type of the Block is thus
/// defined by the type of the blockType member (ie. a subtype of the BlockType)
sealed class BlockType {}
