import 'package:api_client_utils/types.dart';

import 'user.dart';

/// https://developers.notion.com/reference/user#people

/// User objects that represent people have the type property set to "person".
class PersonUser extends User {
  /// Email address of person. This is only present if an integration has user
  /// capabilities that allow access to email addresses.
  final String email;

  PersonUser.fromJson(JsonMap userJson)
      : email = (userJson['person'] as JsonMap)['email'] as String,
        super(
            id: userJson['id'] as String,
            name: userJson['name'] as String?,
            avatarUrl: userJson['avatar_url'] as String?);
}
