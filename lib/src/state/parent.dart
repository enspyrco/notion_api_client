import 'package:api_client_utils/types.dart';

// https://developers.notion.com/reference/parent-object
class Parent {
  final String type;
  final String id;
  final bool workspace;

  Parent.fromJson(JsonMap json)
      : type = json['type'] as String,
        id = (json['database_id'] as String?) ??
            (json['page_id'] as String?) ??
            '',
        workspace = json['workspace'] as bool? ?? false;
}
