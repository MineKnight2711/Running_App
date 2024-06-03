import 'package:flutter/material.dart';
import 'components/components_export.dart';
import 'package:get/get.dart';
import '../../config/config_export.dart';
import '../../widgets/widget_export.dart';

class PerformanceMetricsScreen extends GetView {
  const PerformanceMetricsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        onBackPress: () => AppRoutes.navigateBack(),
        title: "Performance metrics",
        secondaryAction: ActionButton(
          imagePath: "assets/svg/info.svg",
          onTap: () {
            AppRoutes.navigate(AppRoutes.metricinfo);
          },
        ),
      ),
      body: Container(
        width: AppSpacings.sw(1),
        height: AppSpacings.sh(1),
        decoration: const BoxDecoration(gradient: AppColors.appTheme),
        child: const SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PerformanceRecordWidget(),
              PerformanceBasicWidget(),
              PerformanceIntensityWidget(),
              PerformancePulseRate(),
            ],
          ),
        ),
      ),
    );
  }
}
