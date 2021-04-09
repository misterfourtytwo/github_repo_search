import 'package:flutter/material.dart';
import 'package:github_repo_search/resources/strings.dart';
import 'package:github_repo_search/screens/search_results_screen/bloc/search_results_bloc.dart';
import 'package:github_repo_search/screens/search_results_screen/views/error_widget.dart';
import 'package:github_repo_search/screens/search_results_screen/widgets/loader.dart';
import 'package:github_repo_search/styles/text_styles.dart';

import 'repository_widget/repository_widget.dart';

class SearchResultsLoadedView extends StatelessWidget {
  const SearchResultsLoadedView({
    Key? key,
    required this.loadedState,
    required this.loadMoreCallback,
    required this.reloadCallback,
  }) : super(key: key);

  final SearchResultsStateLoaded loadedState;
  final VoidCallback loadMoreCallback;
  final VoidCallback reloadCallback;

  bool _onNotification(ScrollNotification notification) {
    bool loadMore =
        notification is OverscrollNotification && notification.overscroll > 0;
    loadMore |= notification is ScrollUpdateNotification &&
        notification.metrics.extentAfter < 100;
    loadMore &= loadedState.hasMore;
    loadMore &= notification.metrics.axis == Axis.vertical;
    loadMore &= !loadedState.isLoading;
    loadMore &= !(loadedState.errorMessage?.isNotEmpty == true);
    if (loadMore) {
      loadMoreCallback();
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          (loadedState.resultsCount > 0
                  ? CustomStrings.found(loadedState.resultsCount)
                  : CustomStrings.nothingsFound)
              .toUpperCase(),
          textAlign: TextAlign.center,
          style: searchResultsSubtitleTextStyle,
        ),
        SizedBox(height: 8),
        Expanded(
          child: NotificationListener<ScrollNotification>(
            onNotification: _onNotification,
            child: Scrollbar(
              thickness: 4,
              radius: Radius.circular(4),
              child: ListView.separated(
                padding: EdgeInsets.only(
                  top: 8,
                  bottom: 8 + MediaQuery.of(context).padding.bottom,
                  right: 16,
                  left: 16,
                ),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 16),
                itemCount:
                    loadedState.results.length + (loadedState.hasMore ? 1 : 0),
                itemBuilder: (BuildContext context, int index) {
                  if (index == loadedState.results.length) {
                    if (loadedState.errorMessage?.isNotEmpty == true) {
                      return SearchResultsErrorWidget(
                        errorMessage: loadedState.errorMessage!,
                        reloadCallback: reloadCallback,
                      );
                    } else {
                      return Center(child: Loader());
                    }
                  }
                  return RepositoryWidget(
                    data: loadedState.results[index],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
