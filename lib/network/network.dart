import 'package:dio/dio.dart';
import 'package:github_repo_search/network/responses/search_results_response.dart';
import 'package:github_repo_search/resources/strings.dart';

const int _reposPerPage = 50;

class Network {
  static Future<SearchResultsResponse> loadRepos(
    final String query, [
    final int loadedItems = 0,
  ]) async {
    try {
      var response = await Dio().get<Map<String, dynamic>>(
        'https://api.github.com/search/repositories',
        queryParameters: {
          'q': query,
          'page': loadedItems ~/ _reposPerPage,
          'per_page': _reposPerPage,
        },
        options: Options(
          headers: {'Accept': 'application/vnd.github.v3+json'},
        ),
      );
      return SearchResultsResponse.fromMap(response.data);
    } catch (error) {
      String? message;
      if (error is DioError) {
        message = error.response?.data['message'];
      }
      throw message ?? CustomStrings.defaultErrorMessage;
    }
  }
}
