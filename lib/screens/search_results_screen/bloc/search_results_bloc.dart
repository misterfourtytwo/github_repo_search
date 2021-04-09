import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:github_repo_search/network/network.dart';
import 'package:github_repo_search/network/responses/search_results_response.dart';
import 'package:github_repo_search/resources/strings.dart';
import 'package:meta/meta.dart';

import 'package:github_repo_search/models/github_repository_data.dart';

part 'search_results_event.dart';
part 'search_results_state.dart';

class SearchResultsBloc extends Bloc<SearchResultsEvent, SearchResultsState> {
  SearchResultsBloc() : super(const SearchResultsStateInitial());

  void _log(String message, [Object? data]) {
    developer.log(
      message,
      name: 'search_results_bloc',
      error: data,
    );
  }

  @override
  void onTransition(
      Transition<SearchResultsEvent, SearchResultsState> transition) {
    _log('on transition', transition);
    super.onTransition(transition);
  }

  // debouncer
  @override
  Stream<Transition<SearchResultsEvent, SearchResultsState>> transformEvents(
    Stream<SearchResultsEvent> events,
    transitionFn,
  ) {
    return super.transformEvents(
      events.distinct(),
      transitionFn,
    );
  }

  DateTime? lastLoadFinish;
  void debouncer() {}

  @override
  Stream<SearchResultsState> mapEventToState(
    SearchResultsEvent event,
  ) async* {
    if (event is SearchResultsEventLoad) {
      _log('handle initial load event');
      yield* _handleLoadEvent(event);
    } else if (event is SearchResultsEventLoadMore) {
      _log('handle load more event');
      yield* _handleLoadMoreEvent(event);
    } else if (event is SearchResultsEventReload) {
      _log('handle reload event');
      yield* _handleReloadEvent(event);
    } else {
      _log(
        'got unknown event',
        event,
      );
    }
  }

  Stream<SearchResultsState> _handleLoadEvent(
    SearchResultsEventLoad event,
  ) async* {
    if (state is SearchResultsStateInitial) {
      yield SearchResultsStateLoading();
      try {
        final SearchResultsResponse results =
            await Network.loadRepos(event.query);
        yield SearchResultsStateLoaded(
          resultsCount: results.resultsCount,
          results: results.results,
          isLoading: false,
        );
      } on String catch (error) {
        yield SearchResultsStateError(errorMessage: error);
      } catch (error) {
        yield const SearchResultsStateError();
      }
    } else {
      developer.log(
        'state is! initial, not loading',
        name: 'search_results_bloc',
        error: event,
      );
    }
  }

  Stream<SearchResultsState> _handleLoadMoreEvent(
    SearchResultsEventLoadMore event,
  ) async* {
    if (state is SearchResultsStateLoading) return;

    if (state is SearchResultsStateLoaded) {
      final SearchResultsStateLoaded loadedState =
          state as SearchResultsStateLoaded;

      try {
        if (loadedState.isLoading) {
          // do nothing when repeated call
        } else if (!loadedState.hasMore) {
          // if fetched everything but somehow got error
          yield loadedState.copyWith(errorMessage: null);
        } else {
          yield loadedState.copyWith(
            isLoading: true,
            nullError: true,
          );

          final SearchResultsResponse nextPageResults = await Network.loadRepos(
            event.query,
            loadedState.results.length,
          );

          yield loadedState.copyWith(
            nullError: true,
            results: loadedState.results
                .followedBy(nextPageResults.results)
                .toList(),
          );
        }
      } on String catch (error) {
        print(error);
        yield loadedState.copyWith(
          isLoading: false,
          errorMessage: error,
        );
      } catch (error) {
        print(error);
        yield loadedState.copyWith(
          isLoading: false,
          errorMessage: CustomStrings.defaultErrorMessage,
        );
      }
    } else {
      yield const SearchResultsStateInitial();
      add(
        SearchResultsEventLoad(query: event.query),
      );
    }
  }

  Stream<SearchResultsState> _handleReloadEvent(
    SearchResultsEventReload event,
  ) async* {
    add(
      SearchResultsEventLoadMore(query: event.query),
    );
  }
}
