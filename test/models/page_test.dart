import 'dart:convert';

import 'package:notion_api_client/notion_api_client.dart';
import 'package:notion_api_client/src/state/common/emoji_object.dart';
import 'package:notion_api_client/src/state/pages/properties/page_property.dart';
import 'package:notion_api_client/src/state/pages/properties/property_values/property_value.dart';
import 'package:notion_api_client/src/state/parent.dart';
import 'package:notion_api_client/src/state/rich_text/annotions.dart';
import 'package:notion_api_client/src/state/rich_text/rich_text.dart';
import 'package:notion_api_client/src/state/users/user.dart';
import 'package:test/test.dart';

import '../data/models/page_example.dart';

void main() {
  test('example page parses correctly', () async {
    /// test data is taken from https://developers.notion.com/reference/page
    final json = jsonDecode(examplePageJsonString);
    final page = Page.fromJson(json);

    expect(page.id, equals('be633bf1-dfa0-436d-b259-571129a590e5'));
    expect(page.createdTime, DateTime.parse('2022-10-24T22:54:00.000Z'));
    expect(page.lastEditedTime, DateTime.parse('2023-03-08T18:25:00.000Z'));
    expect(page.createdBy, isA<User>());
    expect(page.createdBy.id, 'c2f20311-9e54-4d11-8c79-7398424ae41e');
    expect(page.cover, null);
    expect(page.icon, isA<EmojiObject>());
    expect((page.icon as EmojiObject).emoji, '🐞');
    expect(page.parent, isA<DatabaseParent>());
    expect((page.parent as DatabaseParent).id,
        'a1d8501e-1ac1-43e9-a6bd-ea9fe6c8822b');
    expect(page.archived, true);
    expect(
      page.url,
      Uri.parse(
          'https://www.notion.so/Bug-bash-be633bf1dfa0436db259571129a590e5'),
    );
    expect(
      page.publicUrl,
      Uri.parse(
          'https://jm-testing.notion.site/p1-6df2c07bfc6b4c46815ad205d132e22d'),
    );

    expect(page.properties['Due date'], isA<PageProperty>());
    DatePropertyValue datePropertyValue =
        page.properties['Due date']!.value as DatePropertyValue;
    expect(datePropertyValue.start.year, 2023);
    expect(datePropertyValue.start.month, 2);
    expect(datePropertyValue.start.day, 23);
    expect(datePropertyValue.end, null);
    expect(datePropertyValue.timeZone, null);

    expect(page.properties['Status'], isA<PageProperty>());
    StatusPropertyValue statusPropertyValue =
        page.properties['Status']!.value as StatusPropertyValue;
    expect(statusPropertyValue.id, '86ddb6ec-0627-47f8-800d-b65afd28be13');
    expect(statusPropertyValue.name, 'Not started');
    expect(statusPropertyValue.color, 'default');

    final titleProperty = page.properties['Title']!;
    expect(titleProperty, isA<PageProperty>());
    TitlePropertyValue titlePropertyValue =
        titleProperty.value as TitlePropertyValue;
    RichText richText = titlePropertyValue.values.first;
    expect(richText, isA<RichText>());
    expect(richText.subtype, isA<Text>());
    expect(richText.href, null);
    expect(richText.plainText, 'Bug bash');
    Text text = richText.subtype as Text;
    expect(text.content, 'Bug bash');
    expect(text.url, null);

    Annotations annotations = richText.annotations;
    expect(annotations.bold, false);
    expect(annotations.italic, false);
    expect(annotations.strikethrough, false);
    expect(annotations.underline, false);
    expect(annotations.code, false);
    expect(annotations.color, 'default');
  });
}
