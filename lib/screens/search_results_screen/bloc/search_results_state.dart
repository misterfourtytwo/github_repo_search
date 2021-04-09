part of 'search_results_bloc.dart';

@immutable
abstract class SearchResultsState {
  const SearchResultsState();
}

class SearchResultsStateInitial extends SearchResultsState {
  const SearchResultsStateInitial();
}

class SearchResultsStateLoading extends SearchResultsState {
  const SearchResultsStateLoading();
}

class SearchResultsStateLoaded extends SearchResultsState {
  const SearchResultsStateLoaded({
    required this.resultsCount,
    required this.results,
    this.isLoading = false,
    this.errorMessage,
  });

  final int resultsCount;
  final List<GithubRepositoryData> results;

  final bool isLoading;
  final String? errorMessage;

  bool get hasMore => resultsCount > results.length;

  SearchResultsStateLoaded copyWith({
    int? resultsCount,
    List<GithubRepositoryData>? results,
    bool? isLoading,
    String? errorMessage,
    bool nullError = false,
  }) {
    return SearchResultsStateLoaded(
      resultsCount: resultsCount ?? this.resultsCount,
      results: results ?? this.results,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: nullError ? null : errorMessage ?? this.errorMessage,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchResultsStateLoaded &&
        other.resultsCount == resultsCount &&
        listEquals(other.results, results) &&
        other.isLoading == isLoading &&
        other.errorMessage == errorMessage;
  }

  @override
  int get hashCode {
    return resultsCount.hashCode ^
        results.hashCode ^
        isLoading.hashCode ^
        errorMessage.hashCode;
  }
}

class SearchResultsStateError extends SearchResultsState {
  const SearchResultsStateError({
    this.errorMessage = CustomStrings.defaultErrorMessage,
  });

  final String errorMessage;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SearchResultsStateError &&
        other.errorMessage == errorMessage;
  }

  @override
  int get hashCode => errorMessage.hashCode;
}
