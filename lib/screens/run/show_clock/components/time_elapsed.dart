import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_running_demo/controllers/running_controller.dart';
import 'package:get/get.dart';

class TimeElapsedWidget extends StatelessWidget {
  final RunningController runningController;
  const TimeElapsedWidget({super.key, required this.runningController});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display elapsed time
          Center(
            child: Obx(
              () => Text(
                runningController.elapsedTimeString.value,
                style: CustomGoogleFonts.roboto(
                    fontSize: 52.0, color: Colors.white),
              ),
            ),
          ),

          // Start/Stop and Reset buttons
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Padding(
          //       padding:
          //           const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          //       child: ElevatedButton(
          //         style: ElevatedButton.styleFrom(
          //           backgroundColor: const Color(0xff2c2a2d),
          //         ),
          //         onPressed: _startStopwatch,
          //         child: Text(
          //           _stopwatch.isRunning ? 'Stop' : 'Start',
          //           style: CustomGoogleFonts.roboto(
          //               fontSize: 14, color: Colors.white),
          //         ),
          //       ),
          //     ),
          //     const SizedBox(width: 20.0),
          //     Padding(
          //       padding:
          //           const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          //       child: ElevatedButton(
          //         style: ElevatedButton.styleFrom(
          //             backgroundColor: const Color(0xff2c2a2d)),
          //         onPressed: _resetStopwatch,
          //         child: Text(
          //           'Reset',
          //           style: CustomGoogleFonts.roboto(
          //               fontSize: 14, color: Colors.white),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
