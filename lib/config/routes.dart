// ignore_for_file: prefer_const_constructors

import 'package:flutter_running_demo/screens/home_screen/home_screen.dart';
import 'package:flutter_running_demo/screens/performance/performance_screen.dart';
import 'package:flutter_running_demo/screens/progress/details_route_screen/details_route_screen.dart';
import 'package:flutter_running_demo/test_widgets/metric_info.dart';
import 'package:flutter_running_demo/test_widgets_demo/test_screen/prepared_complete.dart';
import 'package:flutter_running_demo/test_widgets_demo/test_screen/prepared_note.dart';
import 'package:flutter_running_demo/test_widgets_demo/test_screen/prepared_screen.dart';
import 'package:flutter_running_demo/test_widgets_demo/test_screen/run_map_setting/run_setting/sending_location.dart';
import 'package:flutter_running_demo/test_widgets_demo/test_screen/run_show_clock/run_to_ready.dart';
import 'package:flutter_running_demo/test_widgets_demo/test_screen/run_map_setting/run_setting/sennor_status.dart';
import 'package:flutter_running_demo/test_widgets_demo/test_screen/run_show_clock/running_clock.dart';
import 'package:flutter_running_demo/test_widgets_demo/test_screen/run_show_clock/runstop.dart';
import 'package:get/get.dart';
import '../screens/progress/app_tabbar_view.dart/app_tabbar_view.dart';

import '../test_widgets_demo/test_alertdialog/test_remove_confirmation.dart';
import '../test_widgets/test_screen.dart';
import '../test_widgets_demo/test_alertdialog/test_screen2.dart';
import '../test_widgets_demo/test_screen/run_map_setting/run_setting/audio_guidance.dart';
import '../test_widgets_demo/test_screen/run_map_setting/run_setting/map_setting.dart';
import '../test_widgets_demo/test_screen/run_map_setting/music_provider_sheet/music_provider_sheet.dart';

class AppRoutes {
  static const String _home = '/';
  static const String _activities = '/activities';
  static const String _performanceMetrics = '/performance-metrics';
  static const String _detailRoute = '/detail-route';
  static const String _testscreen = '/testscreen';
  static const String _testscreen2 = '/testscreen2';
  static const String _testconfirmdeletion = '/testconfirmdeletion';
  static const String _testconfirmaddtion = '/testconfirmaddtion';
  static const String _testremoveconfirmation = '/testremoveconfirmation';
  static const String _testeditconfirmation = '/testeditconfirmation';
  static const String _testprepared = '/testprepared';
  static const String _preparedscreen = '/preparedscreen';
  static const String _preparedcomplete = '/preparedcomplete';
  static const String _preparednote = '/preparednote';
  static const String _authorizemusicprovider = '/authorizemusicprovider';
  static const String _mapsettingtorun = '/mapsettingtorun';
  static const String _audioguidance = '/audioguidance';
  static const String _sennorstatus = '/sennorstatus';
  static const String _runningclock = '/runningclock';
  static const String _runstop = '/runstop';
  static const String _metricinfo = '/metricinfo';
  static const String _readytorun = '/readytorun';
  static const String _sendinglocation = '/sendinglocation';

  static String get activities => _activities;
  static String get home => _home;
  static String get performanceMetrics => _performanceMetrics;
  static String get detailRoute => _detailRoute;
  static String get testscreen => _testscreen;
  static String get testscreen2 => _testscreen2;
  static String get testconfirmdeletion => _testconfirmdeletion;
  static String get testconfirmaddtion => _testconfirmaddtion;
  static String get testremoveconfirmation => _testremoveconfirmation;
  static String get testeditconfirmation => _testeditconfirmation;
  static String get testprepared => _testprepared;
  static String get preparedscreen => _preparedscreen;
  static String get preparedcomplete => _preparedcomplete;
  static String get preparednote => _preparednote;
  static String get authorizemusicprovider => _authorizemusicprovider;
  static String get mapsettingtorun => _mapsettingtorun;
  static String get audioguidance => _audioguidance;
  static String get sennorstatus => _sennorstatus;
  static String get runningclock => _runningclock;
  static String get runstop => _runstop;
  static String get metricinfo => _metricinfo;
  static String get readytorun => _readytorun;
  static String get sendinglocation => _sendinglocation;

  static navigate(String query) {
    Get.toNamed(
      query,
    );
  }

  static navigateToDetails(String route, dynamic arguments) {
    Get.toNamed(route, arguments: arguments);
  }

  static navigateToDetailsWithId(
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
        name: _home,
        page: () => const HomeScreen(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _activities,
        page: () => const ActivitiesScreen(),
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
        name: _testscreen,
        page: () => TestPerformanceScreen(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _testscreen2,
        page: () => TestPreparationScreen(),
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
        name: _mapsettingtorun,
        page: () => const MapSettingToRun(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _audioguidance,
        page: () => const AudioGuidance(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _sennorstatus,
        page: () => const SennorStatus(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _runningclock,
        page: () => const RunningClock(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _runstop,
        page: () => const RunStop(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _metricinfo,
        page: () => const MetricInfo(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _readytorun,
        page: () => const ReadyToRun(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _sendinglocation,
        page: () => const SendingLocation(),
        transition: Transition.rightToLeft),
  ];
}
