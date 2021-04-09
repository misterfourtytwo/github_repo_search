import 'package:flutter/material.dart';
import 'package:github_repo_search/screens/search_results_screen/bloc/search_results_bloc.dart';

import 'error_widget.dart';

class SearchResultsErrorView extends StatelessWidget {
  const SearchResultsErrorView({
    Key? key,
    required this.errorState,
    required this.reloadCallback,
  }) : super(key: key);

  final SearchResultsStateError errorState;
  final VoidCallback reloadCallback;

  @override
  Widget build(BuildContext context) {
    return SearchResultsErrorWidget(
      errorMessage: errorState.errorMessage,
      reloadCallback: reloadCallback,
    );
  }
}
