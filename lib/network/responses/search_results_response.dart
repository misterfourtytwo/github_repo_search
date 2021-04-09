import 'dart:convert';

import 'package:github_repo_search/models/github_repository_data.dart';

class SearchResultsResponse {
  const SearchResultsResponse({
    required this.resultsCount,
    required this.results,
  });

  final int resultsCount;
  final List<GithubRepositoryData> results;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'total_count': resultsCount,
      'items': results.map((repoData) => repoData.toMap()),
    };
  }

  factory SearchResultsResponse.fromMap(Map<String, dynamic?>? map) {
    if (map == null) {
      return SearchResultsResponse(
        resultsCount: 0,
        results: <GithubRepositoryData>[],
      );
    }

    return SearchResultsResponse(
      resultsCount: map['total_count'],
      results: List<GithubRepositoryData>.from(
        map['items']
            ?.where((item) => item != null)
            ?.map((repoDataMap) => GithubRepositoryData.fromMap(repoDataMap)),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchResultsResponse.fromJson(String source) =>
      SearchResultsResponse.fromMap(json.decode(source));
}
