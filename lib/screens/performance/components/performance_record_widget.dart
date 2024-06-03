import 'package:flutter/material.dart';
import '../../../config/config_export.dart';
import '../../../widgets/custom_dropdown/custom_dropdown_widget.dart';
import '../../progress/progress_screen/components/route_details/route_details.dart';

class PerformanceRecordWidget extends StatelessWidget {
  const PerformanceRecordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppSpacings.cvs(50)),
        Text(
          "Record",
          style: CustomGoogleFonts.roboto(
            color: AppColors.white100,
            fontSize: AppFontSizes.size18,
          ),
        ),
        SizedBox(
          height: AppSpacings.vs10,
        ),
        CustomDropdownWidget(
          iconData: Icons.directions_walk,
          dropDownHeight: AppSpacings.sh(0.38),
          horizontalButtonPadding: 0,
          title: "23km",
          subtitle: "Longest Walking",
          dropDownWidget: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: RouteDetailsWidget(
              route: routeTempList[2],
            ),
          ),
        ),
        CustomDropdownWidget(
          iconData: Icons.route,
          dropDownHeight: AppSpacings.sh(0.38),
          horizontalButtonPadding: 0,
          title: "100km",
          subtitle: "Longest Route",
          dropDownWidget: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: RouteDetailsWidget(
              route: routeTempList.first,
            ),
          ),
        ),
      ],
    );
  }
}
