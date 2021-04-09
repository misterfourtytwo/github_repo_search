import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repo_search/resources/strings.dart';

import 'package:github_repo_search/screens/search_results_screen/bloc/search_results_bloc.dart';
import 'package:github_repo_search/screens/search_results_screen/views/loaded_view/loaded_view.dart';
import 'package:github_repo_search/screens/search_results_screen/widgets/results_subtitle.dart';

import 'views/error_view.dart';
import 'views/loading_view.dart';

part 'search_results_screen_arguments.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'home/search_results';
  SearchScreen({
    Key? key,
    required SearchScreenArguments arguments,
  })   : query = arguments.query,
        super(key: key);

  final String query;

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late SearchResultsBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = SearchResultsBloc();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (bloc.state is SearchResultsStateInitial) {
      bloc.add(
        SearchResultsEventLoad(query: widget.query),
      );
    }
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  void _loadMore() {
    bloc.add(
      SearchResultsEventLoadMore(query: widget.query),
    );
  }

  void _reload() {
    bloc.add(
      SearchResultsEventReload(query: widget.query),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          CustomStrings.searchResults.toUpperCase(),
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
          Expanded(
            child: BlocProvider<SearchResultsBloc>.value(
              value: bloc,
              child: BlocBuilder<SearchResultsBloc, SearchResultsState>(
                builder: (BuildContext context, SearchResultsState state) {
                  if (state is SearchResultsStateLoaded) {
                    return SearchResultsLoadedView(
                      loadedState: state,
                      loadMoreCallback: _loadMore,
                      reloadCallback: _reload,
                    );
                  } else if (state is SearchResultsStateError) {
                    return SearchResultsErrorView(
                      errorState: state,
                      reloadCallback: _reload,
                    );
                  } else {
                    return SearchResultsLoadingView();
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
