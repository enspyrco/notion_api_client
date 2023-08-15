import 'package:api_client_utils/types.dart';

class UserReference {
  final String id;

  UserReference.fromJson(JsonMap json) : id = json['id'] as String;
}
