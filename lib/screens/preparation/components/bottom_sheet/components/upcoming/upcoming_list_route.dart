import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../config/config_export.dart';
import '../../../../../../models/route_model/route_model.dart';
import '../route_item.dart';
import 'upcoming_route_item_options.dart';

class UpcomingListRoute extends StatelessWidget {
  final List<RouteModel> anyTimeRoutes;
  final List<RouteModel> byTimeRoutes;
  final ScrollController? scrollController;
  const UpcomingListRoute({
    super.key,
    required this.scrollController,
    required this.anyTimeRoutes,
    required this.byTimeRoutes,
  });

  @override
  Widget build(BuildContext context) {
    final Rxn<RouteModel> selectedRoute = Rxn<RouteModel>();
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Anytime (${anyTimeRoutes.length})",
            style: CustomGoogleFonts.roboto(
              fontSize: AppFontSizes.size16,
              color: TextColor.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          ...anyTimeRoutes.asMap().entries.map(
                (entry) => GestureDetector(
                  onTap: () => selectedRoute.value = entry.value,
                  child: Obx(
                    () => RouteItemWidget(
                      showDivider: !(entry.key ==
                          anyTimeRoutes.length -
                              1), // Set showDivider to false for the last item
                      route: entry.value,
                      isSelected: selectedRoute.value == entry.value,
                      isSelectedWidget: UpcommingRouteItemOptions(
                        route: entry.value,
                      ),
                    ),
                  ),
                ),
              ),
          Text(
            "By time (${byTimeRoutes.length})",
            style: CustomGoogleFonts.roboto(
              fontSize: AppFontSizes.size16,
              color: TextColor.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          ...byTimeRoutes.asMap().entries.map(
                (entry) => GestureDetector(
                  onTap: () => selectedRoute.value = entry.value,
                  child: Obx(
                    () => RouteItemWidget(
                      showDivider: !(entry.key == byTimeRoutes.length - 1),
                      route: entry.value,
                      isSelected: selectedRoute.value == entry.value,
                      isSelectedWidget: UpcommingRouteItemOptions(
                        route: entry.value,
                      ),
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }

  Widget get timeNavigationRow {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          style: IconButton.styleFrom(
              backgroundColor: AppColors.basicActivitiesCard),
          onPressed: () {},
          icon: const Icon(
            Icons.chevron_left,
            color: AppColors.white100,
          ),
        ),
        Text(
          "Latest run, 27/06/2023",
          style: CustomGoogleFonts.roboto(
              fontSize: AppFontSizes.size14, color: AppColors.white100),
        ),
        IconButton(
          style: IconButton.styleFrom(
              backgroundColor: AppColors.basicActivitiesCard),
          onPressed: () {},
          icon: const Icon(
            Icons.chevron_right,
            color: AppColors.white100,
          ),
        ),
      ],
    );
  }
}
