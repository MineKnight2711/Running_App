import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_running_demo/screens/run/show_clock/components/custom_record_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'components/record_action_row.dart';
import 'components/record_field_widget.dart';
import 'components/slpit_avarage_widget.dart';
import 'running_controller.dart';
import 'components/time_elapsed.dart';

class RunningClock extends StatelessWidget {
  final runningController = Get.put(RunningController());
  RunningClock({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 1.sh,
        decoration: const BoxDecoration(
          color: Color(0xFF222222),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                children: [
                  Text(
                    'Running',
                    style: CustomGoogleFonts.roboto(
                        fontSize: 18, color: Colors.white),
                  ),
                  const Spacer(),
                  const Icon(
                    CupertinoIcons.bitcoin_circle_fill,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            RecordFieldWidget(
                label: "Time",
                recordField:
                    TimeElapsedWidget(runningController: runningController)),
            const SizedBox(height: 15),
            const RecordFieldWidget(
                label: "Avg. pace",
                recordField: CustomRecordWidget(
                  value: "5.27",
                  unit: "/km",
                )),
            const SizedBox(height: 15),
            const RecordFieldWidget(
                label: "Slpit avg. pace",
                recordField: SplitAvaragePaceWidget()),
            const SizedBox(height: 15),
            const RecordFieldWidget(
                label: "Distance",
                recordField: CustomRecordWidget(
                  value: "800",
                  unit: "m",
                )),
            const SizedBox(height: 15),
            const RecordFieldWidget(
                label: "Pulse rate",
                recordField: CustomRecordWidget(
                  value: "126",
                  unit: "BPM",
                )),
            const SizedBox(height: 60),
            RecordActionRowWidget(runningController: runningController),
          ],
        ),
      ),
    );
  }
}
