import 'package:flutter/material.dart';
import 'package:github_repo_search/resources/strings.dart';
import 'package:github_repo_search/styles/text_styles.dart';

class SearchResultsErrorWidget extends StatelessWidget {
  const SearchResultsErrorWidget({
    Key? key,
    required this.errorMessage,
    required this.reloadCallback,
  }) : super(key: key);

  final String errorMessage;
  final VoidCallback reloadCallback;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            errorMessage.toUpperCase(),
            textAlign: TextAlign.center,
            style: searchResultsSubtitleTextStyle,
          ),
          SizedBox(height: 8),
          Center(
            child: ElevatedButton(
              onPressed: reloadCallback,
              child: Text(
                CustomStrings.retry,
                style: buttonTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
