import 'package:api_client_utils/api_client_utils.dart';
import 'package:api_client_utils/types.dart';
import 'package:http/http.dart' as http;
import 'package:notion_api_client/src/pageable.dart';

import 'state/blocks/block_object.dart';
import 'state/pages/page.dart';

class NotionClient {
  static const _host = 'api.notion.com';
  static const _basePath = 'v1';
  final http.Client _client;
  late final ApiRequester _requester;

  NotionClient({http.Client? client, required String token})
      : _client = client ?? http.Client() {
    _requester = ApiRequester(_client, _host, _basePath,
        {'Authorization': 'Bearer $token', 'Notion-Version': '2022-02-22'});
  }

  /// "GET" or "POST", "HEAD", "PUT", or "DELETE"
  Future<Page> getPageProperties({required String id}) async {
    var json = await _requester.request('GET', 'pages/$id');
    return Page.fromJson(json as JsonMap);
  }

  Future<PageableResponse?> getBlockChildren(
      {required String id, bool recursive = false}) async {
    var json = await _requester.request('GET', 'blocks/$id/children');
    var response = PageableResponse.fromJson(json as JsonMap);

    if (recursive) {
      for (Object? object in response.results) {
        if (object is BlockObject && object.hasChildren) {
          final children = (object as dynamic).children as List<BlockObject?>;
          if (children.isEmpty) {
            PageableResponse? response =
                await getBlockChildren(id: object.id, recursive: true);

            if (response != null) {
              final retrievedChildren =
                  List<BlockObject>.from(response.results);
              children.addAll(retrievedChildren);
            }
          }
        }
      }
    }

    return response;
  }

  Future<Object?> getPageContent({required String id}) async {
    var json = await _requester.request('GET', 'pages/$id');
    return json;
  }

  /// Recursively calls [getBlockChildren] until the reponse's hasMore member
  /// is false, collecting all results then returning the collection.
  Future<List<Object?>?> getAllBlockChildren({required String id}) async {
    PageableResponse? response =
        await getBlockChildren(id: id, recursive: true);

    if (response == null) return null;

    final results = [...response.results];

    while (response!.hasMore) {
      response = await getBlockChildren(id: id, recursive: true);
      if (response == null) break;
      results.addAll(response.results);
    }

    return results;
  }

  void close() => _client.close();
}

// Paginated endpoints
// - Query a database
// - List databases
// - Retrieve a page property item
// - Retrieve block children
// - List all users
// - Search