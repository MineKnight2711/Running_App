import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_running_demo/widgets/app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../models/top_route_model/top_route_model.dart';
import 'components/route_details_images.dart';
import 'components/route_details_info.dart';

class DetailsRouteScreen extends GetView {
  final TopRouteModel route = Get.arguments;
  DetailsRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackPress: () => Get.back(),
        title: "Detail route information",
        showHomeButton: false,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        padding: EdgeInsets.only(top: 80.h, left: 20.w, right: 20.w),
        // margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(gradient: AppColors.appTheme),
        child: Column(
          children: [
            RouteDetailInfo(route: route),
            SizedBox(height: 10.h),
            RouteDetailsImages(route: route),
          ],
        ),
      ),
    );
  }
}
