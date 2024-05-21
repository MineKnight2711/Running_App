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
