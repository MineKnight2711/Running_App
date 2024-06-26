import 'package:flutter/material.dart';
import 'package:flutter_running_demo/screens/preparation/components/components_export.dart';
import 'package:flutter_running_demo/widgets/alert_dialogs/confirm_alert_dialogs.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../config/config_export.dart';
import '../../../../../../models/route_model/route_model.dart';
import '../../../../../../utils/navigator_key.dart';

class UpcommingRouteItemOptions extends StatelessWidget {
  final RouteModel route;
  const UpcommingRouteItemOptions({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        height: AppSpacings.vs20 * 2,
        width: AppSpacings.hs30 * 4,
        // alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.basicActivitiesCard,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: NavigatorKeys.secondaryNavigatorKey.currentContext!,
                  builder: (context) => const PreparationScheduleSheet(),
                );
              },
              child: SvgPicture.asset(
                  "assets/svg/preparation/route_item_options/schedule.svg"),
            ),
            InkWell(
              onTap: () {
                Get.dialog(ConfirmAlertDialogs(
                    title: 'Remove confirmation',
                    content: Text(
                      "Are you sure you want to remove the route for upcoming run?",
                      textAlign: TextAlign.center,
                      style: CustomGoogleFonts.roboto(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                    confirmButtonText: "Yes, remove",
                    iconSvgPath: "delete_schedule"));
              },
              child: SvgPicture.asset(
                  "assets/svg/preparation/route_item_options/delete.svg"),
            ),
          ],
        ),
      ),
    );
  }
}
