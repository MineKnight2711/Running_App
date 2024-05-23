import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_running_demo/screens/run/ready_to_run/ready_to_run_sheet.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controllers/map_controller.dart';
import '../../../widgets/custom_map_widget/custom_map_widget.dart';

class ReadyToRunScreen extends GetView {
  final mapController = Get.find<MapController>();
  ReadyToRunScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const Icon(Icons.close, color: AppColors.white100),
        titleSpacing: 0,
        backgroundColor: const Color(0xff2f2828).withOpacity(0.65),
        title: Text(
          'Ready to Run',
          style: CustomGoogleFonts.roboto(
            fontSize: AppFontSizes.size18,
            color: TextColor.white,
          ),
        ),
        actions: [
          SvgPicture.asset("assets/svg/preparation/map_annotations/gps.svg"),
          const SizedBox(width: 20),
        ],
      ),
      body: Stack(
        children: [
          CustomMapWidget(),
          const Positioned(bottom: 0, child: ReadyToRunSheet()),
        ],
      ),
    );
  }
}
