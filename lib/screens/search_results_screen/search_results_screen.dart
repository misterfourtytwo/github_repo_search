import 'package:flutter/material.dart';
import 'package:github_repo_search/github_repository_data.dart';
import 'package:github_repo_search/screens/themes.dart';

part 'search_results_screen_arguments.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/home/search_results';
  final String query;
  // final List<GithubRepositoryData> results;

  SearchScreen({
    Key? key,
    required SearchScreenArguments arguments,
  })   : query = arguments.query,
        // results = arguments.cachedResults,
        super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Результат поиска'.toUpperCase(),
          style: Theme.of(context).appBarTheme.textTheme?.headline6 ??
              fallbackAppBarTheme,
        ),
        centerTitle: true,
      ),
    );
  }
}
