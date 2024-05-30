import '../screens/home_screen/home_screen.dart';
import '../screens/performance/performance_screen.dart';
import '../screens/progress/details_route_screen/details_route_screen.dart';
import '../screens/run/run_finished/run_finished.dart';
import '../screens/metric_info_screen/metric_info_screen.dart';
import '../screens/run/show_clock/running_show_clock_screen.dart';
import 'package:get/get.dart';
import '../screens/app_tabbar_view/app_tabbar_view.dart';

class AppRoutes {
  static const String _home = '/';
  static const String _tabbarview = '/tabbarview';
  static const String _performanceMetrics = '/performance-metrics';
  static const String _detailRoute = '/detail-route';
  static const String _runShowClock = '/runShowClock';
  static const String _runshowmap = '/runshowmap';
  static const String _metricinfo = '/metricinfo';
  static const String _runfinished = '/runfinished';

  static String get tabbarview => _tabbarview;
  static String get home => _home;
  static String get performanceMetrics => _performanceMetrics;
  static String get detailRoute => _detailRoute;
  static String get runShowClock => _runShowClock;
  static String get runshowmap => _runshowmap;
  static String get metricinfo => _metricinfo;
  static String get runfinished => _runfinished;

  static navigate(String query) {
    Get.toNamed(
      query,
    );
  }

  static navigateToDetails(String route, dynamic arguments) {
    Get.toNamed(route, arguments: arguments);
  }

  static navigateWithArguments(String route, {required dynamic arguments}) {
    Get.toNamed(route, arguments: arguments);
  }

  static navigateToDetailsWithId(
      String route, String queryParam, String id, dynamic arguments) {
    Get.toNamed(route.replaceFirst(':$queryParam', id), arguments: arguments);
  }

  static navigateReplace(String query) {
    Get.offAndToNamed(query);
  }

  static navigateOffAll(String query) {
    Get.offAllNamed(query);
  }

  static navigateOffUntil(String query) {
    Get.offNamedUntil(
      query,
      (route) => true,
    );
  }

  static navigateBack() {
    Get.back();
  }

  static final List<GetPage> getPages = [
    GetPage(
        name: _home,
        page: () => const HomeScreen(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _tabbarview,
        page: () => const TabBarViewScreen(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _performanceMetrics,
        page: () => PerformanceMetricsScreen(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _detailRoute,
        page: () => DetailsRouteScreen(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _runShowClock,
        page: () => const RunShowClock(),
        transition: Transition.downToUp),
    GetPage(
        name: _metricinfo,
        page: () => const MetricInfo(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _runfinished,
        page: () => const RunFinished(),
        transition: Transition.rightToLeft),
  ];
}
