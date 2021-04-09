import 'package:flutter/cupertino.dart';
import 'package:github_repo_search/resources/strings.dart';
import 'package:github_repo_search/styles/colors.dart';
import 'package:github_repo_search/styles/text_styles.dart';

class ResultsSubtitle extends StatelessWidget {
  const ResultsSubtitle({
    Key? key,
    required this.query,
  }) : super(key: key);

  final String query;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: CustomStrings.forQuery.toUpperCase(),
        children: [
          TextSpan(
            text: '"$query"',
            // same as in whole rich text but with changed color
            style:
                searchResultsSubtitleTextStyle.copyWith(color: MyColors.accent),
          ),
        ],
        style: searchResultsSubtitleTextStyle,
      ),
      textAlign: TextAlign.center,
    );
  }
}
