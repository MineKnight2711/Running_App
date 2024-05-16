import 'package:flutter/material.dart';
import 'package:flutter_running_demo/screens/preparation/components/components_export.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../config/config_export.dart';
import '../../../../models/route_model/route_model.dart';

class UpcommingRouteItemOptions extends StatelessWidget {
  final RouteModel route;
  const UpcommingRouteItemOptions({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        height: AppSpacings.verticalSpacing20 * 2,
        width: AppSpacings.horizontalSpacing30 * 4,
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
                showBottomSheet(
                  context: context,
                  builder: (context) {
                    return const PreparationScheduleSheet();
                  },
                );
              },
              child: SvgPicture.asset(
                  "assets/svg/preparation/route_item_options/schedule.svg"),
            ),
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                  "assets/svg/preparation/route_item_options/delete.svg"),
            ),
          ],
        ),
      ),
    );
  }
}
