import 'dart:convert';

import 'package:api_client_utils/types.dart';
import 'package:notion_api_client/src/state/blocks/block.dart';
import 'package:notion_api_client/src/state/blocks/block_types/block_type.dart';
import 'package:notion_api_client/src/state/parent.dart';
import 'package:notion_api_client/src/state/rich_text/rich_text.dart';
import 'package:test/test.dart';

import '../data/models/block_example.dart';

void main() {
  test('example page parses correctly', () async {
    /// test data is taken from https://developers.notion.com/reference/page
    final JsonMap json = jsonDecode(exampleBlockJsonString);
    final block = Block.fromJson(json);

    expect(block.id, 'c02fc1d3-db8b-45c5-a222-27595b15aea7');
    expect(block.parent, isA<PageParent>());
    expect(block.parent.id, '59833787-2cf9-4fdf-8782-e53db20768a5');
    expect(block.createdTime, DateTime.parse('2022-03-01T19:05:00.000Z'));
    expect(block.lastEditedTime, DateTime.parse('2022-07-06T19:41:00.000Z'));
    expect(block.createdBy.id, 'ee5f0f84-409a-440f-983a-a5315961c6e4');
    expect(block.lastEditedBy.id, 'ee5f0f84-409a-440f-983a-a5315961c6e4');
    expect(block.hasChildren, false);
    expect(block.archived, false);

    expect(block.subtype, isA<HeadingTwoBlock>());
    HeadingTwoBlock headingTwoBlock = block.subtype as HeadingTwoBlock;
    expect(headingTwoBlock.color, 'default');
    expect(headingTwoBlock.isToggleable, false);

    RichText richText = headingTwoBlock.richTexts.first;
    expect(richText.subtype, isA<Text>());
    Text text = richText.subtype as Text;
    expect(text.content, 'Lacinato kale');
    expect(text.url, null);
    expect(richText.annotations.bold, false);
    expect(richText.annotations.italic, false);
    expect(richText.annotations.strikethrough, false);
    expect(richText.annotations.underline, false);
    expect(richText.annotations.code, false);
    expect(richText.annotations.color, 'green');
    expect(richText.plainText, 'Lacinato kale');
    expect(richText.href, null);
  });
}
