import 'package:flutter/material.dart';
import 'package:github_repo_search/resources/strings.dart';
import 'package:github_repo_search/screens/search_results_screen/widgets/loader.dart';
import 'package:github_repo_search/styles/text_styles.dart';

class SearchResultsLoadingView extends StatelessWidget {
  const SearchResultsLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          CustomStrings.resultsLoading.toUpperCase(),
          textAlign: TextAlign.center,
          style: searchResultsSubtitleTextStyle,
        ),
        SizedBox(height: 8),
        Center(
          child: Loader(),
        ),
      ],
    );
  }
}
