import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../config/config_export.dart';
import '../../../models/top_route_model/top_route_model.dart';
import 'top_route_item.dart';

class ListTopRoutes extends StatelessWidget {
  final List<TopRouteModel> topRoutes;
  const ListTopRoutes({
    super.key,
    required this.topRoutes,
  });

  @override
  Widget build(BuildContext context) {
    Rxn<TopRouteModel> selectedRoute = Rxn<TopRouteModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
            child: Text(
              "Top ${topRoutes.length} routes",
              style: CustomGoogleFonts.roboto(
                fontSize: 16.r,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
              height: caculateBodyHeight(),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: topRoutes.length,
                itemBuilder: (context, index) {
                  final route = topRoutes[index];

                  return GestureDetector(
                    onTap: () => selectedRoute.value = route,
                    child: Obx(
                      () => RouteItemWidget(
                        isSelected: selectedRoute.value == route,
                        route: route,
                      ),
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }

  double caculateBodyHeight() {
    final sheetExtraWhiteSpace =
        0.04.sh; //Khoảng trắng thừa khi kéo hết sheet lên trên
    final grabberHeight = 95.h; //Chiều cao của grabber và widget con của nó
    final titleHeight = 20.h; //Chiều cao của title
    final bottomBarHeight = 1.sh / 12; //Chiều cao bottom bar

    final bodyHeight = (1.sh -
        (sheetExtraWhiteSpace + grabberHeight + titleHeight + bottomBarHeight));
    return bodyHeight;
  }
}
