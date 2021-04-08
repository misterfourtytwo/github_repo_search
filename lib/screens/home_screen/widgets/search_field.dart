import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_repo_search/screens/screens.dart';
import 'package:github_repo_search/styles/colors.dart';

import 'search_button.dart';

class SearchField extends StatefulWidget {
  SearchField({Key? key}) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  String query = '';
  void _search() {
    if (query.isNotEmpty) {
      Navigator.of(context).pushNamed(
        SearchScreen.routeName,
        arguments: SearchScreenArguments(query: query.toUpperCase()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            width: 1,
            color: MyColors.borderColor,
          )),
      child: SizedBox(
          height: 50,
          child: Row(
            children: [
              SizedBox(
                width: 25,
              ),
              Expanded(
                child: TextField(
                  textInputAction: TextInputAction.search,
                  onChanged: (String updatedQuery) {
                    setState(() {
                      query = updatedQuery;
                    });
                  },
                  onSubmitted: (String query) => _search(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SearchButton(
                  onPressed: _search,
                ),
              ),
            ],
          )),
    );
  }
}
