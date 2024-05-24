import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../config/config_export.dart';
import '../../../controllers/preparation_map_controller.dart';

class ReadyToRunHeader extends StatelessWidget {
  final VoidCallback onClosePressed;

  ReadyToRunHeader({
    super.key,
    required this.onClosePressed,
  });
  final mapController = Get.find<MapController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSpacings.vs30 * 2.3,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      color: const Color(0xff2f2828).withOpacity(0.65),
      alignment: Alignment.bottomCenter,
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            mapController.isRunning.value
                ? const SizedBox.shrink()
                : IconButton(
                    onPressed: onClosePressed,
                    icon: const Icon(Icons.close, color: AppColors.white100),
                  ),
            SizedBox(width: AppSpacings.hs10),
            Text(
              mapController.isRunning.value ? "Running" : "Ready to Run",
              style: CustomGoogleFonts.roboto(
                fontSize: AppFontSizes.size18,
                color: TextColor.white,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                SvgPicture.asset(
                    "assets/svg/preparation/map_annotations/gps.svg"),
                const SizedBox(width: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
