import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/route_model/route_model.dart';
import 'route_item/favorites_route_item_options.dart';
import 'route_item/route_item.dart';

class RoutePreparationList extends StatelessWidget {
  final List<RouteModel> routes;
  final ScrollController scrollController;
  const RoutePreparationList({
    super.key,
    required this.routes,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final Rxn<RouteModel> selectedRoute = Rxn<RouteModel>();

    return ListView.separated(
        padding: EdgeInsets.zero,
        controller: scrollController,
        itemCount: routes.length,
        separatorBuilder: (context, index) => const Divider(
              height: 5,
              thickness: 0.4,
            ),
        itemBuilder: (_, index) => GestureDetector(
              onTap: () => selectedRoute.value = routes[index],
              child: Obx(
                () => RouteItemWidget(
                  showDivider: !(index == routes.length - 1),
                  isSelected: selectedRoute.value == routes[index],
                  route: routes[index],
                  isSelectedWidget: RouteItemOption(
                    route: routes[index],
                  ),
                ),
              ),
            ));
  }
}
