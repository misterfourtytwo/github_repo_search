part of 'navigation.dart';

RouteFactory onGenerateRoute = (RouteSettings settings) {
  switch (settings.name) {
    case SearchScreen.routeName:
      final SearchScreenArguments arguments =
          settings.arguments as SearchScreenArguments;
      return platformRoute<void>(
        builder: (context) => SearchScreen(arguments: arguments),
        settings: settings,
      );
    case HomeScreen.routeName:
    default:
      return platformRoute<void>(
        builder: (context) => HomeScreen(),
        settings: settings,
      );
  }
};
