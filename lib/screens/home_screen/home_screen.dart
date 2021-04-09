import 'package:flutter/material.dart';
import 'package:github_repo_search/resources/strings.dart';
import 'package:github_repo_search/screens/home_screen/widgets/search_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          CustomStrings.search.toUpperCase(),
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 185,
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SearchField(),
            ),
          ),
        ),
      ),
    );
  }
}
