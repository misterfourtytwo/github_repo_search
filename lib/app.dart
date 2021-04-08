import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_repo_search/navigation/navigation.dart';
import 'package:github_repo_search/styles/app_theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub repo search',
      theme: appTheme,
      initialRoute: 'home',
      onGenerateRoute: onGenerateRoute,
    );
  }
}
