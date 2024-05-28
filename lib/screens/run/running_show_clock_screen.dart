import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_running_demo/controllers/map_controller.dart';
import 'package:flutter_running_demo/screens/preparation/components/bottom_sheet/components/ready_to_run/components.dart';
import 'package:flutter_running_demo/screens/run/components/custom_record_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'components/record_field_widget.dart';
import 'components/slpit_avarage_widget.dart';
import '../../controllers/running_controller.dart';
import 'components/time_elapsed.dart';

class RunShowClock extends GetView<RunningController> {
  const RunShowClock({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
        decoration: const BoxDecoration(
          color: Color(0xFF222222),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
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
                  SvgPicture.asset(
                      'assets/svg/preparation/map_annotations/gps.svg'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            RecordFieldWidget(
                label: "Time",
                recordField: TimeElapsedWidget(runningController: controller)),
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
            GetBuilder<MapController>(
              builder: (controller) => Hero(
                tag: "running_buttons",
                child: Material(
                  type: MaterialType.transparency,
                  child: RunningButtons(
                      showMapButtonSvg: 'show_map_white',
                      onShowMapPressed: () => Get.back(),
                      mapController: controller),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
