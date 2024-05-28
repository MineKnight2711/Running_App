import 'package:flutter/material.dart';
import 'package:flutter_running_demo/screens/preparation/components/bottom_sheet/components/load_prepare_route_sheet/components/load_prepare_route_dropdown_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../config/config_export.dart';
import '../../../../../../models/route_model/route_model.dart';

class PreparedRouteMapSheetWidget extends StatelessWidget {
  final ScrollController scrollController;
  final List<RouteModel> scheduleRoutes;
  final List<RouteModel> readyForAnytimeRoutes;
  final BuildContext preparationScreenContext;

  const PreparedRouteMapSheetWidget({
    super.key,
    required this.preparationScreenContext,
    required this.scheduleRoutes,
    required this.readyForAnytimeRoutes,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.h),
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              color: const Color(0xffb4aeab),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Load prepared route map",
                style: CustomGoogleFonts.roboto(
                  fontSize: AppFontSizes.size18,
                  color: TextColor.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              IconButton(
                onPressed: () {
                  AppRoutes.navigateBack();
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              )
            ],
          ),
          Divider(
            thickness: 0.5,
            color: const Color(0xFFFFFFFF).withOpacity(0.2),
          ),
          SizedBox(height: AppSpacings.vs10),
          PrepareRouteMapDropdownButtonWidget(
            preparationScreenContext: preparationScreenContext,
            routes: scheduleRoutes,
            scrollController: scrollController,
            title: scheduleRoutes.isNotEmpty
                ? "Today, 8/15/2023, 5:30 AM"
                : 'No scheduled route for today',
            haveCancelButton: true,
          ),
          PrepareRouteMapDropdownButtonWidget(
            preparationScreenContext: preparationScreenContext,
            routes: readyForAnytimeRoutes,
            scrollController: scrollController,
            title: "Ready for anytime",
            haveCancelButton: false,
          )
        ],
      ),
    );
  }
}
