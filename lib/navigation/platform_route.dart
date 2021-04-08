part of 'navigation.dart';

PageRoute<T> platformRoute<T>({
  // String iosTitle = 'route title',
  required WidgetBuilder builder,
  RouteSettings? settings,
  bool fullscreenDialog = false,
}) =>
    Platform.isIOS
        ? CupertinoPageRoute<T>(
            builder: builder,
            fullscreenDialog: fullscreenDialog,
            settings: settings,
            // title: iosTitle,
          )
        : MaterialPageRoute<T>(
            builder: builder,
            fullscreenDialog: fullscreenDialog,
            settings: settings,
          );
