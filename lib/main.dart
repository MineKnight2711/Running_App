import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/routes.dart';
import 'package:flutter_running_demo/utils/navigator_key.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized()
      .addObserver(MyAppLifecycleObserver());

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.tabbarview,
        // home: TestBottomSheet(),
        getPages: AppRoutes.getPages,
        navigatorKey: NavigatorKeys.mainNavigatorKey,
        navigatorObservers: [
          MyNavigatorObserver(),
        ],
        routingCallback: (value) {
          Logger().i('RoutingCallback: $value');
        },
      ),
    );
  }
}
