import 'package:flutter/material.dart';
import 'package:github_repo_search/screens/search_results_screen/search_results_screen.dart';

import 'screens/screens.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub repo search',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case SearchScreen.routeName:
            final SearchScreenArguments arguments =
                settings.arguments as SearchScreenArguments;
            return MaterialPageRoute<void>(
              builder: (context) => SearchScreen(arguments: arguments),
              settings: settings,
            );
          case HomeScreen.routeName:
          default:
            return MaterialPageRoute<void>(
              builder: (context) => HomeScreen(),
              settings: settings,
            );
        }
      },
    );
  }
}


// class CustomPageRoute<T> extends PageRoute<T> {
//   const CustomPageRoute<T>({Key key, this.builder}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Platform.isIos ? CupertinoPageRoute<T>(builder: builder, fullscreenDialog: fullscreenDialog, settings: settings,) :MaterialPageRoute<T>(builder: builder, fullscreenDialog: fullscreenDialog, settings: settings, );
//   }
// }
 
