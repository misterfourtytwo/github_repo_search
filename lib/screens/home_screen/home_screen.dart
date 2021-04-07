import 'package:flutter/material.dart';
import 'package:github_repo_search/screens/themes.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Поиск'.toUpperCase(),
          style: Theme.of(context).appBarTheme.textTheme?.headline6 ??
              fallbackAppBarTheme,
        ),
        centerTitle: true,
      ),
    );
  }
}
