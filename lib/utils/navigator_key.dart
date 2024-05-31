import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

///This class is used to create and control  global navigator keys
class NavigatorKeys {
  static final GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey();
  static final GlobalKey<NavigatorState> secondaryNavigatorKey = GlobalKey();
}

///This class is used to observe the navigation of the app
class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    Logger().i('Route was popped ${route.settings.name}');
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    Logger().i('Route was pushed ${route.settings.name}');
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
  }
}

///This class is used to observe the lifecycle of the app
class MyAppLifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.detached) {
      Logger().i('The app was exited');
    }
  }
}
