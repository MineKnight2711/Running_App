import 'package:flutter_running_demo/screens/performance/performance_screen.dart';
import 'package:flutter_running_demo/screens/progress/activities/activities_screen.dart';
import 'package:get/get.dart';
import '../screens/progress/activities_details/activities_details.dart';
import '../test_widgets_demo/test_alertdialog/test_comfirm_addtion.dart';
import '../test_widgets_demo/test_alertdialog/test_confirm_deletion.dart';
import '../test_widgets_demo/test_alertdialog/test_edit_confirmation.dart';
import '../test_widgets_demo/test_alertdialog/test_remove_confirmation.dart';
import '../test_widgets/test_screen.dart';
import '../test_widgets_demo/test_alertdialog/test_screen2.dart';
import '../test_widgets_demo/test_screen/test_prepared.dart';

class AppRoutes {
  static const String _activities = '/';
  static const String _activitiesDetails = '/activites-details';
  static const String _performanceMetrics = '/performance-metrics';
  static const String _testscreen = '/testscreen';
  static const String _testscreen2 = '/testscreen2';
  static const String _testconfirmdeletion = '/testconfirmdeletion';
  static const String _testconfirmaddtion = '/testconfirmaddtion';
  static const String _testremoveconfirmation = '/testremoveconfirmation';
  static const String _testeditconfirmation = '/testeditconfirmation';
  static const String _testprepared = '/testprepared';

  static String get activities => _activities;
  static String get activitiesDetais => _activitiesDetails;
  static String get performanceMetrics => _performanceMetrics;
  static String get testscreen => _testscreen;
  static String get testscreen2 => _testscreen2;
  static String get testconfirmdeletion => _testconfirmdeletion;
  static String get testconfirmaddtion => _testconfirmaddtion;
  static String get testremoveconfirmation => _testremoveconfirmation;
  static String get testeditconfirmation => _testeditconfirmation;
  static String get testprepared => _testprepared;

  static navigate(String query) {
    Get.toNamed(query);
  }

  static navigateToDetails(
      String route, String queryParam, String id, dynamic arguments) {
    Get.toNamed(route.replaceFirst(':$queryParam', id), arguments: arguments);
  }

  static navigateReplace(String query) {
    Get.offNamed(query);
  }

  static navigateBack() {
    Get.back();
  }

  static final List<GetPage> getPages = [
    GetPage(
        name: _activities,
        page: () => const ActivitiesScreen(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _activitiesDetails,
        page: () => const ActivitiesDetailsScreen(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _performanceMetrics,
        page: () => PerformanceMetricsScreen(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _testscreen,
        page: () => TestPerformanceScreen(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _testscreen2,
        page: () => TestPreparationScreen(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _testconfirmdeletion,
        page: () => TestConfirmDeletion(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _testconfirmaddtion,
        page: () => TestConfirmAddtion(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _testremoveconfirmation,
        page: () => TestRemoveConfirmation(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _testeditconfirmation,
        page: () => TestEditConfirmation(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _testprepared,
        page: () => TestPrepared(),
        transition: Transition.rightToLeft),
  ];
}
