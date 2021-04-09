part of 'search_results_bloc.dart';

@immutable
abstract class SearchResultsEvent {
  SearchResultsEvent() : created = DateTime.now();

  final DateTime created;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchResultsEvent &&
        other.created.difference(created).inMilliseconds.abs() < 3000;
  }

  @override
  int get hashCode => created.hashCode;
}

class SearchResultsEventLoad extends SearchResultsEvent {
  SearchResultsEventLoad({required this.query}) : super();

  final String query;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchResultsEventLoad &&
        other.query == query &&
        super == other;
  }

  @override
  int get hashCode => query.hashCode;
}

class SearchResultsEventLoadMore extends SearchResultsEvent {
  SearchResultsEventLoadMore({required this.query}) : super();

  final String query;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchResultsEventLoadMore &&
        other.query == query &&
        super == other;
  }

  @override
  int get hashCode => query.hashCode;
}

class SearchResultsEventReload extends SearchResultsEvent {
  SearchResultsEventReload({required this.query}) : super();

  final String query;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchResultsEventReload &&
        other.query == query &&
        super == other;
  }

  @override
  int get hashCode => query.hashCode;
}
