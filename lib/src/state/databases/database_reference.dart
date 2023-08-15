import 'package:api_client_utils/types.dart';

/// Just an id but in a class for type safety
class DatabaseReference {
  final String id;

  DatabaseReference.fromJson(JsonMap json) : id = json['id'] as String;
}
