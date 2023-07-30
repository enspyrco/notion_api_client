import 'package:api_client_utils/api_client_utils.dart';
import 'package:notion_api_client/notion_api_client.dart';

import 'credentials.dart';

const pageId = 'ba16e52f6bf04eb5927fda3a45c38d53';

void main() async {
  var client = NotionClient(token: token);

  try {} on APIRequestException catch (error) {
    print(error.getJsonValue(key: 'message'));
  } finally {
    client.close();
  }
}
