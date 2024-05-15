import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../running_controller.dart';

class RecordActionRowWidget extends StatelessWidget {
  const RecordActionRowWidget({
    super.key,
    required this.runningController,
  });

  final RunningController runningController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Icon(Icons.music_note, size: 32, color: Colors.white),
        const SizedBox(width: 32),
        Obx(
          () => ElevatedButton(
            onPressed: () {
              runningController.startStopwatch();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: runningController.isRunnig.value
                  ? const Color(0xffff4747)
                  : Colors.green,
              padding: const EdgeInsets.all(16),
              shape: const CircleBorder(),
            ),
            child: Text(
              runningController.isRunnig.value ? 'Stop' : "Start",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(width: 32),
        const Icon(Icons.lock_open, size: 32, color: Colors.white),
      ],
    );
  }
}
