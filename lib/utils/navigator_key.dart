import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

class NavigatorKeys {
  static final GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey();
  static final GlobalKey<NavigatorState> secondaryNavigatorKey = GlobalKey();
}

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

class MyAppLifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.detached) {
      Logger().i('The app was exited');
    }
  }
}
