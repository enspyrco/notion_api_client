import 'dart:convert';

import 'package:notion_api_client/notion_api_client.dart';
import 'package:notion_api_client/src/state/common/emoji_object.dart';
import 'package:notion_api_client/src/state/parent.dart';
import 'package:notion_api_client/src/state/users/user_object.dart';
import 'package:test/test.dart';

import '../data/models/page_example.dart';

void main() {
  test('example page parses correctly', () async {
    final json = jsonDecode(examplePageJsonString);
    final page = Page.fromJson(json);

    expect(page.id, equals('be633bf1-dfa0-436d-b259-571129a590e5'));
    expect(page.createdTime, DateTime.parse('2022-10-24T22:54:00.000Z'));
    expect(page.lastEditedTime, DateTime.parse('2023-03-08T18:25:00.000Z'));
    expect(page.createdBy, isA<UserObject>());
    expect(page.createdBy.id, 'c2f20311-9e54-4d11-8c79-7398424ae41e');
    expect(page.cover, null);
    expect(page.icon, isA<EmojiObject>());
    expect((page.icon as EmojiObject).emoji, '🐞');
    expect(page.parent, isA<DatabaseParent>());
    expect(page.parent.id, 'a1d8501e-1ac1-43e9-a6bd-ea9fe6c8822b');
    expect(page.archived, true);
    // expect(page
  });
}

    // "properties": {
    //     "Due date": {
    //         "id": "M%3BBw",
    //         "type": "date",
    //         "date": {
    //             "start": "2023-02-23",
    //             "end": null,
    //             "time_zone": null
    //         }
    //     },
    //     "Status": {
    //         "id": "Z%3ClH",
    //         "type": "status",
    //         "status": {
    //             "id": "86ddb6ec-0627-47f8-800d-b65afd28be13",
    //             "name": "Not started",
    //             "color": "default"
    //         }
    //     },
    //     "Title": {
    //         "id": "title",
    //         "type": "title",
    //         "title": [
    //             {
    //                 "type": "text",
    //                 "text": {
    //                     "content": "Bug bash",
    //                     "link": null
    //                 },
    //                 "annotations": {
    //                     "bold": false,
    //                     "italic": false,
    //                     "strikethrough": false,
    //                     "underline": false,
    //                     "code": false,
    //                     "color": "default"
    //                 },
    //                 "plain_text": "Bug bash",
    //                 "href": null
    //             }
    //         ]
    //     }
    // },
    // "url": "https://www.notion.so/Bug-bash-be633bf1dfa0436db259571129a590e5",
		// "public_url": "https://jm-testing.notion.site/p1-6df2c07bfc6b4c46815ad205d132e22d"