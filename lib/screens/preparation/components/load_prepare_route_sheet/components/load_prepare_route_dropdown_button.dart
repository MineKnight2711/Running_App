import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../models/route_model/route_model.dart';
import '../../../../../widgets/custom_dropdown/custom_dropdown_widget.dart';
import '../../bottom_sheet/components/route_item.dart';
import 'load_prepare_route_item_option.dart';

class PrepareRouteMapDropdownButtonWidget extends StatelessWidget {
  final String title;
  final List<RouteModel> routes;
  final ScrollController scrollController;
  final bool haveCancelButton;
  final VoidCallback? onLoadPress, onCancelPress;
  const PrepareRouteMapDropdownButtonWidget(
      {super.key,
      required this.routes,
      required this.scrollController,
      this.haveCancelButton = true,
      this.onLoadPress,
      this.onCancelPress,
      required this.title});

  @override
  Widget build(BuildContext context) {
    final selectedRoute = Rxn<RouteModel>();
    return CustomDropdownWidget(
      title: title,
      horizontalButtonPadding: 0,
      dropDownHeight: selectedRoute.value != null
          ? (routes.length * 70.h) + 55.h
          : routes.length * 70.h,
      dropDownWidget: ListView.separated(
        physics: const ClampingScrollPhysics(),
        controller: scrollController,
        padding: EdgeInsets.zero,
        separatorBuilder: (context, index) => const Divider(
          thickness: 0.5,
          height: 0,
        ),
        itemCount: routes.length,
        itemBuilder: (_, index) => GestureDetector(
          onTap: () {
            if (selectedRoute.value == routes[index]) {
              selectedRoute.value == null;
              return;
            }
            selectedRoute.value = routes[index];
          },
          child: Obx(
            () => RouteItemWidget(
              isSelected: selectedRoute.value == routes[index],
              haveSelectedBackGround: false,
              route: routes[index],
              isSelectedWidget: PreparedRouteItemActionWidget(
                haveCancleButton: haveCancelButton,
                onCancelPress: haveCancelButton ? () {} : null,
                onLoadPress: () {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}
