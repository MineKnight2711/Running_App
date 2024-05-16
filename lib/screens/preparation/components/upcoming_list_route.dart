import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/config_export.dart';
import '../../../models/route_model/route_model.dart';
import 'route_item/route_item.dart';
import 'route_item/upcoming_route_item_options.dart';

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
    return Column(
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
        ...anyTimeRoutes.map(
          (route) => GestureDetector(
            onTap: () => selectedRoute.value = route,
            child: Obx(
              () => RouteItemWidget(
                route: route,
                isSelected: selectedRoute.value == route,
                isSelectedWidget: UpcommingRouteItemOptions(
                  route: route,
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
        timeNavigationRow,
        ...byTimeRoutes.map(
          (route) => GestureDetector(
            onTap: () => selectedRoute.value = route,
            child: Obx(
              () => RouteItemWidget(
                route: route,
                isSelected: selectedRoute.value == route,
                isSelectedWidget: UpcommingRouteItemOptions(
                  route: route,
                ),
              ),
            ),
          ),
        ),
      ],
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
