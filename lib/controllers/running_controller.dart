import 'dart:async';
import 'package:get/get.dart';
import '../models/route_model/route_model.dart';

///This class is used to control the stopwatch and the running screen
class RunningController extends GetxController {
  final Rx<Stopwatch> stopwatch = Stopwatch().obs;
  final RxBool isRunning = false.obs;
  late Duration elapsedTime;
  late RxString elapsedTimeString;
  late Timer timer;

  final Rxn<RouteModel> selectedRoute = Rxn<RouteModel>();

  @override
  void onInit() {
    super.onInit();
    elapsedTime = Duration.zero;
    elapsedTimeString = _formatElapsedTime(elapsedTime).obs;

    // Create a timer that runs a callback every 100 milliseconds to update UI
    timer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      if (stopwatch.value.isRunning) {
        _updateElapsedTime();
      }
    });
  }

  void startStopwatch() {
    if (!stopwatch.value.isRunning) {
      isRunning.value = true;

      stopwatch.value.start();
      _updateElapsedTime();
    } else {
      isRunning.value = false;
      // Stop the stopwatch
      stopwatch.value.stop();
    }
  }

  // Reset button callback
  void resetStopwatch() {
    // Reset the stopwatch to zero and update elapsed time
    stopwatch.value.reset();
    _updateElapsedTime();
  }

  // Update elapsed time and formatted time string
  void _updateElapsedTime() {
    elapsedTime = stopwatch.value.elapsed;
    elapsedTimeString.value = _formatElapsedTime(elapsedTime);
  }

  String _formatElapsedTime(Duration time) {
    return '${time.inHours.remainder(60).toString().padLeft(2, '0')}:${time.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(time.inSeconds.remainder(60)).toString().padLeft(2, '0')}';
  }
}
