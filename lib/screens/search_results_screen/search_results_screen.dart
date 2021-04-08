import 'package:flutter/material.dart';
import 'package:github_repo_search/mocks/search_result_mocks.dart';
import 'package:github_repo_search/screens/search_results_screen/widgets/results_subtitle.dart';
import 'package:github_repo_search/screens/search_results_screen/widgets/repository_widget/repository_widget.dart';
import 'package:github_repo_search/styles/text_styles.dart';

part 'search_results_screen_arguments.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'home/search_results';
  SearchScreen({
    Key? key,
    required SearchScreenArguments arguments,
  })   : query = arguments.query,
        // results = arguments.cachedResults,
        super(key: key);

  final String query;

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int resultsCount = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Результат поиска'.toUpperCase(),
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 20),
          ResultsSubtitle(query: widget.query),
          SizedBox(height: 8),
          Text(
            (resultsCount > 0 ? 'Найдено: $resultsCount' : 'Ничего не найдено')
                .toUpperCase(),
            textAlign: TextAlign.center,
            style: searchResultsSubtitleTextStyle,
          ),
          SizedBox(height: 8),
          Expanded(
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
                itemCount: searchResultsMockWithRepos.length * 5,
                itemBuilder: (BuildContext context, int index) =>
                    RepositoryWidget(
                  data: searchResultsMockWithRepos[
                      index % searchResultsMockWithRepos.length],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
