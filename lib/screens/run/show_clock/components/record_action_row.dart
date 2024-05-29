import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/running_controller.dart';

class RecordActionRowWidget extends GetView<RunningController> {
  const RecordActionRowWidget({super.key});

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
              controller.startStopwatch();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: controller.selectedRoute.value != null
                  ? const Color(0xffff4747)
                  : Colors.green,
              padding: const EdgeInsets.all(16),
              shape: const CircleBorder(),
            ),
            child: Text(
              controller.selectedRoute.value != null ? 'Stop' : "Start",
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
