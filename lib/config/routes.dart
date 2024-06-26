// ignore_for_file: prefer_const_constructors
import 'package:flutter_running_demo/screens/home_screen/home_screen.dart';
import 'package:flutter_running_demo/screens/performance/performance_screen.dart';
import 'package:flutter_running_demo/screens/progress/details_route_screen/details_route_screen.dart';
import 'package:flutter_running_demo/screens/preparation/components/bottom_sheet/components/ready_to_run/load_prepared_road_map.dart';
import 'package:flutter_running_demo/screens/run/components/music_pause_clock.dart';
import 'package:flutter_running_demo/screens/run/components/run_finished.dart';
import 'package:flutter_running_demo/test_widgets/metric_info.dart';
import 'package:flutter_running_demo/test_widgets_demo/test_screen/prepared_complete.dart';
import 'package:flutter_running_demo/test_widgets_demo/test_screen/prepared_note.dart';
import 'package:flutter_running_demo/test_widgets_demo/test_screen/prepared_screen.dart';
import 'package:flutter_running_demo/test_widgets_demo/test_screen/run_map_setting/run_setting/sending_location.dart';
import 'package:flutter_running_demo/test_widgets_demo/test_screen/run_map_setting/run_setting/sensor_status.dart';
import 'package:flutter_running_demo/screens/run/running_show_clock_screen.dart';
import 'package:get/get.dart';
import '../screens/app_tabbar_view/app_tabbar_view.dart';
import '../test_widgets_demo/test_alertdialog/test_remove_confirmation.dart';
import '../test_widgets_demo/test_screen/run_map_setting/run_setting/audio_guidance.dart';
import '../test_widgets_demo/test_screen/run_map_setting/music_provider_sheet/music_provider_sheet.dart';

class AppRoutes {
  static const String _home = '/';
  static const String _tabbarview = '/tabbarview';
  static const String _performanceMetrics = '/performance-metrics';
  static const String _detailRoute = '/detail-route';
  static const String _testconfirmdeletion = '/testconfirmdeletion';
  static const String _testconfirmaddtion = '/testconfirmaddtion';
  static const String _testremoveconfirmation = '/testremoveconfirmation';
  static const String _testeditconfirmation = '/testeditconfirmation';
  static const String _testprepared = '/testprepared';
  static const String _preparedscreen = '/preparedscreen';
  static const String _preparedcomplete = '/preparedcomplete';
  static const String _preparednote = '/preparednote';
  static const String _authorizemusicprovider = '/authorizemusicprovider';
  static const String _audioguidance = '/audioguidance';
  static const String _sennorstatus = '/sennorstatus';
  static const String _runShowClock = '/runShowClock';
  static const String _runshowmap = '/runshowmap';
  static const String _metricinfo = '/metricinfo';
  static const String _sendinglocation = '/sendinglocation';
  static const String _musicpauselock = '/musicpauselock';
  static const String _runfinished = '/runfinished';
  static const String _loadpreparedroadmap = '/loadpreparedroadmap';

  static String get tabbarview => _tabbarview;
  static String get home => _home;
  static String get performanceMetrics => _performanceMetrics;
  static String get detailRoute => _detailRoute;
  static String get testconfirmdeletion => _testconfirmdeletion;
  static String get testconfirmaddtion => _testconfirmaddtion;
  static String get testremoveconfirmation => _testremoveconfirmation;
  static String get testeditconfirmation => _testeditconfirmation;
  static String get testprepared => _testprepared;
  static String get preparedscreen => _preparedscreen;
  static String get preparedcomplete => _preparedcomplete;
  static String get preparednote => _preparednote;
  static String get authorizemusicprovider => _authorizemusicprovider;
  static String get audioguidance => _audioguidance;
  static String get sennorstatus => _sennorstatus;
  static String get runShowClock => _runShowClock;
  static String get runshowmap => _runshowmap;
  static String get metricinfo => _metricinfo;
  static String get sendinglocation => _sendinglocation;
  static String get musicpauselock => _musicpauselock;
  static String get runfinished => _runfinished;
  static String get loadpreparedroadmap => _loadpreparedroadmap;

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
    Get.offNamed(query);
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
      name: _testremoveconfirmation,
      page: () => TestRemoveConfirmation(),
    ),
    GetPage(
        name: _preparedscreen,
        page: () => PreparedScreen(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _preparedcomplete,
        page: () => const PreparedComplete(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _preparednote,
        page: () => PreparedNote(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _authorizemusicprovider,
        page: () => const AuthorizeMusicProvider(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _audioguidance,
        page: () => const AudioGuidance(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _sennorstatus,
        page: () => const SensorStatus(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _runShowClock,
        page: () => RunShowClock(),
        transition: Transition.downToUp),
    GetPage(
        name: _metricinfo,
        page: () => const MetricInfo(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _sendinglocation,
        page: () => const SendingLocation(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _musicpauselock,
        page: () => const MusicPauseClock(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _runfinished,
        page: () => const RunFinished(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _loadpreparedroadmap,
        page: () => const LoadPreparedRoadMap(),
        transition: Transition.rightToLeft),
  ];
}
